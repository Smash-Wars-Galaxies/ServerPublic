import re
from pathlib import Path
from dataclasses import dataclass

# ".definitions/creature_template_manager.lua", // scripts/mobile
# ".definitions/dna_manager.lua", // scripts/managers/dna_manager.lua
# ".definitions/loot_group_map.lua", // scripts/loot
# ".definitions/command_config_manager.lua", // scripts/commands
# ".definitions/permission_level.lua", // scripts/staff
# ".definitions/skill_manager.lua" // scripts/skills

includeFunction = re.compile(r".*registerFunction\(\"(\w+?)\",\s+(.+?)\)")
cFunctionStart = re.compile(r"int\s+\w+::(\w+?)\(lua_State\* L\)")
lua_argument = re.compile(r".*?(\w+)\s=.+lua_to(\w+)\(L,.+(\d)\)")
lua_argument_string = re.compile(r".*?(\w+)\s=.+Lua::getStringParameter\(L\,?(\d+)?\)")


@dataclass
class Argument:
    name: str
    cpp_type: str
    lua_type: str
    lua_index: int

    def to_string(self) -> str:
        retval = ""
        match self.lua_type:
            case "string":
                retval += f"---@param {self.name} string"
            case "number":
                retval += f"---@param {self.name} number"
            case "boolean":
                retval += f"---@param {self.name} boolean"
            case "integer":
                retval += f"---@param {self.name} integer"
            case "userdata":
                retval += f"---@param {self.name} userdata"
        return retval

    def to_overload(self) -> str:
        retval = ""
        match self.lua_type:
            case "string":
                retval += f"{self.name}: string"
            case "number":
                retval += f"{self.name}: number"
            case "boolean":
                retval += f"{self.name}: boolean"
            case "integer":
                retval += f"{self.name}: integer"
            case "userdata":
                retval += f"{self.name}: userdata"
        return retval


@dataclass
class ArgumentSet:
    entries: list[Argument]

    def contains(self, arg: Argument) -> bool:
        for a in self.entries:
            if a.name == arg.name:
                return True
        return False

    def to_documentation(self) -> str:
        retval = ""
        for a in sorted(self.entries, key=lambda a: a.lua_index, reverse=True):
            retval += a.to_string() + "\n"
        return retval

    def to_function(self) -> str:
        return ", ".join(
            [
                a.name
                for a in sorted(self.entries, key=lambda a: a.lua_index, reverse=True)
            ]
        )

    def to_overload(self) -> str:
        return ", ".join(
            [
                a.to_overload()
                for a in sorted(self.entries, key=lambda a: a.lua_index, reverse=True)
            ]
        )


@dataclass
class Function:
    lua_name: str
    cpp_name: str
    arguments: list[ArgumentSet]
    source: str

    def add_argument(self, arg: Argument):
        if len(self.arguments) == 0:
            self.arguments.append(ArgumentSet([]))

        current_args = self.arguments[len(self.arguments) - 1]
        if current_args.contains(arg):
            self.arguments.append(ArgumentSet([arg]))
        else:
            current_args.entries.append(arg)

    def to_string(self) -> str:
        overloads = sorted(self.arguments, key=lambda a: len(a.entries))

        retval = ""
        if len(overloads) > 0:
            retval += overloads[len(overloads) - 1].to_documentation()
        for i, o in enumerate(overloads):
            if i == len(overloads) - 1:
                break
            retval += "---@overload fun(" + o.to_overload() + ")\n"
        retval += f"---@source {f.source}\n"
        retval += f"function {self.lua_name}("
        if len(overloads) > 0:
            retval += overloads[len(overloads) - 1].to_function()
        retval += ")"
        retval += " end"
        return retval


input = Path("MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp")

code_lines = list([x.strip() for x in input.read_text().splitlines()])

functions: list[Function] = []
for line in code_lines:
    if line.strip().startswith("//"):
        continue

    match = includeFunction.search(line)
    if match is None:
        continue

    functions.append(Function(match[1], match[2], [], ""))

depth = 0
for i in range(0, len(code_lines)):
    match = cFunctionStart.search(code_lines[i])
    if match is None:
        continue

    # print(f"Start: {match[1]}")

    defined_at = i

    arguments = []
    while True:
        if code_lines[i].find("{") != -1:
            depth += 1

        if code_lines[i].find("}") != -1:
            depth -= 1

        if depth == 0:
            break

        arg = lua_argument.search(code_lines[i])
        if arg is not None:
            arguments.append(Argument(arg[1], "", arg[2], arg[3]))

        arg = lua_argument_string.search(code_lines[i])
        if arg is not None:
            arguments.append(Argument(arg[1], "", "string", arg[2]))

        i += 1

    for f in functions:
        if f.cpp_name == match[1]:
            f.source = f"{input}:{defined_at}"
            for a in arguments:
                f.add_argument(a)

    # print(f"End: {match[1]}")

for f in functions:
    if f.lua_name == "createEvent":
        for a in f.arguments:
            print(a)
        print(f.to_string())


text = "---@meta\n\n"

for f in functions:
    text += f.to_string() + "\n\n"

output = Path("MMOCoreORB/bin/scripts/screenplays/.definitions/director_manager.lua")
output.write_text(text)
