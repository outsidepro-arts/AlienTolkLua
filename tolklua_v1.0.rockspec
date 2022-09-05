package = "TolkLua"
version = "1.0"
source = {
	url = "git://github.com/outsidepro-arts/AlienTolkLua",
	tag = "v1.0"
}
description = {
	summary = "Tolk binding for Lua using Alien",
	detailed = [[
TolkLua is a Lua wrapper for Tolk library. Here is fully provided all API of.
Please note
TolkLua uses Alien library for loading main Tolk dynamic library, so you have to Alien be installed in your Lua distributive.
]],
   homepage = "https://github.com/outsidepro-arts/AlienTolkLua",
   license = "MIT/X11"
}
dependencies = {
	"lua >= 5.1, < 5.4",
	"alien"
]
build = {
	type = "builtin",
	modules = {
		tolk = "tolk.lua"
	},
	copy_directories = { "doc", "tests" }
}