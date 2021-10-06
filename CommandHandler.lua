-- alternative to the chat command library - https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/ChatCommands.lua
-- this one is compatible better compatible with things like command bars (textboxes)

-- init
if not game.IsLoaded(game) then 
    repeat task.wait() until game.IsLoaded(game)
end

-- variables
local Client = game.GetService(game, "Players").LocalPlayer
local Commands = {}

local utility = {
    CommandPrefix = ";",
}

-- functions 
function utility.AddCommand(Aliases, Description, Callback)
    Aliases = Aliases or {"Alias"};
    Description = Description or "Description";
    Callback = Callback or function()
        return error"No Callback specified for: Commands.AddCommand";
    end
    
    local CommandData = {
        Aliases = Aliases, 
        Description = Description,
        Callback = Callback,
    }
    
    Commands[#Commands + 1] = CommandData
end

function utility.GetCommandCallback(v)
    v = v or "Command";
    
    for _, Command in next, Commands do 
        if Command and table.find(Command.Aliases, v) then 
            return Command.Callback 
        end
    end
end 
-- credits to iy & cyrus
function utility.RunCommand(Command)
    Command = ((Command and string.lower(Command)) or "Command");
    
    if string.sub(Command, 1, string.len(utility.CommandPrefix)) == utility.CommandPrefix then 
        local ParsedCommand = string.split(string.sub(Command, string.len(utility.CommandPrefix) + 1), " ")
        local CommandCallback = utility.GetCommandCallback(table.remove(ParsedCommand, 1))
        
        if ParsedCommand and CommandCallback then
            return CommandCallback(ParsedCommand)
        end
    end
end
Client.Chatted:Connect(utility.RunCommand)
--[[ 
or if you're using something like a textbox you can alternatively do: 
TextBox.FocusLost:Connect(function()
     utility.RunCommand(utility.CommandPrefix .. TextBox.Text)
     -- you can add checks like string.len on text and what not also
end)
]]--

utility.AddCommand({"reset"}, "Resets your Character", function()
    if Client.Character then 
        Client.Character.BreakJoints(Client.Character) 
    end
end)
