local chalk = {};

-- init 
local IsLoaded, Loaded, GetService = game.IsLoaded, game.Loaded, game.GetService;

if not IsLoaded(game) then 
    Loaded.Wait(Loaded)
end

local errorline = (debug.traceback or error)();
local assert = function(case)
    if not case then 
        error(errorline);
    end
end

-- variables
local CoreGui = game.GetService(game, "CoreGui");
local Connect, FindFirstChild = Loaded.Connect, game.FindFirstChild;
local format, lower = string.format, string.lower;

local DevConsoleMaster = FindFirstChild(CoreGui, "DevConsoleMaster");
local DevConsole = FindFirstChild(DevConsoleMaster, "DevConsoleWindow");

-- main 
function DescendantAddedEvent(Descendant)
    if Descendant and lower(Descendant.Name) == "msg" then 
        Descendant.RichText = true 
    end 
end; Connect(DevConsole.DescendantAdded, DescendantAddedEvent);

-- functions
function chalk.colorprint(Text, ...)
    assert((Text or type(Text) == "string"));
    assert((... or type(...) == "table"));
    
    local ColorTable = (({...})[1]);
    local R, G, B = ColorTable.R, ColorTable.G, ColorTable.B;
    table.foreach({R, G, B}, function(Index, Count)
        assert((Count or type(Count) == "number"));
    end)
    
    print(format("<font color='rgb(%d, %d, %d)'>%s</font>", R, G, B, Text))
end

return chalk
