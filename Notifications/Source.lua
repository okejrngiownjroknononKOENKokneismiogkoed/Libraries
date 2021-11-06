local library = {
    configuration = {
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14, 
        Font = "Code"
    }
}

-- init
if not game.IsLoaded(game) then 
    repeat task.wait() until game.IsLoaded(game)
end

-- variables
local Players, CoreGui, RunService, TweenService, workspace = game.GetService(game, "Players"), game.GetService(game, "CoreGui"), game.GetService(game, "RunService"), game.GetService(game, "TweenService"), game.GetService(game, "Workspace");
local Client, Mouse, Camera = Players.LocalPlayer, Players.LocalPlayer.GetMouse(Players.LocalPlayer), workspace.CurrentCamera
local GetChildren, GetDescendants, Destroy, IsA, Connect = game.GetChildren, game.GetDescendants, game.Destroy, game.IsA, game.Loaded.Connect;
local UDim2, Color3FromRGB, TweenInfo = UDim2.new, Color3.fromRGB, TweenInfo.new;
local protectui = ((syn and syn.protect_gui) or protect_gui or protectgui); do
    if not protectui then 
        error"No protectgui function found in your exploit, you are at risk"
    end
end

local configuration = library.configuration;

-- script functions
function library.new()
    local ScreenGui = Instance.new("ScreenGui"); protectui(ScreenGui)
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui
    
    local HoldingFrame = Instance.new("Frame")
    HoldingFrame.Name = "HoldingFrame"
    HoldingFrame.BackgroundTransparency = 1
    HoldingFrame.BackgroundColor3 = Color3FromRGB(255, 255, 255)
    HoldingFrame.BorderSizePixel = 0
    HoldingFrame.Position = UDim2(0.87, 0, 0.912883461, 0)
    HoldingFrame.Size = UDim2(0, 238, 0, 60)
    HoldingFrame.Parent = ScreenGui
    
    local HoldingFrame_UIListLayout = Instance.new("UIListLayout")
    HoldingFrame_UIListLayout.Name = "HoldingFrame_UIListLayout"
    HoldingFrame_UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    HoldingFrame_UIListLayout.Padding = UDim.new(0, 6)
    HoldingFrame_UIListLayout.Parent = HoldingFrame
    
    Connect(HoldingFrame_UIListLayout.GetPropertyChangedSignal(HoldingFrame_UIListLayout, "AbsoluteContentSize"), function()
        if #GetChildren(HoldingFrame) > 1 then 
            HoldingFrame.Size = UDim2(0, 238, 0, -HoldingFrame_UIListLayout.AbsoluteContentSize.Y + 70)
        end
    end)
    
    -- notification function
    local notifications = {}
    
    function notifications.Notify(Title, Description, Duration, ...)
        if not (Title or Description or Duration or ...) or not (type(Title) == "string" or type(Description) == "string" or type(Duration) == "number" or type(...) == "table") then 
            return error"Argument Error with function: library.Notify(Title, Description, Duration, SettingsTable)"
        end
        
        local Settings = ({...})[1];
        local TextColor3, TextSize, Font = Settings.TextColor3, Settings.TextSize, Settings.Font;
        
        if not (TextColor3 or TextSize or Font) or not (typeof(TextColor3) == "Instance" or type(TextSize) == "number") then 
            return error"Argument Error with SettingsTable, function: library.Notify(Title, Text, Description, Duration, SettingsTable)"
        end
        
        local NotificationFrame = Instance.new("Frame")
        NotificationFrame.Name = "NotificationFrame"
        NotificationFrame.BackgroundColor3 = Color3FromRGB(30, 30, 30)
        NotificationFrame.BackgroundTransparency = 0
        NotificationFrame.BorderColor3 = Color3FromRGB(170, 0, 255)
        NotificationFrame.Position = UDim2(-0.00304841995, 0, -0.00102490187, 0)
        NotificationFrame.Size = UDim2(0, 239, 0, 59)
        NotificationFrame.Parent = HoldingFrame
        
        local TitleDividerFrame = Instance.new("Frame")
        TitleDividerFrame.Name = "TitleDividerFrame"
        TitleDividerFrame.BackgroundColor3 = Color3FromRGB(170, 0, 255)
        TitleDividerFrame.BorderSizePixel = 0
        TitleDividerFrame.Position = UDim2(0, 0, 0.297916651, 0)
        TitleDividerFrame.Size = UDim2(0, 239, 0, 1)
        TitleDividerFrame.Parent = NotificationFrame
    
        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Name = "TitleLabel"
        TitleLabel.BackgroundColor3 = Color3FromRGB(255, 255, 255)
        TitleLabel.BackgroundTransparency = 1.000
        TitleLabel.Position = UDim2(0.00303566898, 0, 0, 0)
        TitleLabel.Size = UDim2(0, 238, 0, 17)
        TitleLabel.Font = Font
        TitleLabel.Text = Title
        TitleLabel.TextColor3 = TextColor3
        TitleLabel.TextSize = TextSize
        TitleLabel.TextStrokeColor3 = TextColor3
        TitleLabel.Parent = NotificationFrame
        
        local DescriptionLabel = Instance.new("TextLabel")
        DescriptionLabel.Name = "DescriptionLabel"
        DescriptionLabel.BackgroundColor3 = Color3FromRGB(255, 255, 255)
        DescriptionLabel.BackgroundTransparency = 1.000
        DescriptionLabel.Position = UDim2(0, 0, 0.314865887, 0)
        DescriptionLabel.Size = UDim2(0, 239, 0, 39)
        DescriptionLabel.Font = Font
        DescriptionLabel.Text = Description
        DescriptionLabel.TextColor3 = TextColor3
        DescriptionLabel.TextSize = TextSize
        DescriptionLabel.TextStrokeColor3 = TextColor3
        DescriptionLabel.Parent = NotificationFrame
        
        wait(Duration)
        Destroy(NotificationFrame)
    
        -- i will add tweening later
    end
    
    return notifications
end

return library
