--[[
Documentation for: https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/Notifications/Source.lua
Updated as of: 12/5/2021
===============================================================================================================

local source = loadstring(game:HttpGet("https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/Notifications/Source.lua", true))();
source.configuration = {
    FadeInTime = 0.25, -- The time it takes for the notification elements to fade into your visibility when you call the Notify function
    FadeOutTime = 0.1, -- The time it takes for the notification elements to fade out once the notification is over
        
    Font = "Code", -- The font of all the text in the notification, https://developer.roblox.com/en-us/api-reference/enum/Font
    MainColor = Color3.fromRGB(170, 0, 255), -- The main color of the notification frame, https://www.rapidtables.com/web/color/RGB_Color.html
    BackgroundColor = Color3.fromRGB(27, 27, 27), -- The background color of the notification frame, https://www.rapidtables.com/web/color/RGB_Color.html
}

local lib = source.importmodule()
=================================

Custom functions = [
    Notify = [
        lib.Notify(Title<string>, Description<string>, Duration<number>, Configuration<table>)
        
        Example - lib.Notify("ciazware", "Test", 3, source.configuration)
    ]
]

-- Whole example:

local source = loadstring(game:HttpGet("https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/Notifications/Source.lua", true))();
source.configuration = {
    FadeInTime = 0.25, 
    FadeOutTime = 0.1, 
        
    Font = "Code", 
    MainColor = Color3.fromRGB(170, 0, 255), 
    BackgroundColor = Color3.fromRGB(27, 27, 27), 
}

local lib = source.importmodule()
lib.Notify("title", "description", 3, source.configuration)
]]--
