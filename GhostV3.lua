-- Function to highlight player in red color for Phantom Forces game
local function highlightPlayer(player)
    local highlightColor = Color3.fromRGB(255, 0, 0) -- Red color
    local highlightDuration = 5 -- Highlight duration in seconds

    -- Create a highlight effect for the player
    local highlight = Instance.new("SelectionBox")
    highlight.Color = highlightColor
    highlight.LineThickness = 0.05
    highlight.Adornee = player.Character.HumanoidRootPart
    highlight.Parent = player.Character

    -- Remove highlight after a certain duration
    wait(highlightDuration)
    highlight:Destroy()
end

-- Example: Highlight a specific player in red color
local playerToHighlight = game.Players:GetPlayerByName("PlayerNameHere")
if playerToHighlight then
    highlightPlayer(playerToHighlight)
end
