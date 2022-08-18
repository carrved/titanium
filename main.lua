-- Gui to Lua
-- Version: 3.2

-- Instances:

local Titanium = Instance.new("ScreenGui")
local WelcomeMessage = Instance.new("Frame")
local Shadow = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Body = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local Shadow_2 = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local TextLabel = Instance.new("TextLabel")

--Properties:

Titanium.Name = "Titanium"
Titanium.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Titanium.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

WelcomeMessage.Name = "WelcomeMessage"
WelcomeMessage.Parent = Titanium
WelcomeMessage.AnchorPoint = Vector2.new(0.5, 0.5)
WelcomeMessage.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
WelcomeMessage.BorderSizePixel = 0
WelcomeMessage.Position = UDim2.new(0.5, 0, 0.5, 0)
WelcomeMessage.Size = UDim2.new(0, 550, 0, 350)

Shadow.Name = "Shadow"
Shadow.Parent = WelcomeMessage
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(0, 560, 0, 360)
Shadow.Style = Enum.FrameStyle.DropShadow

Title.Name = "Title"
Title.Parent = WelcomeMessage
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.318181813, 0, 0.0628571436, 0)
Title.Size = UDim2.new(0, 200, 0, 50)
Title.Font = Enum.Font.Ubuntu
Title.Text = "Hello!"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Body.Name = "Body"
Body.Parent = WelcomeMessage
Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Body.BackgroundTransparency = 1.000
Body.BorderSizePixel = 0
Body.Position = UDim2.new(0.0218181815, 0, 0.217142865, 0)
Body.Size = UDim2.new(0, 526, 0, 197)
Body.Font = Enum.Font.Ubuntu
Body.Text = "Welcome to Titanium B! This is a really cool utility script made by z4#4332, and it took him a long time. If you could, please join the discord at .gg/GSdA9bEqgz. Thank you for using Titanium, and please enjoy!"
Body.TextColor3 = Color3.fromRGB(255, 255, 255)
Body.TextSize = 20.000
Body.TextWrapped = true
Body.TextYAlignment = Enum.TextYAlignment.Top

Button.Name = "Button"
Button.Parent = WelcomeMessage
Button.AnchorPoint = Vector2.new(0.5, 0.5)
Button.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.5, 0, 0.885714293, 0)
Button.Size = UDim2.new(0, 180, 0, 45)
Button.ZIndex = 2
Button.Font = Enum.Font.GothamMedium
Button.Text = ""
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.TextSize = 14.000
Button.TextStrokeColor3 = Color3.fromRGB(42, 42, 42)
Button.TextWrapped = true

Shadow_2.Name = "Shadow"
Shadow_2.Parent = Button
Shadow_2.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
Shadow_2.BorderSizePixel = 0
Shadow_2.Size = UDim2.new(1, 0, 1, 4)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 127))}
UIGradient.Parent = Shadow_2

TextLabel.Parent = Button
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
TextLabel.Size = UDim2.new(1, -20, 1, -20)
TextLabel.ZIndex = 2
TextLabel.Font = Enum.Font.GothamMedium
TextLabel.Text = "Continue"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

-- Scripts:

local function BSKTXLI_fake_script() -- WelcomeMessage.InitialTween 
	local script = Instance.new('LocalScript', WelcomeMessage)

	_G.Welcomed = false
	
	if not _G.Welcomed then return end
	
	local frame = script.Parent
	local shadow = frame.Shadow
	local title = frame.Title
	local body = frame.Body
	local button = frame.Button
	frame.Size = UDim2.new(0, 0, 0, 0)
	shadow.Size = UDim2.new(0, 0, 0, 0)
	title.Size = UDim2.new(0, 0, 0, 0)
	body.Size = UDim2.new(0, 0, 0, 0)
	button.Size = UDim2.new(0, 0, 0, 0)
	
	wait(1)
	
	frame:TweenSize(UDim2.new(0, 550, 0, 350))
	shadow:TweenSize(UDim2.new(0, 560, 0, 360))
	title:TweenSize(UDim2.new(0, 200, 0, 50))
	body:TweenSize(UDim2.new(0, 526, 0, 197))
	button:TweenSize(UDim2.new(0, 180, 0, 45))
	
	wait(10)
end
coroutine.wrap(BSKTXLI_fake_script)()
local function WKAUHTL_fake_script() -- Shadow_2.Hover 
	local script = Instance.new('LocalScript', Shadow_2)

	-- https://devforum.roblox.com/t/4-uigradient-animations-including-rainbow/557922
	
	
	
	local button = script.Parent
	local gradient = button.UIGradient
	local ts = game:GetService("TweenService")
	local ti = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local s, kpt, ran = ColorSequence.new, ColorSequenceKeypoint.new, math.random
	local offset1 = {Offset = Vector2.new(0, 0)} --hover in, so that the gradient is visible
	local offset2 = {Offset = Vector2.new(-1, 0)} --hover out, but to one side
	local offset3 = {Offset = Vector2.new(1, 0)} --hover out, but to another side
	local create1 = ts:Create(gradient, ti, offset1)
	local create2 = ts:Create(gradient, ti, offset2)
	local create3 = ts:Create(gradient, ti, offset3)
	local startPos = Vector2.new(-1, 0) --start off in a solid color
	local hover = 1 --used to indicate which offset value it will tween to to get a different color upon the mouse leaving the button
	
	--[[
	
	We'll use modulus with the "hover" variable to check if the number is even or odd, 
	if even then tween to one side, else tween to the other
	
	]]
	
	button.MouseEnter:Connect(function()
	
		create1:Play() --tween to the middle/the area with the gradient
	
	end)
	
	button.MouseLeave:Connect(function()
	
		--[[if even, then tween to the right, else, tween to the left]]
	
		if hover %  2 == 0 then create2:Play() else create3:Play() end
	
		hover = hover + 1 --increase hover to switch hover out colors
	
	end)
end
coroutine.wrap(WKAUHTL_fake_script)()
local function UILCFQZ_fake_script() -- Button.Handler 
	local script = Instance.new('LocalScript', Button)

	local button = script.Parent
	local frame = script.Parent.Parent
	local shadow = frame.Shadow
	local title = frame.Title
	local body = frame.Body
	
	button.MouseButton1Click:Connect(function()
		frame:TweenSize(UDim2.new(0, 0, 0, 0))
		shadow:TweenSize(UDim2.new(0, 0, 0, 0))
		title:TweenSize(UDim2.new(0, 0, 0, 0))
		body:TweenSize(UDim2.new(0, 0, 0, 0))
		button:TweenSize(UDim2.new(0, 0, 0, 0))
		frame.Visible = false
		
		_G.Welcomed = true
	end)
end
coroutine.wrap(UILCFQZ_fake_script)()
