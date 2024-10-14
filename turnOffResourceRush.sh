#!/bin/bash

http PUT -A bearer -a VJaSqx0UyJb3AnmcU0AU+x3a "http://localhost:44443/v1/admin/config/Core3/Resource/SamplingMultiplier?value=1.0"
http PUT -A bearer -a VJaSqx0UyJb3AnmcU0AU+x3a "http://localhost:44443/v1/admin/config/Core3/Resource/FishingMultiplier?value=1.0"
http PUT -A bearer -a VJaSqx0UyJb3AnmcU0AU+x3a "http://localhost:44443/v1/admin/config/Core3/Resource/ForagingMultiplier?value=1.0"
http PUT -A bearer -a VJaSqx0UyJb3AnmcU0AU+x3a "http://localhost:44443/v1/admin/config/Core3/Resource/MilkMultiplier?value=1.0"
http PUT -A bearer -a VJaSqx0UyJb3AnmcU0AU+x3a "http://localhost:44443/v1/admin/config/Core3/Resource/HarvestMultiplier?value=1.0"