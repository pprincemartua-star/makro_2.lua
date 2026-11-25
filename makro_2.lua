
--[[
    PRINCE MACRO BLUE V2
    Roblox Delta / Mobile
    GUI Demo
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PRINCE_MACRO_BLUE"
gui.ResetOnSpawn = false

local parent = (gethui and gethui()) or
    game:GetService("CoreGui")

gui.Parent = parent

local blue = Color3.fromRGB(20, 130, 255)
local dark = Color3.fromRGB(8, 20, 42)

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(290, 350)
main.Position = UDim2.new(0.5, -145, 0.5, -175)
main.BackgroundColor3 = dark
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = blue
stroke.Thickness = 2
stroke.Parent = main

local function makeButton(name, text, y, color)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(1, -24, 0, 42)
    b.Position = UDim2.fromOffset(12, y)
    b.BackgroundColor3 = color
    b.Text = text
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 16
    b.Font = Enum.Font.GothamBold
    b.Parent = main
    Instance.new("UICorner", b).CornerRadius =
        UDim.new(0, 9)
    return b
end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -65, 0, 45)
title.Position = UDim2.fromOffset(12, 5)
title.BackgroundTransparency = 1
title.Text = "PRINCE MACRO BLUE"
title.TextColor3 = Color3.fromRGB(90, 180, 255)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.Parent = main

local minimize = makeButton(
    "Minimize", "-", 8, blue
)
minimize.Size = UDim2.fromOffset(35, 30)
minimize.Position = UDim2.new(1, -45, 0, 8)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 35)
status.Position = UDim2.fromOffset(10, 55)
status.BackgroundTransparency = 1
status.Text = "STATUS: OFF"
status.TextColor3 = Color3.fromRGB(255, 100, 100)
status.TextSize = 18
status.Font = Enum.Font.GothamBold
status.Parent = main

local start = makeButton(
    "Start", "START MACRO", 100,
    Color3.fromRGB(0, 160, 100)
)

local stop = makeButton(
    "Stop", "STOP MACRO", 150,
    Color3.fromRGB(190, 55, 65)
)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -24, 0, 30)
speedLabel.Position = UDim2.fromOffset(12, 205)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "SPEED: 0.5s"
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.Font = Enum.Font.GothamBold
speedLabel.Parent = main

local speed = Instance.new("TextBox")
speed.Size = UDim2.new(1, -24, 0, 35)
speed.Position = UDim2.fromOffset(12, 238)
speed.BackgroundColor3 = Color3.fromRGB(20, 45, 75)
speed.Text = "0.5"
speed.TextColor3 = Color3.new(1, 1, 1)
speed.Parent = main

local delayLabel = Instance.new("TextLabel")
delayLabel.Size = UDim2.new(1, -24, 0, 25)
delayLabel.Position = UDim2.fromOffset(12, 280)
delayLabel.BackgroundTransparency = 1
delayLabel.Text = "DELAY: 0.2s"
delayLabel.TextColor3 = Color3.new(1, 1, 1)
delayLabel.Parent = main

local delay = Instance.new("TextBox")
delay.Size = UDim2.new(1, -24, 0, 30)
delay.Position = UDim2.fromOffset(12, 310)
delay.BackgroundColor3 = Color3.fromRGB(20, 45, 75)
delay.Text = "0.2"
delay.TextColor3 = Color3.new(1, 1, 1)
delay.Parent = main

local active = false

start.MouseButton1Click:Connect(function()
    active = true
    status.Text = "STATUS: ON"
    status.TextColor3 = Color3.fromRGB(80, 255, 130)
end)

stop.MouseButton1Click:Connect(function()
    active = false
    status.Text = "STATUS: OFF"
    status.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

minimize.MouseButton1Click:Connect(function()
    main.Visible = false

    local restore = Instance.new("TextButton")
    restore.Size = UDim2.fromOffset(150, 42)
    restore.Position = UDim2.new(0, 20, 0.5, 0)
    restore.Text = "PRINCE MACRO"
    restore.BackgroundColor3 = blue
    restore.TextColor3 = Color3.new(1, 1, 1)
    restore.Parent = gui

    restore.MouseButton1Click:Connect(function()
        main.Visible = true
        restore:Destroy()
    end)
end)

-- DRAG SUPPORT
local dragging = false
local dragStart, startPos

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
