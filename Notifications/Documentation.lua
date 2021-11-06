--[[
Documentation for: https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/Notifications/Source.lua
Updated as of: 11/6/2021
===============================================================================================================

local source = loadstring(game:HttpGet("https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/Notifications/Source.lua", true))();
source.configuration = {
    TextColor3 = Color3.fromRGB(255, 255, 255), -- https://www.rapidtables.com/web/color/RGB_Color.html
    TextSize = 14, -- any number you want
    Font = "Code", -- https://developer.roblox.com/en-us/api-reference/enum/Font
}

local lib = source.new()
========================

Custom functions = [
    Notify = [
        lib.Notify(Title<string>, Description<string>, Duration<number>, Settings<table>)
        
        Example - lib.Notify("ciazware", "Test", 3, source.configuration)
    ]
]

]]--
