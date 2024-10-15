#!/bin/bash

http PUT "http://localhost:44443/v1/admin/config/Core3/Resource/SamplingMultiplier?value=2.0" "Authorization:Bearer VJaSqx0UyJb3AnmcU0AU+x3a"
http PUT "http://localhost:44443/v1/admin/config/Core3/Resource/MilkMultiplier?value=4.0" "Authorization:Bearer VJaSqx0UyJb3AnmcU0AU+x3a"
http PUT "http://localhost:44443/v1/admin/config/Core3/Resource/ForagingMultiplier?value=3.0" "Authorization:Bearer VJaSqx0UyJb3AnmcU0AU+x3a"
http PUT "http://localhost:44443/v1/admin/config/Core3/Resource/FishingMultiplier?value=4.0" "Authorization:Bearer VJaSqx0UyJb3AnmcU0AU+x3a"
http PUT "http://localhost:44443/v1/admin/config/Core3/Resource/HarvestingMultiplier?value=1.5" "Authorization:Bearer VJaSqx0UyJb3AnmcU0AU+x3a"
