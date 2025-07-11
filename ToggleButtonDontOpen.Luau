-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui1 = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

--Properties:

ScreenGui1.Name = "ScreenGui1"
ScreenGui1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageLabel.Parent = ScreenGui1
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0, 200, 0, 200)
ImageLabel.Size = UDim2.new(0.0663024485, 0, 0.128270373, 0)
ImageLabel.Image = "rbxassetid://140083695140270"

UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = ImageLabel

UIAspectRatioConstraint.Parent = ImageLabel

-- Scripts:

local function TWEYO_fake_script() -- ImageLabel.Ui 
	local script = Instance.new('Script', ImageLabel)

	gui_name = script.Parent
	
	while true do --infinite loop
	wait(0.01) --waits 0.01 seconds before every spin
		gui_name.Rotation = gui_name.Rotation +3 --adds 1 degree every 0.03 seconds
	end
end
coroutine.wrap(TWEYO_fake_script)()
local function AWKEYN_fake_script() -- ImageLabel.Dragify 
	local script = Instance.new('LocalScript', ImageLabel)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(AWKEYN_fake_script)()
local function ABWC_fake_script() -- ImageLabel.LocalScript 
	local script = Instance.new('LocalScript', ImageLabel)

	local btn = script.Parent
	
	btn.InputBegan:Connect(function()
		DarkaiX:ToggleUI()
	end)
end
coroutine.wrap(ABWC_fake_script)()
