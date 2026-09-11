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

-- Membuat Frame Utama (Diperkecil ukurannya)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 280)
mainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local cornerMain = Instance.new("UICorner")
cornerMain.CornerRadius = UDim.new(0, 10)
cornerMain.Parent = mainFrame

-- Judul GUI (Disesuaikan ukurannya)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.7, 0, 0, 32)
titleLabel.Position = UDim2.new(0.05, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥TELEPORT"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 12
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

-- Tombol Minimalkan (-)
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 26, 0, 26)
minimizeButton.Position = UDim2.new(0.82, 0, 0, 3)
minimizeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 14
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.Parent = mainFrame

local cornerMin = Instance.new("UICorner")
cornerMin.CornerRadius = UDim.new(0, 6)
cornerMin.Parent = minimizeButton

-- Tombol Kecil "ZB" (Saat diminimalkan)
local cpButton = Instance.new("TextButton")
cpButton.Size = UDim2.new(0, 40, 0, 40)
cpButton.Position = UDim2.new(0, 0, 0, 0)
cpButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
cpButton.Text = "ZB"
cpButton.TextColor3 = Color3.fromRGB(0, 170, 255)
cpButton.TextSize = 13
cpButton.Font = Enum.Font.GothamBold
cpButton.Visible = false
cpButton.Active = true
cpButton.Draggable = true
cpButton.Parent = screenGui

local cornerCp = Instance.new("UICorner")
cornerCp.CornerRadius = UDim.new(0, 8)
cornerCp.Parent = cpButton

local strokeCp = Instance.new("UIStroke")
strokeCp.Color = Color3.fromRGB(0, 170, 255)
strokeCp.Thickness = 1.5
strokeCp.Parent = cpButton

-- Container Konten
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, 0, 0, 248)
contentContainer.Position = UDim2.new(0, 0, 0, 32)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = mainFrame

-- Garis Pembatas
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0.9, 0, 0, 1)
divider.Position = UDim2.new(0.05, 0, 0, 0)
divider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
divider.BorderSizePixel = 0
divider.Parent = contentContainer

-- Tombol "Tandai Lokasi Ini"
local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(0.9, 0, 0, 36)
saveButton.Position = UDim2.new(0.05, 0, 0, 10)
saveButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
saveButton.Text = "📌 Tandai Lokasi"
saveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
saveButton.TextSize = 12
saveButton.Font = Enum.Font.GothamSemibold
saveButton.Parent = contentContainer

local cornerSave = Instance.new("UICorner")
cornerSave.CornerRadius = UDim.new(0, 6)
cornerSave.Parent = saveButton

-- ScrollingFrame untuk daftar tempat
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(0.9, 0, 0, 185)
scrollingFrame.Position = UDim2.new(0.05, 0, 0, 54)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame.ScrollBarThickness = 3
scrollingFrame.Parent = contentContainer

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 6)
uiListLayout.Parent = scrollingFrame

-- Logika Fitur Minimalkan & Tombol CP
minimizeButton.MouseButton1Click:Connect(function()
    cpButton.Position = mainFrame.Position
    mainFrame.Visible = false
    cpButton.Visible = true
end)

cpButton.MouseButton1Click:Connect(function()
    mainFrame.Position = cpButton.Position
    mainFrame.Visible = true
    cpButton.Visible = false
end)

-- Tabel untuk menyimpan data waypoint dan marker
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
    
    -- MEMBUAT CAHAYA SANGAT PENDEK, KECIL, DAN WARNA BIRU
    local markerPart = Instance.new("Part")
    markerPart.Size = Vector3.new(0.4, 2, 0.4) -- Pendek dan kecil (tinggi hanya 2 stud)
    markerPart.Position = currentPos + Vector3.new(0, 1, 0)
    markerPart.Anchored = true
    markerPart.CanCollide = false
    markerPart.Transparency = 0.2
    markerPart.Color = Color3.fromRGB(0, 120, 255) -- Warna biru solid
    markerPart.Material = Enum.Material.Neon
    markerPart.Parent = workspace
    
    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(0, 150, 255) -- Cahaya biru lembut
    light.Range = 6 -- Jangkauan sangat kecil
    light.Brightness = 2
    light.Parent = markerPart
    
    -- CONTAINER BARIS (Tombol Teleport & Hapus ukuran kecil)
    local rowFrame = Instance.new("Frame")
    rowFrame.Size = UDim2.new(1, 0, 0, 32)
    rowFrame.BackgroundTransparency = 1
    rowFrame.Parent = scrollingFrame
    
    -- Tombol Teleport
    local tpButton = Instance.new("TextButton")
    tpButton.Size = UDim2.new(0.75, 0, 1, 0)
    tpButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    tpButton.Text = "📍 Tempat " .. currentId
    tpButton.TextColor3 = Color3.fromRGB(220, 220, 220)
    tpButton.TextSize = 12
    tpButton.Font = Enum.Font.GothamMedium
    tpButton.Parent = rowFrame
    
    local cornerTp = Instance.new("UICorner")
    cornerTp.CornerRadius = UDim.new(0, 6)
    cornerTp.Parent = tpButton
    
    -- Tombol Hapus
    local deleteButton = Instance.new("TextButton")
    deleteButton.Size = UDim2.new(0.22, 0, 1, 0)
    deleteButton.Position = UDim2.new(0.78, 0, 0, 0)
    deleteButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    deleteButton.Text = "❌"
    deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    deleteButton.TextSize = 11
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
            if savedWaypoints[currentId].marker then
                savedWaypoints[currentId].marker:Destroy()
            end
            if savedWaypoints[currentId].uiRow then
                savedWaypoints[currentId].uiRow:Destroy()
            end
            savedWaypoints[currentId] = nil
        end
    end)
    
    -- Animasi klik tombol simpan
    saveButton.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
    task.wait(0.2)
    saveButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end)

print("GUI Selesai: Menu diperkecil & Cahaya penanda diubah jadi pendek berwarna biru!")
