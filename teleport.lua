-- Pastikan player dan GUI bersih jika script dijalankan ulang
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("WaypointTeleportGui") then
    playerGui.WaypointTeleportGui:Destroy()
end

-- Membuat ScreenGui Utama
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WaypointTeleportGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Membuat Frame Utama
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 340)
mainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local cornerMain = Instance.new("UICorner")
cornerMain.CornerRadius = UDim.new(0, 12)
cornerMain.Parent = mainFrame

-- Judul GUI
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.75, 0, 0, 40)
titleLabel.Position = UDim2.new(0.05, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚡ ZBOSHX TELEPORT"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 13
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

-- Tombol Minimalkan (-)
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(0.82, 0, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 16
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.Parent = mainFrame

local cornerMin = Instance.new("UICorner")
cornerMin.CornerRadius = UDim.new(0, 6)
cornerMin.Parent = minimizeButton

-- Container Konten
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, 0, 0, 290)
contentContainer.Position = UDim2.new(0, 0, 0, 45)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = mainFrame

-- Garis Pembatas Estetik
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0.9, 0, 0, 1)
divider.Position = UDim2.new(0.05, 0, 0, 0)
divider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
divider.BorderSizePixel = 0
divider.Parent = contentContainer

-- Tombol "Tandai Lokasi Ini"
local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(0.9, 0, 0, 42)
saveButton.Position = UDim2.new(0.05, 0, 0, 12)
saveButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
saveButton.Text = "📌 Tandai Lokasi Ini"
saveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
saveButton.TextSize = 13
saveButton.Font = Enum.Font.GothamSemibold
saveButton.Parent = contentContainer

local cornerSave = Instance.new("UICorner")
cornerSave.CornerRadius = UDim.new(0, 8)
cornerSave.Parent = saveButton

-- ScrollingFrame untuk menampung daftar tombol tempat teleportasi
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(0.9, 0, 0, 220)
scrollingFrame.Position = UDim2.new(0.05, 0, 0, 62)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.Parent = contentContainer

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 8)
uiListLayout.Parent = scrollingFrame

-- Logika Fitur Minimalkan
local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        contentContainer.Visible = false
        mainFrame.Size = UDim2.new(0, 240, 0, 45)
        minimizeButton.Text = "+"
    else
        contentContainer.Visible = true
        mainFrame.Size = UDim2.new(0, 240, 0, 340)
        minimizeButton.Text = "-"
    end
end)

-- Tabel untuk menyimpan data waypoint dan marker cahayanya
local savedWaypoints = {}
local waypointCount = 0

-- Fungsi untuk melakukan teleportasi karakter
local function teleportTo(position)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
    end
end

-- Fungsi saat tombol "Tandai Lokasi" ditekan
saveButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local currentPos = character.HumanoidRootPart.Position
    waypointCount = waypointCount + 1
    local currentId = waypointCount
    
    -- MEMBUAT CAHAYA / MARKER DI LOKASI
    local markerPart = Instance.new("Part")
    markerPart.Size = Vector3.new(1, 15, 1)
    markerPart.Position = currentPos + Vector3.new(0, 7.5, 0)
    markerPart.Anchored = true
    markerPart.CanCollide = false
    markerPart.Transparency = 0.5
    markerPart.BrickColor = BrickColor.new("Cyan")
    markerPart.Material = Enum.Material.Neon
    markerPart.Parent = workspace
    
    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(0, 255, 255)
    light.Range = 20
    light.Brightness = 5
    light.Parent = markerPart
    
    -- CONTAINER BARIS (Menampung Tombol Teleport dan Tombol Hapus)
    local rowFrame = Instance.new("Frame")
    rowFrame.Size = UDim2.new(1, 0, 0, 38)
    rowFrame.BackgroundTransparency = 1
    rowFrame.Parent = scrollingFrame
    
    -- Tombol Teleport (Lebar disesuaikan agar ada ruang untuk tombol hapus)
    local tpButton = Instance.new("TextButton")
    tpButton.Size = UDim2.new(0.75, 0, 1, 0)
    tpButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    tpButton.Text = "📍 Tempat " .. currentId
    tpButton.TextColor3 = Color3.fromRGB(220, 220, 220)
    tpButton.TextSize = 13
    tpButton.Font = Enum.Font.GothamMedium
    tpButton.Parent = rowFrame
    
    local cornerTp = Instance.new("UICorner")
    cornerTp.CornerRadius = UDim.new(0, 6)
    cornerTp.Parent = tpButton
    
    -- Tombol Hapus (X di sebelah kanan tombol teleport)
    local deleteButton = Instance.new("TextButton")
    deleteButton.Size = UDim2.new(0.22, 0, 1, 0)
    deleteButton.Position = UDim2.new(0.78, 0, 0, 0)
    deleteButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    deleteButton.Text = "❌"
    deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    deleteButton.TextSize = 12
    deleteButton.Font = Enum.Font.GothamBold
    deleteButton.Parent = rowFrame
    
    local cornerDel = Instance.new("UICorner")
    cornerDel.CornerRadius = UDim.new(0, 6)
    cornerDel.Parent = deleteButton
    
    -- Simpan referensi data waypoint
    savedWaypoints[currentId] = {
        position = currentPos,
        marker = markerPart,
        uiRow = rowFrame
    }
    
    -- Event Teleport
    tpButton.MouseButton1Click:Connect(function()
        if savedWaypoints[currentId] then
            teleportTo(savedWaypoints[currentId].position)
        end
    end)
    
    -- Event Hapus Waypoint
    deleteButton.MouseButton1Click:Connect(function()
        if savedWaypoints[currentId] then
            -- Hapus efek cahaya dari dunia game (workspace)
            if savedWaypoints[currentId].marker then
                savedWaypoints[currentId].marker:Destroy()
            end
            -- Hapus tombol dari UI menu
            if savedWaypoints[currentId].uiRow then
                savedWaypoints[currentId].uiRow:Destroy()
            end
            -- Hapus dari memori tabel
            savedWaypoints[currentId] = nil
        end
    end)
    
    -- Animasi klik tombol simpan
    saveButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
    task.wait(0.2)
    saveButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end)

print("GUI Waypoint dengan Fitur Hapus Lokasi Berhasil Dimuat!")
