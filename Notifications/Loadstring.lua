-- for usage, please refer to the docs, https://github.com/xaxaxaxaxaxaxaxaxa/Libraries/edit/main/Notifications/Documentation.lua
local source = loadstring(game:HttpGet("https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/Notifications/Source.lua", true))();
source.configuration = {
    FadeInTime = 0.25, -- The time it takes for the notification elements to fade into your visibility when you call the Notify function
    FadeOutTime = 0.1, -- The time it takes for the notification elements to fade out once the notification is over
        
    Font = "Code", -- The font of all the text in the notification, https://developer.roblox.com/en-us/api-reference/enum/Font
    MainColor = Color3.fromRGB(170, 0, 255), -- The main color of the notification frame, https://www.rapidtables.com/web/color/RGB_Color.html
    BackgroundColor = Color3.fromRGB(27, 27, 27), -- The background color of the notification frame, https://www.rapidtables.com/web/color/RGB_Color.html
}
