-- Import the library from the github repository
local chalk = loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/Chalk/Source.lua"))()

-- Call the "colorprint" function
chalk.colorprint("Your message here", {R = ColorHere, G = ColorHere, B = ColorHere});

--[[ Example

chalk.colorprint("Hello World", {R = 255, G = 12, B = 10});

]]--
