--[[
Documentation for: https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/PresetFunctions/Source.lua
Updated as of: 10/23/2021
=================================================================================================================

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xaxaxaxaxaxaxaxaxa/Libraries/main/PresetFunctions/Source.lua", true))()
==============================================================================================================================================

Custom functions = [
    Notify = [
        lib.Notify(Title<string>, Text<string>, Duration<number>)
        
        Example - lib.Notify("Title here", "Text here", 3)
    ],
    
    GetCharacter = [
        lib.GetCharacter(Player<instance>), returns Players Character: Player.Character
        
        Example - lib.GetCharacter(game.Players.PlayerHere)
    ],
    
    GetHumanoid = [
        lib.GetHumanoid(Player<instance>), returns Players Humanoid: Player.Character.Humanoid
        
        Example - lib.GetHumanoid(game.Players.PlayerHere)
    ]
    
    GetAttribute = [
        lib.GetAttribute(Object<instance>, <string>), returns Attribute
        
        Example - lib.GetAttribute(InstanceHere, ChildOfInstance)
    ]
    
    GetRoot = [
        lib.GetRoot(Player<instance>), returns the RootPart or Torso of selected Player 
        
        Example - lib.GetRoot(PlayerHere)
    ]
    
    IsPlayerAlive = [
        lib.IsPlayerAlive(Player<instance>), returns if the Player is Alive (Based on Humanoid Health)
        
        lib.IsPlayerAlive(PlayerHere)
    ]
    
    GetClosestPlayerToMouse = [
        lib.GetClosestPlayerToMouse(MaxDistanceYourMouseCanBeAwayFromSomeone<number>), returns the Closest Player to your Mouse 
        
        lib.GetClosestPlayerToMouse(NumberHere)
    ]
]
]]--
