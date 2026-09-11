-- Pastikan player dan GUI bersih jika script dijalankan ulang
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("HighJumpGui") then
    playerGui.HighJumpGui:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HighJumpGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Frame Utama Menu Loncat Tinggi
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 210, 0, 205)
mainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
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
titleLabel.Text = "🦘 HIGH JUMP"
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

-- Tombol Kecil "HJ" (Saat diminimalkan)
local jumpIconButton = Instance.new("TextButton")
jumpIconButton.Size = UDim2.new(0, 40, 0, 40)
jumpIconButton.Position = UDim2.new(0.05, 0, 0.4, 0)
jumpIconButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
jumpIconButton.Text = "HJ"
jumpIconButton.TextColor3 = Color3.fromRGB(0, 170, 255)
jumpIconButton.TextSize = 13
jumpIconButton.Font = Enum.Font.GothamBold
jumpIconButton.Visible = false
jumpIconButton.Active = true
jumpIconButton.Draggable = true
jumpIconButton.Parent = screenGui

local cornerJumpIcon = Instance.new("UICorner")
cornerJumpIcon.CornerRadius = UDim.new(0, 8)
cornerJumpIcon.Parent = jumpIconButton

local strokeJumpIcon = Instance.new("UIStroke")
strokeJumpIcon.Color = Color3.fromRGB(0, 170, 255)
strokeJumpIcon.Thickness = 1.5
strokeJumpIcon.Parent = jumpIconButton

-- Container Konten
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, 0, 0, 173)
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

-- Tombol Toggle Loncat Tinggi (ON / OFF)
local toggleJumpButton = Instance.new("TextButton")
toggleJumpButton.Size = UDim2.new(0.9, 0, 0, 34)
toggleJumpButton.Position = UDim2.new(0.05, 0, 0, 10)
toggleJumpButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
toggleJumpButton.Text = "Status: OFF"
toggleJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleJumpButton.TextSize = 12
toggleJumpButton.Font = Enum.Font.GothamBold
toggleJumpButton.Parent = contentContainer

local cornerToggle = Instance.new("UICorner")
cornerToggle.CornerRadius = UDim.new(0, 6)
cornerToggle.Parent = toggleJumpButton

-- Label Pengatur Ketinggian Lompat
local heightLabel = Instance.new("TextLabel")
heightLabel.Size = UDim2.new(0.9, 0, 0, 16)
heightLabel.Position = UDim2.new(0.05, 0, 0, 50)
heightLabel.BackgroundTransparency = 1
heightLabel.Text = "Ketinggian: 100"
heightLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
heightLabel.TextSize = 11
heightLabel.Font = Enum.Font.GothamMedium
heightLabel.TextXAlignment = Enum.TextXAlignment.Left
heightLabel.Parent = contentContainer

local decHeight = Instance.new("TextButton")
decHeight.Size = UDim2.new(0.42, 0, 0, 26)
decHeight.Position = UDim2.new(0.05, 0, 0, 68)
decHeight.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
decHeight.Text = "Jump -"
decHeight.TextColor3 = Color3.fromRGB(255, 255, 255)
decHeight.TextSize = 10
decHeight.Font = Enum.Font.GothamMedium
decHeight.Parent = contentContainer

local cornerDecH = Instance.new("UICorner")
cornerDecH.CornerRadius = UDim.new(0, 6)
cornerDecH.Parent = decHeight

local incHeight = Instance.new("TextButton")
incHeight.Size = UDim2.new(0.42, 0, 0, 26)
incHeight.Position = UDim2.new(0.53, 0, 0, 68)
incHeight.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
incHeight.Text = "Jump +"
incHeight.TextColor3 = Color3.fromRGB(255, 255, 255)
incHeight.TextSize = 10
incHeight.Font = Enum.Font.GothamMedium
incHeight.Parent = contentContainer

local cornerIncH = Instance.new("UICorner")
cornerIncH.CornerRadius = UDim.new(0, 6)
cornerIncH.Parent = incHeight

-- Label Pengatur Kecepatan (WalkSpeed)
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.9, 0, 0, 16)
speedLabel.Position = UDim2.new(0.05, 0, 0, 100)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Kecepatan: 32"
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.TextSize = 11
speedLabel.Font = Enum.Font.GothamMedium
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = contentContainer

local decSpeed = Instance.new("TextButton")
decSpeed.Size = UDim2.new(0.42, 0, 0, 26)
decSpeed.Position = UDim2.new(0.05, 0, 0, 118)
decSpeed.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
decSpeed.Text = "Speed -"
decSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
decSpeed.TextSize = 10
decSpeed.Font = Enum.Font.GothamMedium
decSpeed.Parent = contentContainer

local cornerDecS = Instance.new("UICorner")
cornerDecS.CornerRadius = UDim.new(0, 6)
cornerDecS.Parent = decSpeed

local incSpeed = Instance.new("TextButton")
incSpeed.Size = UDim2.new(0.42, 0, 0, 26)
incSpeed.Position = UDim2.new(0.53, 0, 0, 118)
incSpeed.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
incSpeed.Text = "Speed +"
incSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
incSpeed.TextSize = 10
incSpeed.Font = Enum.Font.GothamMedium
incSpeed.Parent = contentContainer

local cornerIncS = Instance.new("UICorner")
cornerIncS.CornerRadius = UDim.new(0, 6)
cornerIncS.Parent = incSpeed

-- Logika Minimalkan Menu
minimizeButton.MouseButton1Click:Connect(function()
    jumpIconButton.Position = mainFrame.Position
    mainFrame.Visible = false
    jumpIconButton.Visible = true
end)

jumpIconButton.MouseButton1Click:Connect(function()
    mainFrame.Position = jumpIconButton.Position
    mainFrame.Visible = true
    jumpIconButton.Visible = false
end)

-- Variabel Status Loncat & Kecepatan
local highJumpActive = false
local jumpPowerVal = 100
local walkSpeedVal = 32
local RunService = game:GetService("RunService")

-- Tombol Pengatur Nilai Ketinggian Lompat
incHeight.MouseButton1Click:Connect(function()
    jumpPowerVal = jumpPowerVal + 25
    if jumpPowerVal > 500 then jumpPowerVal = 500 end
    heightLabel.Text = "Ketinggian: " .. jumpPowerVal
end)

decHeight.MouseButton1Click:Connect(function()
    jumpPowerVal = jumpPowerVal - 25
    if jumpPowerVal < 50 then jumpPowerVal = 50 end
    heightLabel.Text = "Ketinggian: " .. jumpPowerVal
end)

-- Tombol Pengatur Nilai Kecepatan Jalan
incSpeed.MouseButton1Click:Connect(function()
    walkSpeedVal = walkSpeedVal + 8
    if walkSpeedVal > 200 then walkSpeedVal = 200 end
    speedLabel.Text = "Kecepatan: " .. walkSpeedVal
end)

decSpeed.MouseButton1Click:Connect(function()
    walkSpeedVal = walkSpeedVal - 8
    if walkSpeedVal < 16 then walkSpeedVal = 16 end
    speedLabel.Text = "Kecepatan: " .. walkSpeedVal
end)

-- Tombol Toggle ON / OFF
toggleJumpButton.MouseButton1Click:Connect(function()
    highJumpActive = not highJumpActive
    if highJumpActive then
        toggleJumpButton.Text = "Status: ON"
        toggleJumpButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    else
        toggleJumpButton.Text = "Status: OFF"
        toggleJumpButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.JumpPower = 50 -- Kembalikan ke normal standar Roblox
            character.Humanoid.WalkSpeed = 16
        end
    end
end)

-- Loop Utama untuk Menerapkan Status secara Real-time
RunService.RenderStepped:Connect(function()
    if highJumpActive then
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            humanoid.UseJumpPower = true
            humanoid.JumpPower = jumpPowerVal
            humanoid.WalkSpeed = walkSpeedVal
        end
    end
end)

print("Script High Jump & Speed Berhasil Dimuat!")
