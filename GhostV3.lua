-- Function to change the player's body color to red
local function changeBodyColorToRed(player)
    -- Wait for the player's character to load
    player.CharacterAdded:Connect(function(character)
        -- Ensure the character has loaded
        character:WaitForChild("Humanoid")

        -- Loop through all parts of the character
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                -- Change the color of each part to red
                part.BrickColor = BrickColor.new("Bright red")
            end
        end
    end)
end

-- Connect the function to all players in the game
game.Players.PlayerAdded:Connect(changeBodyColorToRed)

-- Also apply the color change to players who are already in the game
for _, player in ipairs(game.Players:GetPlayers()) do
    changeBodyColorToRed(player)
end
