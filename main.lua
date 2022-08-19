local ver = 'v0.0.2beta'

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local ESPLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiriot22/ESP-Lib/main/ESP.lua"))()

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Titanium B | ' .. ver,
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    -- Creates a new tab titled Main
    Player = Window:AddTab('Player'),
	Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
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

local LocalPlayer = Tabs.Player:AddLeftGroupbox('LocalPlayer')

LocalPlayer:AddButton('Rejoin', function()
	local ts = game:GetService("TeleportService")
	ts:Teleport(game.PlaceId, Player)
end)

LocalPlayer:AddButton('Respawn', function()
	Character.Head.Parent = workspace
end)

local ESP = Tabs.Visuals:AddLeftGroupbox('ESP')

ESP:AddToggle('BoxESP', {
	Text = "Master Toggle",
	Default = false,
	Tooltip = "Toggles BoxESP."
})

Toggles.BoxESP:OnChanged(function()
	ESPLib:Toggle(Toggles.BoxESP.Value)
end)

ESP:AddToggle('Tracers', {
	Text = 'Tracers',
	Default = false,
	Tooltip = 'Toggles Tracers.'
})

Toggles.Tracers:OnChanged(function()
	ESPLib.Tracers = Toggles.Tracers.Value
end)

ESP:AddToggle('TeamColor', {
	Text = 'TeamColor',
	Default = false,
	Tooltip = 'Toggles TeamColor for ESP.'
})

Toggles.TeamColor:OnChanged(function()
	ESPLib.TeamColor = Toggles.TeamColor.Value
end)

ESP:AddToggle('FaceCamera', {
	Text = 'FaceCamera',
	Default = false,
	Tooltip = 'Toggles whether or not the esp boxes face you.'
})

Toggles.FaceCamera:OnChanged(function()
	ESPLib.FaceCamera = Toggles.FaceCamera.Value
end)

ESP:AddToggle('AutoRemove', {
	Text = 'AutoRemove',
	Default = false,
	Tooltip = 'Toggles if the esp is destroyed if the object is parented to nil.'
})

ESP:AddLabel('Color'):AddColorPicker('ESPColor', {
    Default = Color3.fromRGB(255, 255, 255), -- Bright green
    Title = 'Box ESP Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ESPColor:OnChanged(function()
    ESPLib.Color = Options.ESPColor.Value
end)

Toggles.AutoRemove:OnChanged(function()

end	)

Library:SetWatermarkVisibility(true)

-- Sets the watermark text
Library:SetWatermark('Titanium | Welcome, ' .. Player.DisplayName .. '! | ' .. ver)

Library.KeybindFrame.Visible = true; -- todo: add a function for this

Library:OnUnload(function()
	ESPLib:Toggle()
    print('TITANIUM - Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
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
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])
