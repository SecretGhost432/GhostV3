local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function createESP(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillColor = Color3.new(1, 0, 0)
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
end

local function refreshESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            if player.Character then
                createESP(player)
            end
        end
    end
end

RunService.Heartbeat:Connect(function()
    refreshESP()
end)
