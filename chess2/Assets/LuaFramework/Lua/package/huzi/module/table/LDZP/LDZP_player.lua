
local class = require("lib.middleclass")
local PlayerBase = require('package.huzi.module.table.XXZP.XXZP_player')
local QZZPTablePlayer = class("QZZPTablePlayer", PlayerBase)
local Manager = require("package.public.module.function_manager")
local TableUtil = require("package.public.table_util")

QZZPTablePlayer.soundPath = "ldzp"

return QZZPTablePlayer