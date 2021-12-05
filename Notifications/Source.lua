-- for usage, please refer to the documentation, https://github.com/xaxaxaxaxaxaxaxaxa/Libraries/edit/main/Notifications/Documentation.lua
local library, patches = {
    configuration = {
        FadeInTime = 0.25,
        FadeOutTime = 0.1,
        
        Font = "Code",
        MainColor = Color3.fromRGB(170, 0, 255),
        BackgroundColor = Color3.fromRGB(27, 27, 27),
    },
}, {};

-- init 
if not game.IsLoaded(game) then 
    repeat task.wait() until game.IsLoaded(game)
end

local GetService = game.GetService;
local Service = setmetatable({}, {
    __index = function(_, Index)
        if Index then 
            if GetService(game, Index) then
                return GetService(game, Index)
            else 
                return error(string.format("%s is not a Valid Game Service", Index))
            end
        else 
            return error"No index specified for Service variable"
        end
    end
})

-- variables
local TextService, TweenService = Service.TextService, Service.TweenService;
local UDim2, UDim, Vector2, Rect = UDim2.new, UDim.new, Vector2.new, Rect.new;
local NewInstance, Color3FromRGB = Instance.new, Color3.fromRGB;

local GetDescendants, GetChildren = game.GetDescendants, game.GetChildren;
local IsA, Destroy, Connect = game.IsA, game.Destroy, game.Loaded.Connect;
local find, lower = string.find, string.lower

local PropertiesTable = {["Frame"] = "BackgroundTransparency", ["TextLabel"] = "TextTransparency", ["UIStroke"] = "Transparency"};
local ValidObjectsToFade = {"Frame", "TextLabel", "UIStroke"};

local protectui = ((syn and syn.protect_gui) or protect_gui)
if not protectui then error"No protect_gui function found in your exploit, you are at risk" end

-- script functions
function patches.FixTextSize(Object, FixValue)
    --[[local TextSizeX = TextService.GetTextSize(TextService, 
        Object.Text, Object.TextSize, Object.Font, Vector2(Camera.ViewportSize.X, Object.AbsoluteSize.Y)
    ).X]]--
    
    local TextSize = UDim2(0, Object.TextBounds.X + FixValue, 0, Object.TextBounds.Y + 10)
    Object.Size = TextSize
end

function patches.FadeObject(Object, Speed, Value)
    local Property = PropertiesTable[Object.ClassName]
    
    local TweenServiceInfo = TweenService.Create(TweenService, Object, TweenInfo.new(Speed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        [Property] = Value,
    }); TweenServiceInfo.Play(TweenServiceInfo);
end

function library.importmodule()
    local ScreenGui = NewInstance("ScreenGui");
    if protectui then protectui(ScreenGui) end
    
    ScreenGui.Name = "ciazware_notification_lib"
    ScreenGui.ZIndexBehavior = "Global";
    ScreenGui.Parent = game.GetService(game, "CoreGui");
    
    local BackFrame = NewInstance("Frame")
    BackFrame.Name = "BackFrame"
    BackFrame.BackgroundColor3 = Color3FromRGB(255, 255, 255)
    BackFrame.BackgroundTransparency = 1.000
    BackFrame.Position = UDim2(0.9, 0, 0.860122621, 0)
    BackFrame.Size = UDim2(0, 176, 0, 82)
    BackFrame.Parent = ScreenGui
    
    local BackFrame_ListLayout = NewInstance("UIListLayout")
    BackFrame_ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    BackFrame_ListLayout.Padding = UDim(0, 15)
    BackFrame_ListLayout.Parent = BackFrame
    
    Connect(BackFrame_ListLayout.GetPropertyChangedSignal(BackFrame_ListLayout, "AbsoluteContentSize"), function()
        if #GetChildren(BackFrame) > 1 then 
            BackFrame.Size = UDim2(0, 176, 0, -BackFrame_ListLayout.AbsoluteContentSize.Y + 100)
        end
    end)
    
    local notifications = {}
    
    function notifications.Notify(Title, Description, Duration, ...)
        if not (Title or Description or Duration or ...) or not (type(Title) == "string" or type(Description) == "string" or type(Duration) == "number" or type(...) == "table") then 
            return error"Argument error with function: notifications.Notify(Title, Description, Duration, ConfigurationTable)"
        end
        
        local ConfigurationTable = ({...})[1];
        -- local Position = ConfigurationTable.Position;
        local FadeInTime, FadeOutTime = ConfigurationTable.FadeInTime, ConfigurationTable.FadeOutTime;
        local Font, MainColor, BackgroundColor = ConfigurationTable.Font, ConfigurationTable.MainColor, ConfigurationTable.BackgroundColor;
        
        -- BackFrame.Position = ((lower(Position) == "bottom right" and UDim2(0.9, 0, 0.860122621, 0)) or (lower(Position) == "top right" and UDim2()))
        
        local MainFrame = NewInstance("Frame")
        MainFrame.Name = "MainFrame"
        MainFrame.Parent = ScreenGui
        MainFrame.BackgroundColor3 = BackgroundColor
        MainFrame.BorderColor3 = MainColor
        MainFrame.BorderSizePixel = 2
        MainFrame.Position = UDim2(-0.00254541636, 0, -0.0116585493, 0)
        MainFrame.Size = UDim2(0, 176, 0, 82)
        MainFrame.Parent = BackFrame
        
        local FakeBorderFrame = NewInstance("Frame")
        FakeBorderFrame.Name = "FakeBorderFrame"
        FakeBorderFrame.BackgroundColor3 = Color3FromRGB(255, 255, 255)
        FakeBorderFrame.BackgroundTransparency = 1.000
        FakeBorderFrame.BorderColor3 = Color3FromRGB(30, 30, 30)
        FakeBorderFrame.Position = UDim2(0, 1, 0.00899970811, 0)
        FakeBorderFrame.Size = UDim2(0, 174, 0, 80)
        FakeBorderFrame.Parent = MainFrame
        
        local FakeBorderFrame_Border = NewInstance("UIStroke")
        FakeBorderFrame_Border.ApplyStrokeMode = "Border"
        FakeBorderFrame_Border.Color = Color3FromRGB(44, 44, 44)
        FakeBorderFrame_Border.LineJoinMode = "Miter"
        FakeBorderFrame_Border.Thickness = 2.1 
        FakeBorderFrame_Border.Parent = FakeBorderFrame
        
        local FakeDescriptionBorderFrame = NewInstance("Frame")
        FakeDescriptionBorderFrame.Name = "FakeDescriptionBorderFrame"
        FakeDescriptionBorderFrame.BackgroundColor3 = BackgroundColor
        FakeDescriptionBorderFrame.BorderColor3 = Color3FromRGB(44, 44, 44)
        FakeDescriptionBorderFrame.BorderSizePixel = 2
        FakeDescriptionBorderFrame.Position = UDim2(0.0340000018, 0, 0.426999986, 0)
        FakeDescriptionBorderFrame.Size = UDim2(0, 162, 0, 38)
        FakeDescriptionBorderFrame.Parent = MainFrame
        
        local DescriptionFrame = NewInstance("Frame")
        DescriptionFrame.Name = "DescriptionFrame"
        DescriptionFrame.BackgroundColor3 = BackgroundColor
        DescriptionFrame.BackgroundTransparency = 1.000
        DescriptionFrame.BorderColor3 = MainColor
        DescriptionFrame.Position = UDim2(0.00499999989, 0, 0.0299999993, 0)
        DescriptionFrame.Size = UDim2(0, 160, 0, 36)
        DescriptionFrame.Parent = FakeDescriptionBorderFrame
        
        local DescriptionFrame_Border = NewInstance("UIStroke")
        DescriptionFrame_Border.ApplyStrokeMode = "Border"
        DescriptionFrame_Border.Color = MainColor
        DescriptionFrame_Border.LineJoinMode = "Round"
        DescriptionFrame_Border.Thickness = 1.2
        DescriptionFrame_Border.Parent = DescriptionFrame
        
        local NameLabelSpliterFrame = NewInstance("Frame")
        NameLabelSpliterFrame.Name = "NameLabelSpliterFrame"
        NameLabelSpliterFrame.BackgroundColor3 = MainColor
        NameLabelSpliterFrame.BorderColor3 = MainColor
        NameLabelSpliterFrame.BorderSizePixel = 0
        NameLabelSpliterFrame.Position = UDim2(0.0340000018, 0, 0.270000011, 0)
        NameLabelSpliterFrame.Size = UDim2(0, 163, 0, 1)
        NameLabelSpliterFrame.Parent = MainFrame
        
        local NameLabelSpliterFrame_Border = NewInstance("UIStroke")
        NameLabelSpliterFrame_Border.ApplyStrokeMode = "Border"
        NameLabelSpliterFrame_Border.Color = Color3FromRGB(44, 44, 44)
        NameLabelSpliterFrame_Border.LineJoinMode = "Miter"
        NameLabelSpliterFrame_Border.Thickness = 2.1
        NameLabelSpliterFrame_Border.Parent = NameLabelSpliterFrame
        
        local TitleLabel = NewInstance("TextLabel")
        TitleLabel.Name = "TitleLabel"
        TitleLabel.BackgroundColor3 = Color3FromRGB(255, 255, 255)
        TitleLabel.BackgroundTransparency = 1.000
        TitleLabel.Size = UDim2(0, 67, 0, 22)
        TitleLabel.Font = Font
        TitleLabel.LineHeight = 1.180
        TitleLabel.Text = Title
        TitleLabel.TextColor3 = Color3FromRGB(255, 255, 255)
        TitleLabel.TextSize = 14.000
        TitleLabel.TextStrokeColor3 = Color3FromRGB(255, 255, 255)
        TitleLabel.Parent = MainFrame
        
        patches.FixTextSize(TitleLabel, 15)

        local DescriptionLabel = NewInstance("TextLabel")
        DescriptionLabel.Name = "DescriptionLabel"
        DescriptionLabel.BackgroundColor3 = Color3FromRGB(255, 255, 255)
        DescriptionLabel.BackgroundTransparency = 1.000
        DescriptionLabel.Position = UDim2(0.0284090918, 0, 0.426999718, 0)
        DescriptionLabel.Size = UDim2(0, 162, 0, 37)
        DescriptionLabel.Font = Font
        DescriptionLabel.Text = Description
        DescriptionLabel.TextColor3 = Color3FromRGB(255, 255, 255)
        DescriptionLabel.TextSize = 14.000
        DescriptionLabel.TextStrokeColor3 = Color3FromRGB(255, 255, 255)
        DescriptionLabel.Parent = MainFrame
        
        for Index, Object in next, GetChildren(MainFrame) do 
            if (IsA(Object, "Frame") and not find(Object.Name, "Fake")) or IsA(Object, "TextLabel") then 
                Object[PropertiesTable[Object.ClassName]] = 1
            end
        end
        
        local function FadeInAllDescendants()
            patches.FadeObject(MainFrame, FadeInTime, 0)
            
            for Index, Object in ipairs(GetDescendants(MainFrame)) do 
                if (IsA(Object, "Frame") and not find(Object.Name, "Fake")) or IsA(Object, "TextLabel") or IsA(Object, "UIStroke") then 
                    patches.FadeObject(Object, FadeInTime, 0)
                end
            end
        end
        FadeInAllDescendants()
        
        function FadeOutAllDescendants()
            patches.FadeObject(MainFrame, FadeOutTime, 1)
            
            for Index, Object in ipairs(GetDescendants(MainFrame)) do 
                if IsA(Object, "Frame") or IsA(Object, "TextLabel") or IsA(Object, "UIStroke") then 
                    patches.FadeObject(Object, FadeOutTime, 1)
                end
            end
        end
        
        delay(Duration, function()
            FadeOutAllDescendants()
            
            delay(0.5, function() 
                Destroy(MainFrame) 
            end)
        end)
    end
    
    return notifications
end

return library
