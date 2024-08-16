local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HackGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Create the main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 250)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Create the scrolling frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Size = UDim2.new(1, 0, 1, -30)  -- Subtract 30 for the title
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 8
scrollFrame.Parent = mainFrame

-- Create the title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "GhostV3"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 18
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

-- Create the ESP button
local espButton = Instance.new("TextButton")
espButton.Name = "ESPButton"
espButton.Size = UDim2.new(0.8, 0, 0, 30)
espButton.Position = UDim2.new(0.1, 0, 0, 10)
espButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
espButton.Text = "Enable ESP"
espButton.TextColor3 = Color3.new(1, 1, 1)
espButton.TextSize = 16
espButton.Font = Enum.Font.SourceSansBold
espButton.Parent = scrollFrame

-- Create the Aimbot button
local aimbotButton = Instance.new("TextButton")
aimbotButton.Name = "AimbotButton"
aimbotButton.Size = UDim2.new(0.5, 0, 0, 30)
aimbotButton.Position = UDim2.new(0.1, 0, 0, 50)
aimbotButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
aimbotButton.Text = "Enable Aimbot"
aimbotButton.TextColor3 = Color3.new(1, 1, 1)
aimbotButton.TextSize = 16
aimbotButton.Font = Enum.Font.SourceSansBold
aimbotButton.Parent = scrollFrame

-- Create the Aimbot keybind button
local aimbotKeybindButton = Instance.new("TextButton")
aimbotKeybindButton.Name = "AimbotKeybindButton"
aimbotKeybindButton.Size = UDim2.new(0.3, 0, 0, 30)
aimbotKeybindButton.Position = UDim2.new(0.65, 0, 0, 50)
aimbotKeybindButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
aimbotKeybindButton.Text = "Set Key"
aimbotKeybindButton.TextColor3 = Color3.new(1, 1, 1)
aimbotKeybindButton.TextSize = 14
aimbotKeybindButton.Font = Enum.Font.SourceSansBold
aimbotKeybindButton.Parent = scrollFrame

-- Create the Aimbot sensitivity slider
local aimbotSensitivitySlider = Instance.new("TextBox")
aimbotSensitivitySlider.Name = "AimbotSensitivitySlider"
aimbotSensitivitySlider.Size = UDim2.new(0.8, 0, 0, 30)
aimbotSensitivitySlider.Position = UDim2.new(0.1, 0, 0, 110)
aimbotSensitivitySlider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
aimbotSensitivitySlider.Text = "50"
aimbotSensitivitySlider.TextColor3 = Color3.new(1, 1, 1)
aimbotSensitivitySlider.TextSize = 14
aimbotSensitivitySlider.Font = Enum.Font.SourceSansBold
aimbotSensitivitySlider.Parent = scrollFrame

local sensitivityLabel = Instance.new("TextLabel")
sensitivityLabel.Name = "SensitivityLabel"
sensitivityLabel.Size = UDim2.new(0.8, 0, 0, 20)
sensitivityLabel.Position = UDim2.new(0.1, 0, 0, 90)
sensitivityLabel.BackgroundTransparency = 1
sensitivityLabel.Text = "Aimbot Sensitivity"
sensitivityLabel.TextColor3 = Color3.new(1, 1, 1)
sensitivityLabel.TextSize = 14
sensitivityLabel.Font = Enum.Font.SourceSans
sensitivityLabel.Parent = scrollFrame

-- Create the Head button
local headButton = Instance.new("TextButton")
headButton.Name = "HeadButton"
headButton.Size = UDim2.new(0.8, 0, 0, 30)
headButton.Position = UDim2.new(0.1, 0, 0, 150)
headButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
headButton.Text = "Head"
headButton.TextColor3 = Color3.new(1, 1, 1)
headButton.TextSize = 16
headButton.Font = Enum.Font.SourceSansBold
headButton.Parent = scrollFrame

-- Create the dropdown frame
local dropdownFrame = Instance.new("Frame")
dropdownFrame.Name = "DropdownFrame"
dropdownFrame.Size = UDim2.new(0.8, 0, 0, 60)
dropdownFrame.Position = UDim2.new(0.1, 0, 0, 180)
dropdownFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
dropdownFrame.Visible = false
dropdownFrame.Parent = scrollFrame

-- Create the Head option
local headOption = Instance.new("TextButton")
headOption.Name = "HeadOption"
headOption.Size = UDim2.new(1, 0, 0.5, 0)
headOption.Position = UDim2.new(0, 0, 0, 0)
headOption.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
headOption.Text = "Head"
headOption.TextColor3 = Color3.new(1, 1, 1)
headOption.TextSize = 14
headOption.Font = Enum.Font.SourceSans
headOption.Parent = dropdownFrame

-- Create the Legs option
local legsOption = Instance.new("TextButton")
legsOption.Name = "LegsOption"
legsOption.Size = UDim2.new(1, 0, 0.5, 0)
legsOption.Position = UDim2.new(0, 0, 0.5, 0)
legsOption.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
legsOption.Text = "Legs"
legsOption.TextColor3 = Color3.new(1, 1, 1)
legsOption.TextSize = 14
legsOption.Font = Enum.Font.SourceSans
legsOption.Parent = dropdownFrame

-- Create the status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 1, -20)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Cheat Not Active"
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.SourceSans
statusLabel.Parent = mainFrame

-- Create the Exploits label
local exploitsLabel = Instance.new("TextLabel")
exploitsLabel.Name = "ExploitsLabel"
exploitsLabel.Size = UDim2.new(0.8, 0, 0, 30)
exploitsLabel.Position = UDim2.new(0.1, 0, 0, 250)
exploitsLabel.BackgroundTransparency = 1
exploitsLabel.Text = "Exploits"
exploitsLabel.TextColor3 = Color3.new(1, 1, 1)
exploitsLabel.TextSize = 18
exploitsLabel.Font = Enum.Font.SourceSansBold
exploitsLabel.Parent = scrollFrame

-- Create the Instant Reload button
local instantReloadButton = Instance.new("TextButton")
instantReloadButton.Name = "InstantReloadButton"
instantReloadButton.Size = UDim2.new(0.8, 0, 0, 30)
instantReloadButton.Position = UDim2.new(0.1, 0, 0, 290)
instantReloadButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
instantReloadButton.Text = "Instant Reload"
instantReloadButton.TextColor3 = Color3.new(1, 1, 1)
instantReloadButton.TextSize = 16
instantReloadButton.Font = Enum.Font.SourceSansBold
instantReloadButton.Parent = scrollFrame

-- Variables
local dragging = false
local dragStart = nil
local startPos = nil
local espEnabled = false
local aimbotEnabled = false
local aimbotKeybind = Enum.KeyCode.E  -- Default keybind
local aimbotSensitivity = 50  -- Default sensitivity
local aimbotTarget = "Head"  -- Default target

-- Create FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Radius = 100
fovCircle.Color = Color3.new(1, 1, 1)
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.Transparency = 1
fovCircle.NumSides = 60

-- ESP function
local function runESP()
    print("ESP PF Initialized.")
    enemyteam = game.Workspace.Players:GetChildren()[1]
    friendlyteam = game.Workspace.Players:GetChildren()[2]
    while espEnabled do
        for _,v in enemyteam:GetDescendants() do
            if v.ClassName == "Model" then
                if not v:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight",v)
                    h.FillColor = Color3.new(1,0,0)
                    h.FillTransparency = 0.4
                    print(string.format("Highlighted %s",v.Name))
                end
            end
        end
        for _,v in friendlyteam:GetDescendants() do
            if v.ClassName == "Model" then
                if not v:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight",v)
                    h.FillColor = Color3.new(0.227451, 1, 0.054902)
                    h.FillTransparency = 0.8
                    print(string.format("Highlighted %s",v.Name))
                end
            end
        end
        wait(0.1)
    end
end

-- Function to get closest player in FOV
local function getClosestPlayerInFOV()
    local closestPlayer = nil
    local closestDistance = math.huge
    local mousePos = UserInputService:GetMouseLocation()

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local pos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            if onScreen then
                local distance = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                if distance <= fovCircle.Radius and distance < closestDistance then
                    closestPlayer = player
                    closestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end

-- New Aimbot function
local function runAimbot()
    local function aimAtTarget()
        local target = getClosestPlayerInFOV()
        if target and target.Character then
            local targetPart
            if aimbotTarget == "Head" and target.Character:FindFirstChild("Head") then
                targetPart = target.Character.Head
            elseif aimbotTarget == "Legs" and target.Character:FindFirstChild("RightFoot") then
                targetPart = target.Character.RightFoot
            else
                return
            end

            local targetPos = targetPart.Position
            local mousePos = UserInputService:GetMouseLocation()
            local targetScreenPos = Camera:WorldToViewportPoint(targetPos)
            local sensitivity = aimbotSensitivity / 100  -- Convert to a 0-1 range
            
            -- Check if target is within FOV circle
            local distanceToTarget = (Vector2.new(targetScreenPos.X, targetScreenPos.Y) - mousePos).Magnitude
            if distanceToTarget <= fovCircle.Radius then
                mousemoverel(
                    (targetScreenPos.X - mousePos.X) * sensitivity,
                    (targetScreenPos.Y - mousePos.Y) * sensitivity
                )
            end
        end
    end

    while UserInputService:IsKeyDown(aimbotKeybind) do
        aimAtTarget()
        RunService.RenderStepped:Wait()
    end
end

-- Function to toggle ESP
local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        espButton.Text = "Disable ESP"
        statusLabel.Text = "ESP enabled"
        coroutine.wrap(runESP)()
    else
        espButton.Text = "Enable ESP"
        statusLabel.Text = "ESP disabled"
        for _, player in pairs(game.Workspace.Players:GetDescendants()) do
            if player:IsA("Model") and player:FindFirstChild("Highlight") then
                player.Highlight:Destroy()
            end
        end
    end
end
-- Function to toggle Aimbot
local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        aimbotButton.Text = "Disable Aimbot"
        statusLabel.Text = "Aimbot enabled (Hold " .. aimbotKeybind.Name .. ")"
        fovCircle.Visible = true
    else
        aimbotButton.Text = "Enable Aimbot"
        statusLabel.Text = "Aimbot disabled"
        fovCircle.Visible = false
    end
end

-- Function to handle input
local function onInputBegan(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Insert then
        mainFrame.Visible = not mainFrame.Visible
    elseif input.KeyCode == aimbotKeybind and aimbotEnabled then
        coroutine.wrap(runAimbot)()
    end
end

-- Function to set Aimbot keybind
local function setAimbotKeybind()
    aimbotKeybindButton.Text = "Press any key"
    local connection
    connection = UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            aimbotKeybind = input.KeyCode
            aimbotKeybindButton.Text = input.KeyCode.Name
            statusLabel.Text = "Aimbot enabled (Hold " .. aimbotKeybind.Name .. ")"
            connection:Disconnect()
        end
    end)
end

-- Function to update Aimbot sensitivity
local function updateAimbotSensitivity()
    local newSensitivity = tonumber(aimbotSensitivitySlider.Text)
    if newSensitivity and newSensitivity >= 1 and newSensitivity <= 100 then
        aimbotSensitivity = newSensitivity
    else
        aimbotSensitivitySlider.Text = tostring(aimbotSensitivity)
    end
end

-- Function to update drag
local function updateDrag(input)
    if dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end

-- Update FOV circle position
local function updateFOVCircle()
    fovCircle.Position = UserInputService:GetMouseLocation()
end

-- Function to toggle dropdown visibility
local function toggleDropdown()
    dropdownFrame.Visible = not dropdownFrame.Visible
end

-- Function to set aimbot target
local function setAimbotTarget(target)
    aimbotTarget = target
    headButton.Text = target
    dropdownFrame.Visible = false
end

-- Instant Reload function
local function instantReload()
    local gunModule = require(game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons)
    local oldReload = gunModule.reload
    gunModule.reload = function(...)
        local args = {...}
        args[2] = 0
        return oldReload(unpack(args))
    end
    print("Instant Reload activated")
end

-- Connect input events
UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputChanged:Connect(updateDrag)

-- Enable dragging
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Connect ESP and Aimbot buttons
espButton.MouseButton1Click:Connect(toggleESP)
aimbotButton.MouseButton1Click:Connect(toggleAimbot)
aimbotKeybindButton.MouseButton1Click:Connect(setAimbotKeybind)
aimbotSensitivitySlider.FocusLost:Connect(updateAimbotSensitivity)

-- Connect Head button and dropdown options
headButton.MouseButton1Click:Connect(toggleDropdown)
headOption.MouseButton1Click:Connect(function() setAimbotTarget("Head") end)
legsOption.MouseButton1Click:Connect(function() setAimbotTarget("Legs") end)

-- Connect Instant Reload button
instantReloadButton.MouseButton1Click:Connect(instantReload)

-- Update FOV circle
RunService.RenderStepped:Connect(updateFOVCircle)

-- Clean up on script end
screenGui.Destroying:Connect(function()
    fovCircle:Remove()
end)

print("Script loaded. Press Insert to toggle menu visibility.")
