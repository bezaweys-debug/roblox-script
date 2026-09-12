-- Delta Executor Modern Teleport Hub (Minimized to "TP" button)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SaveButton = Instance.new("TextButton")
local SaveCorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "ModernTeleportGUI"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -140)
MainFrame.Size = UDim2.new(0, 200, 0, 280)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 10)

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2.5

Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(1, -50, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "TELEPORT HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left

MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinimizeButton.Position = UDim2.new(1, -30, 0, 6)
MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16

local MinCorner = Instance.new("UICorner")
MinCorner.Parent = MinimizeButton
MinCorner.CornerRadius = UDim.new(0, 6)

ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 8, 0, 42)
ScrollingFrame.Size = UDim2.new(1, -16, 1, -98)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 3

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

SaveButton.Parent = MainFrame
SaveButton.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
SaveButton.Position = UDim2.new(0, 10, 1, -46)
SaveButton.Size = UDim2.new(1, -20, 0, 34)
SaveButton.Font = Enum.Font.GothamBold
SaveButton.Text = "Tandai Lokasi"
SaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton.TextSize = 12

SaveCorner.Parent = SaveButton
SaveCorner.CornerRadius = UDim.new(0, 6)

local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ScrollingFrame.Visible = not isMinimized
    SaveButton.Visible = not isMinimized
    
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 70, 0, 35)
        Title.Visible = false
        MinimizeButton.Size = UDim2.new(1, -12, 1, -6)
        MinimizeButton.Position = UDim2.new(0, 6, 0, 3)
        MinimizeButton.Text = "TP"
        MinimizeButton.TextSize = 13
    else
        MainFrame.Size = UDim2.new(0, 200, 0, 280)
        Title.Visible = true
        MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
        MinimizeButton.Position = UDim2.new(1, -30, 0, 6)
        MinimizeButton.Text = "-"
        MinimizeButton.TextSize = 16
    end
end)

local waypointCount = 0

local function createVisualMarker(position)
    local part = Instance.new("Part")
    part.Shape = Enum.PartType.Ball
    part.Size = Vector3.new(3, 3, 3)
    part.Position = position
    part.Anchored = true
    part.CanCollide = false
    part.Material = Enum.Material.Neon
    part.Color = Color3.fromRGB(0, 150, 255)
    part.Parent = workspace

    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(0, 150, 255)
    light.Range = 10
    light.Brightness = 4
    light.Parent = part
    
    return part
end

local function addWaypoint()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    waypointCount = waypointCount + 1
    local pos = char.HumanoidRootPart.Position
    local marker = createVisualMarker(pos)
    
    local itemFrame = Instance.new("Frame")
    itemFrame.Parent = ScrollingFrame
    itemFrame.BackgroundTransparency = 1
    itemFrame.Size = UDim2.new(1, 0, 0, 32)
    
    local tpBtn = Instance.new("TextButton")
    tpBtn.Parent = itemFrame
    tpBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tpBtn.Size = UDim2.new(0, 130, 1, 0)
    tpBtn.Font = Enum.Font.GothamMedium
    tpBtn.Text = "Lokasi " .. waypointCount
    tpBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
    tpBtn.TextSize = 11
    
    local tpCorner = Instance.new("UICorner")
    tpCorner.Parent = tpBtn
    tpCorner.CornerRadius = UDim.new(0, 5)
    
    local delBtn = Instance.new("TextButton")
    delBtn.Parent = itemFrame
    delBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
    delBtn.Position = UDim2.new(0, 136, 0, 0)
    delBtn.Size = UDim2.new(0, 38, 1, 0)
    delBtn.Font = Enum.Font.GothamBold
    delBtn.Text = "X"
    delBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    delBtn.TextSize = 11
    
    local delCorner = Instance.new("UICorner")
    delCorner.Parent = delBtn
    delCorner.CornerRadius = UDim.new(0, 5)
    
    tpBtn.MouseButton1Click:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
        end
    end)
    
    delBtn.MouseButton1Click:Connect(function()
        if marker then marker:Destroy() end
        itemFrame:Destroy()
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    end)
    
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end

SaveButton.MouseButton1Click:Connect(addWaypoint)
