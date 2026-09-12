-- Multi-TP Hub (For Delta Executor)
-- Menu dengan Tombol TP Berurutan (3x lipat) dan Tombol TP Lokasi 3 (2x lipat)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

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

-- Grup Tombol Tanda Lokasi (Di Atas)
local SetRow1 = Instance.new("Frame")
local SetWP1Button = Instance.new("TextButton")
local SetWP2Button = Instance.new("TextButton")

local SetWP3Button = Instance.new("TextButton")

-- Grup Tombol Teleport (Di Bawah - Diperbesar)
local TPSeqButton = Instance.new("TextButton")
local TP3Button = Instance.new("TextButton")

local StatusLabel = Instance.new("TextLabel")

-- Properties (Ukuran menu diperbesar menyesuaikan tombol besar)
main.Name = "MultiTPHub"
main.Parent = game.CoreGui
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

MainFrame.Parent = main
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -165)
MainFrame.Size = UDim2.new(0, 200, 0, 330)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 8)

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2

TopBar.Parent = MainFrame
TopBar.BackgroundTransparency = 1
TopBar.Size = UDim2.new(1, 0, 0, 30)

Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 8, 0, 0)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "MULTI TP HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 9
Title.TextXAlignment = Enum.TextXAlignment.Left

CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
CloseButton.Position = UDim2.new(1, -24, 0, 4)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 10
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 4)

MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinimizeButton.Position = UDim2.new(1, -48, 0, 4)
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 4)

ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 8, 0, 35)
ContentContainer.Size = UDim2.new(1, -16, 1, -42)

UIListLayout.Parent = ContentContainer
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- ===== BAGIAN ATAS: SEMUA TOMBOL TANDA LOKASI =====
SetRow1.Parent = ContentContainer
SetRow1.BackgroundTransparency = 1
SetRow1.Size = UDim2.new(1, 0, 0, 24)

SetWP1Button.Parent = SetRow1
SetWP1Button.BackgroundColor3 = Color3.fromRGB(0, 90, 180)
SetWP1Button.Size = UDim2.new(0.48, -2, 1, 0)
SetWP1Button.Font = Enum.Font.GothamBold
SetWP1Button.Text = "Tanda 1"
SetWP1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
SetWP1Button.TextSize = 8
Instance.new("UICorner", SetWP1Button).CornerRadius = UDim.new(0, 5)

SetWP2Button.Parent = SetRow1
SetWP2Button.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
SetWP2Button.Position = UDim2.new(0.48, 2, 0, 0)
SetWP2Button.Size = UDim2.new(0.48, -2, 1, 0)
SetWP2Button.Font = Enum.Font.GothamBold
SetWP2Button.Text = "Tanda 2"
SetWP2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
SetWP2Button.TextSize = 8
Instance.new("UICorner", SetWP2Button).CornerRadius = UDim.new(0, 5)

SetWP3Button.Parent = ContentContainer
SetWP3Button.BackgroundColor3 = Color3.fromRGB(120, 0, 180)
SetWP3Button.Size = UDim2.new(1, 0, 0, 24)
SetWP3Button.Font = Enum.Font.GothamBold
SetWP3Button.Text = "Tanda Lokasi 3"
SetWP3Button.TextColor3 = Color3.fromRGB(255, 255, 255)
SetWP3Button.TextSize = 8
Instance.new("UICorner", SetWP3Button).CornerRadius = UDim.new(0, 5)

-- ===== BAGIAN BAWAH: SEMUA TOMBOL TELEPORT =====
-- TP Berurutan: 3x lipat besar standar (~24px standar menjadi 72px)
TPSeqButton.Parent = ContentContainer
TPSeqButton.BackgroundColor3 = Color3.fromRGB(180, 100, 0)
TPSeqButton.Size = UDim2.new(1, 0, 0, 72)
TPSeqButton.Font = Enum.Font.GothamBold
TPSeqButton.Text = "TP Berurutan (300ms)"
TPSeqButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TPSeqButton.TextSize = 12
Instance.new("UICorner", TPSeqButton).CornerRadius = UDim.new(0, 6)

-- TP Lokasi 3: 2x lipat besar standar (~24px standar menjadi 48px)
TP3Button.Parent = ContentContainer
TP3Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
TP3Button.Size = UDim2.new(1, 0, 0, 48)
TP3Button.Font = Enum.Font.GothamBold
TP3Button.Text = "TP Lokasi 3"
TP3Button.TextColor3 = Color3.fromRGB(255, 255, 255)
TP3Button.TextSize = 11
Instance.new("UICorner", TP3Button).CornerRadius = UDim.new(0, 6)

StatusLabel.Parent = ContentContainer
StatusLabel.BackgroundTransparency = 1
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Text = "Status: Siap digunakan"
StatusLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
StatusLabel.TextSize = 8
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- UI Functionality (Minimize & Close)
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ContentContainer.Visible = not isMinimized
    
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 65, 0, 30)
        Title.Visible = false
        CloseButton.Visible = false
        MinimizeButton.Size = UDim2.new(1, -10, 1, -6)
        MinimizeButton.Position = UDim2.new(0, 5, 0, 3)
        MinimizeButton.Text = "Menu"
        MinimizeButton.TextSize = 9
    else
        MainFrame.Size = UDim2.new(0, 200, 0, 330)
        Title.Visible = true
        CloseButton.Visible = true
        MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
        MinimizeButton.Position = UDim2.new(1, -48, 0, 4)
        MinimizeButton.Text = "-"
        MinimizeButton.TextSize = 14
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

-- Variabel Lokasi & Indikator Bola Biru
local wp1CFrame = nil
local wp2CFrame = nil
local wp3CFrame = nil
local markers = {}

local function createBlueMarker(cframe, index)
    if markers[index] then markers[index]:Destroy() end
    
    local marker = Instance.new("Part")
    marker.Name = "BlueWaypointIndicator" .. index
    marker.Shape = Enum.PartType.Ball
    marker.Size = Vector3.new(1, 1, 1)
    marker.Position = cframe.Position
    marker.Anchored = true
    marker.CanCollide = false
    marker.Material = Enum.Material.Neon
    marker.Color = Color3.fromRGB(0, 170, 255)
    marker.Transparency = 0.2
    marker.Parent = Workspace
    
    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(0, 170, 255)
    light.Range = 6
    light.Brightness = 3
    light.Parent = marker
    
    markers[index] = marker
end

-- Tanda Lokasi 1
SetWP1Button.MouseButton1Down:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        wp1CFrame = root.CFrame
        createBlueMarker(wp1CFrame, 1)
        StatusLabel.Text = "Lokasi 1 ditandai!"
    else
        StatusLabel.Text = "Error: Karakter tidak ada!"
    end
end)

-- Tanda Lokasi 2
SetWP2Button.MouseButton1Down:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        wp2CFrame = root.CFrame
        createBlueMarker(wp2CFrame, 2)
        StatusLabel.Text = "Lokasi 2 ditandai!"
    else
        StatusLabel.Text = "Error: Karakter tidak ada!"
    end
end)

-- Tanda Lokasi 3
SetWP3Button.MouseButton1Down:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        wp3CFrame = root.CFrame
        createBlueMarker(wp3CFrame, 3)
        StatusLabel.Text = "Lokasi 3 ditandai!"
    else
        StatusLabel.Text = "Error: Karakter tidak ada!"
    end
end)

-- Tombol TP Berurutan (Lokasi 1 -> Jeda 300ms -> Lokasi 2)
TPSeqButton.MouseButton1Down:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then
        StatusLabel.Text = "Error: Karakter tidak ada!"
        return
    end
    
    if not wp1CFrame or not wp2CFrame then
        StatusLabel.Text = "Error: Tandai Lokasi 1 & 2 dulu!"
        return
    end
    
    task.spawn(function()
        root.CFrame = wp1CFrame
        StatusLabel.Text = "TP Lokasi 1... (Tunggu 300ms)"
        
        task.wait(0.3)
        
        local currentRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if currentRoot then
            currentRoot.CFrame = wp2CFrame
            StatusLabel.Text = "Selesai TP Berurutan (1 & 2)!"
        end
    end)
end)

-- Tombol TP Terpisah untuk Lokasi 3
TP3Button.MouseButton1Down:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    if wp3CFrame then
        root.CFrame = wp3CFrame
        StatusLabel.Text = "Berhasil TP ke Lokasi 3!"
    else
        StatusLabel.Text = "Error: Lokasi 3 belum ditandai!"
    end
end)
