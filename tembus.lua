-- Wallhack & Noclip Ultimate Hub
-- Compatible with Delta Executor

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local main = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local ContentContainer = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

local EspToggle = Instance.new("TextButton")
local NoclipToggle = Instance.new("TextButton")
local XrayToggle = Instance.new("TextButton")

-- Properties
main.Name = "WallhackNoclipHub"
main.Parent = game.CoreGui
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

MainFrame.Parent = main
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
MainFrame.Size = UDim2.new(0, 210, 0, 175)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 10)

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2.5

TopBar.Parent = MainFrame
TopBar.BackgroundTransparency = 1
TopBar.Size = UDim2.new(1, 0, 0, 35)

Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "WALLHACK & NOCLIP"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 12
Title.TextXAlignment = Enum.TextXAlignment.Left

CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
CloseButton.Position = UDim2.new(1, -28, 0, 6)
CloseButton.Size = UDim2.new(0, 22, 0, 22)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 12
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 5)

MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinimizeButton.Position = UDim2.new(1, -54, 0, 6)
MinimizeButton.Size = UDim2.new(0, 22, 0, 22)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 5)

ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 10, 0, 40)
ContentContainer.Size = UDim2.new(1, -20, 1, -50)

UIListLayout.Parent = ContentContainer
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

EspToggle.Parent = ContentContainer
EspToggle.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
EspToggle.Size = UDim2.new(1, 0, 0, 32)
EspToggle.Font = Enum.Font.GothamBold
EspToggle.Text = "Player ESP: OFF"
EspToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
EspToggle.TextSize = 12
Instance.new("UICorner", EspToggle).CornerRadius = UDim.new(0, 6)

NoclipToggle.Parent = ContentContainer
NoclipToggle.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
NoclipToggle.Size = UDim2.new(1, 0, 0, 32)
NoclipToggle.Font = Enum.Font.GothamBold
NoclipToggle.Text = "Tembus Dinding (Noclip): OFF"
NoclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipToggle.TextSize = 11
Instance.new("UICorner", NoclipToggle).CornerRadius = UDim.new(0, 6)

XrayToggle.Parent = ContentContainer
XrayToggle.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
XrayToggle.Size = UDim2.new(1, 0, 0, 32)
XrayToggle.Font = Enum.Font.GothamBold
XrayToggle.Text = "X-Ray Benda/Map: OFF"
XrayToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
XrayToggle.TextSize = 12
Instance.new("UICorner", XrayToggle).CornerRadius = UDim.new(0, 6)

-- UI Functionality
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ContentContainer.Visible = not isMinimized
    
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 70, 0, 35)
        Title.Visible = false
        CloseButton.Visible = false
        MinimizeButton.Size = UDim2.new(1, -12, 1, -6)
        MinimizeButton.Position = UDim2.new(0, 6, 0, 3)
        MinimizeButton.Text = "Menu"
        MinimizeButton.TextSize = 12
    else
        MainFrame.Size = UDim2.new(0, 210, 0, 175)
        Title.Visible = true
        CloseButton.Visible = true
        MinimizeButton.Size = UDim2.new(0, 22, 0, 22)
        MinimizeButton.Position = UDim2.new(1, -54, 0, 6)
        MinimizeButton.Text = "-"
        MinimizeButton.TextSize = 16
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

-- Player ESP Logic (Melihat player tembus dinding)
local espEnabled = false
local function applyHighlight(player)
    if player == LocalPlayer then return end
    local function addHl(char)
        if not char:FindFirstChild("ESPHighlight") then
            local hl = Instance.new("Highlight")
            hl.Name = "ESPHighlight"
            hl.Parent = char
            hl.Adornee = char
            hl.FillColor = Color3.fromRGB(255, 0, 0)
            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
            hl.FillTransparency = 0.4
            hl.OutlineTransparency = 0
        end
    end
    if player.Character then addHl(player.Character) end
    player.CharacterAdded:Connect(function(char)
        char:WaitForChild("HumanoidRootPart")
        if espEnabled then addHl(char) end
    end)
end

EspToggle.MouseButton1Down:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        EspToggle.Text = "Player ESP: ON"
        EspToggle.BackgroundColor3 = Color3.fromRGB(30, 150, 30)
        for _, plr in ipairs(Players:GetPlayers()) do
            applyHighlight(plr)
        end
    else
        EspToggle.Text = "Player ESP: OFF"
        EspToggle.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("ESPHighlight") then
                plr.Character.ESPHighlight:Destroy()
            end
        end
    end
end)

Players.PlayerAdded:Connect(function(plr)
    if espEnabled then applyHighlight(plr) end
end)

-- Tembus Dinding / Noclip Logic (Karakter bisa jalan tembus tembok & benda)
local noclipEnabled = false
local noclipConnection

NoclipToggle.MouseButton1Down:Connect(function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        NoclipToggle.Text = "Tembus Dinding (Noclip): ON"
        NoclipToggle.BackgroundColor3 = Color3.fromRGB(30, 150, 30)
        noclipConnection = RunService.Stepped:Connect(function()
            local character = LocalPlayer.Character
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        NoclipToggle.Text = "Tembus Dinding (Noclip): OFF"
        NoclipToggle.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        local character = LocalPlayer.Character
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)

-- X-Ray Benda / Map Logic (Membuat semua dinding & benda di map transparan agar terlihat isinya)
local xrayEnabled = false
local originalTransparency = {}

XrayToggle.MouseButton1Down:Connect(function()
    xrayEnabled = not xrayEnabled
    if xrayEnabled then
        XrayToggle.Text = "X-Ray Benda/Map: ON"
        XrayToggle.BackgroundColor3 = Color3.fromRGB(30, 150, 30)
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalPlayer.Character) and not obj.Parent:FindFirstChild("Humanoid") then
                originalTransparency[obj] = obj.Transparency
                obj.Transparency = 0.65
            end
        end
    else
        XrayToggle.Text = "X-Ray Benda/Map: OFF"
        XrayToggle.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
        for obj, trans in pairs(originalTransparency) do
            if obj and obj.Parent then
                obj.Transparency = trans
            end
        end
        originalTransparency = {}
    end
end)
