-- library for preset functions that i use so i dont have to CnP the same functions in every script

--[[
If you would like to use this, here is an example

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/PresetFunctions.lua", true))()

print(typeof(lib.GetAttribute(game.GetService(game, "Players").LocalPlayer.Character, "Right Arm")))
^^ prints the typeof, of "Right Arm"
]]--

-- init
local utility = {}

if not game.IsLoaded(game) then
    repeat wait() until game.IsLoaded(game)
end

getgenv().Service = setmetatable({}, {
    __index = function(_, Index)
        if Index then 
            return game.GetService(game, Index)
        else 
            return error"No Service specified for custom index function"
        end
    end
})

-- variables
local Players, workspace = Service.Players, Service.Workspace;
local Client, Mouse, Camera = Players.LocalPlayer, Players.LocalPlayer.GetMouse(Players.LocalPlayer), workspace.CurrentCamera;
local FindFirstChild, FindFirstChildOfClass, FindFirstChildWhichIsA = game.FindFirstChild, game.FindFirstChildOfClass, game.FindFirstChildWhichIsA;
local Vector2 = Vector2.new;

-- script functions
function utility.GetCharacter(Player)
    if not Player then return error"No Player specified for utility.GetCharacter(Player)" end
    
    return Player.Character or Player.CharacterAdded:Wait()
end

function utility.GetHumanoid(Player)
    if not Player then return error"No Player specified for utility.GetHumanoid(Player)" end
    
    local Humanoid = FindFirstChildOfClass(utility.GetCharacter(Player), "Humanoid")
    
    if Humanoid then 
        return Humanoid
    end
end

function utility.GetAttribute(Player, Attribute)
    if not Player then return error"No Player specified for utility.GetAttribute(Player, Attribute)" end
    if not Attribute then return error"No Attribute specified for utility.GetAttribute(Player, Attribute)" end
    
    local Part = FindFirstChildOfClass(Player, Attribute)
    
    if not Part then 
        Part = FindFirstChild(Player, Attribute)
    end 
    
    if Part then 
        return Part
    end
end

function utility.GetRoot(Player)
    if not Player then return error"No Player specified for utility.GetRoot(Player)" end
    
    local Root = utility.GetAttribute(utility.GetCharacter(Player), "HumanoidRootPart") or utility.GetAttribute(utility.GetCharacter(Player), "Torso") or utility.GetAttribute(utility.GetCharacter(Player), "UpperTorso");
    
    if Root then 
        return Root
    end
end

function utility.IsPlayerAlive(Player)
    if not Player then return error"No Player specified for utility.IsPlayerAlive(Player)" end
    
    local PlayersHumanoid = utility.GetHumanoid(Player)
    
    if not PlayersHumanoid or PlayersHumanoid.Health == 0 then 
        return false 
    end
    
    return true
end

function utility.GetClosestPlayerToMouse(MaxDistance)
    if not MaxDistance then return error"No MaxDistance specified for utility.GetClosestPlayerToMouse(MaxDistance)" end
    
    local Player = nil 
    
    for _, v in next, Players.GetPlayers(Players) do
        if v and v.Name ~= Client.Name then 
            local PlayersRoot = utility.GetRoot(v)
            
            if not PlayersRoot or not utility.IsPlayerAlive(v) then 
                return
            end
            
            local RootToViewportPoint = Camera.WorldToViewportPoint(Camera, PlayersRoot.Position)
            local Magnitude = ((Vector2(RootToViewportPoint.X, RootToViewportPoint.Y) - Vector2(Mouse.X, Mouse.Y)).Magnitude)
            
            if Magnitude < MaxDistance then 
                Player = v 
            end
        end
    end
    
    if Player then 
        return Player
    end
end

return utility
