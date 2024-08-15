-- Place this script in a LocalScript within StarterPlayerScripts or StarterCharacterScripts

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Function to create and configure the highlight GUI
local function createHighlight(player)
    if player and player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head

        -- Check if a highlight already exists
        local existingHighlight = PlayerGui:FindFirstChild("PlayerHighlight_" .. player.Name)
        if existingHighlight then
            return
        end

        -- Create the BillboardGui
        local highlight = Instance.new("BillboardGui")
        highlight.Name = "PlayerHighlight_" .. player.Name
        highlight.Adornee = head
        highlight.Parent = PlayerGui
        highlight.Size = UDim2.new(0, 150, 0, 150)
        highlight.StudsOffset = Vector3.new(0, 3, 0)
        highlight.AlwaysOnTop = true
        highlight.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        -- Create the Frame inside BillboardGui
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.new(1, 0, 0) -- Red highlight
        frame.BackgroundTransparency = 0.5
        frame.Parent = highlight
    end
end

-- Function to remove the highlight GUI
local function removeHighlight(player)
    local highlight = PlayerGui:FindFirstChild("PlayerHighlight_" .. player.Name)
    if highlight then
        highlight:Destroy()
    end
end

-- Event handler for when a player's character is added
local function onCharacterAdded(character)
    -- Add a short delay to ensure the character's Head is available
    wait(0.5)
    createHighlight(LocalPlayer)
end

-- Event handler for when a player is added
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        onCharacterAdded(character)
    end)
end)

-- Event handler for when a player is removed
Players.PlayerRemoving:Connect(function(player)
    removeHighlight(player)
end)

-- Highlight existing players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        if player.Character then
            onCharacterAdded(player.Character)
        else
            player.CharacterAdded:Connect(function(character)
                onCharacterAdded(character)
            end)
        end
    end
end
