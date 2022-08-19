local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local Camera = workspace.CurrentCamera

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Titanium B',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    -- Creates a new tab titled Main
    Player = Window:AddTab('Player'),
	Visuals = Window:AddTab('Visuals'),
    ['Config'] = Window:AddTab('Config'),
}

local Movement = Tabs.Player:AddLeftGroupbox('Movement')

Movement:AddSlider('WalkSpeed', {
	Text = 'WalkSpeed',
	Default = 16,
	Min = 16,
	Max = 500,
	Rounding = 1,
	Compact = false,
})

local WalkSpeedVar = Options.WalkSpeed.Value
Options.WalkSpeed:OnChanged(function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Options.WalkSpeed.Value
end)

local Body = Tabs.Player:AddLeftGroupbox('Body')

Body:AddButton('No Arms', function()
	if Humanoid.RigType == Enum.HumanoidRigType.R15 then
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "RightUpperArm" or
				v.Name == "LeftUpperArm" then
				v:Destroy()
			end
		end
	else
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "Right Arm" or
				v.Name == "Left Arm" then
				v:Destroy()
			end
		end
	end
end)

Body:AddButton('No Legs', function()
	if Humanoid.RigType == Enum.HumanoidRigType.R15 then
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "RightUpperLeg" or
				v.Name == "LeftUpperLeg" then
				v:Destroy()
			end
		end
	else
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "Right Leg" or
				v.Name == "Left Leg" then
				v:Destroy()
			end
		end
	end
end)



Body:AddButton('No Limbs', function()
	if Humanoid.RigType == Enum.HumanoidRigType.R15 then
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "RightUpperLeg" or
				v.Name == "LeftUpperLeg" or
				v.Name == "RightUpperArm" or
				v.Name == "LeftUpperArm" then
				v:Destroy()
			end
		end
	else
		for i,v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "Right Leg" or
				v.Name == "Left Leg" or
				v.Name == "Right Arm" or
				v.Name == "Left Arm" then
				v:Destroy()
			end
		end
	end
end)

Body:AddButton('Remove Accessories', function()
	for i,v in next, Character:GetDescendants() do
		if v:IsA("Accessory") then
			for i,p in next, v:GetDescendants() do
				if p:IsA("Weld") then
					p:Destroy()
				end
			end
		end
	end
end)

local ESP = Tabs.Player:AddLeftGroupbox('ESP')

ESP:AddToggle('Tracers', {
	local TracerLine = Drawing.new("Line")
	TracerLine.Color = Color3.fromRGB(255, 255, 255)
	TracerLine.Thickness = TracerThick
})

ESP:AddSlider('TracerThickness', {
	Text = 'Tracer Thickness',
	Default = 1,
	Min = 1,
	Max = 50,
	Rounding = 1,
	Compact = false,
})

local TracerThick = Options.TracerThickness.Value
Options.TracerThickness:OnChanged(function()
	TracerThick = Options.TracerThickness.Value
end)


-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

-- Sets the watermark text
Library:SetWatermark('Titanium B | v0.0.1beta')

Library.KeybindFrame.Visible = true; -- todo: add a function for this

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['Config']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('titanium')
SaveManager:SetFolder('titanium/saves')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])
