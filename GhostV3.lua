-- ESP Script for Phantom Forces
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Function to create ESP for a player
local function createESP(player)
    if player == LocalPlayer then return end -- Do not create ESP for self

    local highlight = Instance.new("Highlight")
    highlight.Parent = player.Character
    highlight.FillColor = Color3.new(1, 0, 0) -- Red color for ESP
    highlight.FillTransparency = 0.5 -- Semi-transparent
    highlight.OutlineColor = Color3.new(1, 1, 1) -- White outline
    highlight.OutlineTransparency = 0 -- No transparency for outline

    -- Update ESP when the player's character is added or changed
    player.CharacterAdded:Connect(function(character)
        highlight.Parent = character
    end)
end

-- Function to remove ESP when a player leaves
local function removeESP(player)
    if player.Character and player.Character:FindFirstChild("Highlight") then
        player.Character.Highlight:Destroy()
    end
end

-- Create ESP for all players currently in the game
for _, player in ipairs(Players:GetPlayers()) do
    createESP(player)
end

-- Connect to player added and removed events
Players.PlayerAdded:Connect(createESP)
Players.PlayerRemoving:Connect(removeESP)

-- Continuously update ESP for all players
RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Highlight") then
            player.Character.Highlight.Adornee = player.Character
        end
    end
end)
