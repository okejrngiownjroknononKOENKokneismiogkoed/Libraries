if not game.IsLoaded(game) then 
    repeat task.wait() until game.IsLoaded(game)
end

-- variables
local ChatCommandPrefix = ";" -- put the prefix you want here, if you want it to be like "/e" make it "/e "
local Client = game.GetService(game, "Players").LocalPlayer

-- functions
function ChattedEvent(Message)
    if not Message or Message == " " then return end 
    Message = string.lower(Message)
    
    if string.sub(Message, 1, string.len(ChatCommandPrefix)) == ChatCommandPrefix then 
        local Arguments = string.split(string.sub(Message, string.len(ChatCommandPrefix) + 1), " ") -- + 1 so it doesnt parse the wrong character
        
        -- Example commands (you can add your own)
        if Arguments[1] == "reset" then 
            if Client.Character then 
                Client.Character.BreakJoints(Client.Character)
            end
        elseif Arguments[1] == "print" and Arguments[2] then 
            table.foreach(Arguments, function(Index, Value)
                if Index > 1 then 
                    print(Value)
                end
            end)
        end
    end
end
Client.Chatted:Connect(ChattedEvent)
