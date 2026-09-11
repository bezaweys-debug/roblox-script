-- Pastikan player dan GUI bersih jika script dijalankan ulang
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("CarryGui") then
    playerGui.CarryGui:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CarryGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Frame Utama Menu Gendong
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 210, 0, 160)
mainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local cornerMain = Instance.new("UICorner")
cornerMain.CornerRadius = UDim.new(0, 10)
cornerMain.Parent = mainFrame

-- Judul Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.7, 0, 0, 32)
titleLabel.Position = UDim2.new(0.05, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🫂 CARRY SYSTEM"
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

-- Tombol Kecil "CARRY" (Saat diminimalkan)
local carryIconButton = Instance.new("TextButton")
carryIconButton.Size = UDim2.new(0, 40, 0, 40)
carryIconButton.Position = UDim2.new(0.05, 0, 0.3, 0)
carryIconButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
carryIconButton.Text = "CARRY"
carryIconButton.TextColor3 = Color3.fromRGB(255, 100, 150)
carryIconButton.TextSize = 9
carryIconButton.Font = Enum.Font.GothamBold
carryIconButton.Visible = false
carryIconButton.Active = true
carryIconButton.Draggable = true
carryIconButton.Parent = screenGui

local cornerCarryIcon = Instance.new("UICorner")
cornerCarryIcon.CornerRadius = UDim.new(0, 8)
cornerCarryIcon.Parent = carryIconButton

local strokeCarryIcon = Instance.new("UIStroke")
strokeCarryIcon.Color = Color3.fromRGB(255, 100, 150)
strokeCarryIcon.Thickness = 1.5
strokeCarryIcon.Parent = carryIconButton

-- Container Konten
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, 0, 0, 128)
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

-- Kotak Input Nama Teman
local targetBox = Instance.new("TextBox")
targetBox.Size = UDim2.new(0.9, 0, 0, 34)
targetBox.Position = UDim2.new(0.05, 0, 0, 12)
targetBox.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
targetBox.PlaceholderText = "Ketik Nama Teman..."
targetBox.Text = ""
targetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
targetBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
targetBox.TextSize = 11
targetBox.Font = Enum.Font.GothamMedium
targetBox.Parent = contentContainer

local cornerBox = Instance.new("UICorner")
cornerBox.CornerRadius = UDim.new(0, 6)
cornerBox.Parent = targetBox

-- Tombol Gendong (ON / OFF)
local toggleCarryButton = Instance.new("TextButton")
toggleCarryButton.Size = UDim2.new(0.9, 0, 0, 36)
toggleCarryButton.Position = UDim2.new(0.05, 0, 0, 56)
toggleCarryButton.BackgroundColor3 = Color3.fromRGB(200, 80, 130)
toggleCarryButton.Text = "Gendong Teman"
toggleCarryButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleCarryButton.TextSize = 12
toggleCarryButton.Font = Enum.Font.GothamBold
toggleCarryButton.Parent = contentContainer

local cornerToggle = Instance.new("UICorner")
cornerToggle.CornerRadius = UDim.new(0, 6)
cornerToggle.Parent = toggleCarryButton

-- Status Info Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 18)
statusLabel.Position = UDim2.new(0.05, 0, 0, 98)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Siap Gendong"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 10
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Parent = contentContainer

-- Logika Minimalkan Menu
minimizeButton.MouseButton1Click:Connect(function()
    carryIconButton.Position = mainFrame.Position
    mainFrame.Visible = false
    carryIconButton.Visible = true
end)

carryIconButton.MouseButton1Click:Connect(function()
    mainFrame.Position = carryIconButton.Position
    mainFrame.Visible = true
    carryIconButton.Visible = false
end)

-- Variabel Sistem Gendong
local carrying = false
local targetPlayer = nil
local RunService = game:GetService("RunService")
local weld = nil

-- Fungsi Cari Teman Berdasarkan Nama (Mendukung ketik sebagian nama)
local function findPlayer(nameInput)
    nameInput = string.lower(nameInput)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            local pName = string.lower(p.Name)
            local pDisplay = string.lower(p.DisplayName or "")
            if string.find(pName, nameInput) or string.find(pDisplay, nameInput) then
                return p
            end
        end
    end
    return nil
end

-- Tombol Toggle Gendong
toggleCarryButton.MouseButton1Click:Connect(function()
    carrying = not carrying
    
    if carrying then
        local inputName = targetBox.Text
        targetPlayer = findPlayer(inputName)
        
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            toggleCarryButton.Text = "Lepas Gendongan"
            toggleCarryButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
            statusLabel.Text = "Mendukung: " .. targetPlayer.Name
            
            local myChar = player.Character
            local targetChar = targetPlayer.Character
            
            if myChar and myChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("HumanoidRootPart") then
                local myHrp = myChar.HumanoidRootPart
                local targetHrp = targetChar.HumanoidRootPart
                
                -- Matikan sementara physics target agar tidak berontak
                if targetChar:FindFirstChild("Humanoid") then
                    targetChar.Humanoid.PlatformStand = true
                end
                
                -- Buat Weld agar posisi teman menempel di punggung kita
                weld = Instance.new("WeldConstraint")
                weld.Part0 = myHrp
                weld.Part1 = targetHrp
                weld.Parent = myHrp
                
                -- Geser posisi teman ke belakang punggung karakter kita
                targetHrp.CFrame = myHrp.CFrame * CFrame.new(0, 0, 1.5)
            end
        else
            carrying = false
            statusLabel.Text = "Teman tidak ditemukan!"
        end
    else
        toggleCarryButton.Text = "Gendong Teman"
        toggleCarryButton.BackgroundColor3 = Color3.fromRGB(200, 80, 130)
        statusLabel.Text = "Status: Siap Gendong"
        
        if weld then
            weld:Destroy()
            weld = nil
        end
        
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
            targetPlayer.Character.Humanoid.PlatformStand = false
        end
        
        targetPlayer = nil
    end
end)

-- Loop pengecekan agar gendongan tetap stabil
RunService.RenderStepped:Connect(function()
    if carrying and targetPlayer and targetPlayer.Character then
        local targetChar = targetPlayer.Character
        if targetChar:FindFirstChild("Humanoid") then
            targetChar.Humanoid.PlatformStand = true
        end
    end
end)

print("Script Gendong Teman Berhasil Dimuat!")
