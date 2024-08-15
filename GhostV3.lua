local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ESPGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Create the main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Create the title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "ESP Script Loader"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 18
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

-- Create the status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 1, -20)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Press '1' to load ESP"
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.SourceSans
statusLabel.Parent = mainFrame

-- Variables for dragging
local dragging = false
local dragStart = nil
local startPos = nil
local espLoaded = false

-- Function to load the ESP script
local function loadESPScript()
    if espLoaded then
        statusLabel.Text = "ESP already loaded!"
        return
    end

    local espScript = [[
        print("ESP PF Initialized.")

        enemyteam = game.Workspace.Players:GetChildren()[1]
        friendlyteam = game.Workspace.Players:GetChildren()[2]

        local function applyESP()
            for _,v in enemyteam:GetDescendants() do
                if v.ClassName == "Model" and not v:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.FillColor = Color3.new(1,0,0)
                    h.FillTransparency = 0.4
                    h.Parent = v
                    print(string.format("Highlighted enemy %s", v.Name))
                end
            end
            for _,v in friendlyteam:GetDescendants() do
                if v.ClassName == "Model" and not v:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.FillColor = Color3.new(0.227451, 1, 0.054902)
                    h.FillTransparency = 0.8
                    h.Parent = v
                    print(string.format("Highlighted friendly %s", v.Name))
                end
            end
        end

        spawn(function()
            while wait(0.1) do
                applyESP()
            end
        end)
    ]]

    local success, error = pcall(function()
        loadstring(espScript)()
    end)

    if success then
        statusLabel.Text = "ESP script loaded!"
        espLoaded = true
    else
        statusLabel.Text = "Failed to load ESP script"
        warn("Failed to load ESP script:", error)
    end
end

-- Function to handle input
local function onInputBegan(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Insert then
        mainFrame.Visible = not mainFrame.Visible
    elseif input.KeyCode == Enum.KeyCode.One then
        loadESPScript()
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

print("Script loaded. Press Insert to toggle menu visibility, and press 1 to load ESP.")
