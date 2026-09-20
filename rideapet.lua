local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Hapus GUI lama jika script dijalankan ulang agar tidak menumpuk
if playerGui:FindFirstChild("GlobalEggMenuGui") then
	playerGui.GlobalEggMenuGui:Destroy()
end

-- 1. Buat ScreenGui Utama
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GlobalEggMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- 2. Buat Frame Menu Utama (Ukuran diperkecil: 220x205)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 220, 0, 205)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -102.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

-- Garis pinggir/stroke tipis modern
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(50, 50, 70)
uiStroke.Thickness = 1.5
uiStroke.Parent = mainFrame

-- 3. Title Bar (Header Menu Modern)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 32)
titleBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

-- Perbaikan sudut bawah title bar agar kotak lurus
local titleCover = Instance.new("Frame")
titleCover.Size = UDim2.new(1, 0, 0, 6)
titleCover.Position = UDim2.new(0, 0, 1, -6)
titleCover.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
titleCover.BorderSizePixel = 0
titleCover.Parent = titleBar

-- Icon Telur (ImageLabel di Header)
local eggIcon = Instance.new("ImageLabel")
eggIcon.Size = UDim2.new(0, 16, 0, 16)
eggIcon.Position = UDim2.new(0, 10, 0.5, -8)
eggIcon.BackgroundTransparency = 1
eggIcon.Image = "rbxassetid://6023426915"
eggIcon.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -60, 1, 0)
titleText.Position = UDim2.new(0, 32, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "EGG ESP & SPEED"
titleText.TextColor3 = Color3.fromRGB(240, 240, 255)
titleText.TextSize = 11
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Tombol Minimize (-) Modern
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 22, 0, 22)
minimizeBtn.Position = UDim2.new(1, -27, 0.5, -11)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
minimizeBtn.TextSize = 14
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = titleBar

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 5)
btnCorner.Parent = minimizeBtn

-- 4. Konten Menu
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 1, -32)
contentFrame.Position = UDim2.new(0, 0, 0, 32)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Padding untuk konten agar rapi
local contentPadding = Instance.new("UIPadding")
contentPadding.PaddingTop = UDim.new(0, 8)
contentPadding.PaddingBottom = UDim.new(0, 8)
contentPadding.PaddingLeft = UDim.new(0, 10)
contentPadding.PaddingRight = UDim.new(0, 10)
contentPadding.Parent = contentFrame

-- Bagian Pengatur Kecepatan Lari
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 14)
speedLabel.Position = UDim2.new(0, 0, 0, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "KECEPATAN LARI (SPEED)"
speedLabel.TextColor3 = Color3.fromRGB(150, 150, 175)
speedLabel.TextSize = 9
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = contentFrame

local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(1, 0, 0, 28)
speedInput.Position = UDim2.new(0, 0, 0, 16)
speedInput.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
speedInput.Text = "400"
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.TextSize = 12
speedInput.Font = Enum.Font.GothamMedium
speedInput.Parent = contentFrame

local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 5)
speedCorner.Parent = speedInput

local speedStroke = Instance.new("UIStroke")
speedStroke.Color = Color3.fromRGB(45, 45, 60)
speedStroke.Thickness = 1
speedStroke.Parent = speedInput

-- Tombol Terapkan Kecepatan
local applySpeedBtn = Instance.new("TextButton")
applySpeedBtn.Size = UDim2.new(1, 0, 0, 28)
applySpeedBtn.Position = UDim2.new(0, 0, 0, 50)
applySpeedBtn.BackgroundColor3 = Color3.fromRGB(243, 156, 18)
applySpeedBtn.Text = "Atur Kecepatan"
applySpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
applySpeedBtn.TextSize = 11
applySpeedBtn.Font = Enum.Font.GothamBold
applySpeedBtn.AutoButtonColor = false
applySpeedBtn.Parent = contentFrame

local applyCorner = Instance.new("UICorner")
applyCorner.CornerRadius = UDim.new(0, 5)
applyCorner.Parent = applySpeedBtn

-- Tombol Toggle Tampilkan Nama Telur di Map (ESP)
local toggleEspBtn = Instance.new("TextButton")
toggleEspBtn.Size = UDim2.new(1, 0, 0, 32)
toggleEspBtn.Position = UDim2.new(0, 0, 0, 84)
toggleEspBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
toggleEspBtn.Text = "Aktifkan ESP Telur"
toggleEspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleEspBtn.TextSize = 11
toggleEspBtn.Font = Enum.Font.GothamBold
toggleEspBtn.AutoButtonColor = false
toggleEspBtn.Parent = contentFrame

local espCorner = Instance.new("UICorner")
espCorner.CornerRadius = UDim.new(0, 5)
espCorner.Parent = toggleEspBtn

-- Label Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 18)
statusLabel.Position = UDim2.new(0, 0, 0, 122)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Siap digunakan"
statusLabel.TextColor3 = Color3.fromRGB(140, 140, 165)
statusLabel.TextSize = 9
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Parent = contentFrame

-- Efek Hover Halus pada Tombol
local function applyHoverEffect(btn, originalColor, hoverColor)
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
	end)
end

applyHoverEffect(minimizeBtn, Color3.fromRGB(35, 35, 48), Color3.fromRGB(50, 50, 68))
applyHoverEffect(applySpeedBtn, Color3.fromRGB(243, 156, 18), Color3.fromRGB(245, 175, 55))

-- 5. Logika Minimize & Restore Menu dengan Tween Halus
local isMinimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		contentFrame.Visible = false
		TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 220, 0, 32)}):Play()
		minimizeBtn.Text = "+"
	else
		TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 220, 0, 205)}):Play()
		task.wait(0.12)
		contentFrame.Visible = true
		minimizeBtn.Text = "-"
	end
end)

-- 6. Logika Mengubah Kecepatan Lari (Minimal 400)
applySpeedBtn.MouseButton1Click:Connect(function()
	local character = player.Character
	if not character then return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		local newSpeed = tonumber(speedInput.Text)
		if newSpeed then
			if newSpeed < 400 then
				newSpeed = 400
				speedInput.Text = "400"
			end
			humanoid.WalkSpeed = newSpeed
			statusLabel.Text = "Status: Speed diatur ke " .. newSpeed
			statusLabel.TextColor3 = Color3.fromRGB(243, 156, 18)
		else
			statusLabel.Text = "Status: Masukkan angka valid!"
			statusLabel.TextColor3 = Color3.fromRGB(231, 76, 60)
		end
	end
end)

-- Fungsi Filter (Mengabaikan "spawn", "base", "_egg", "dog", "brown", "white", "stone", "leaf", "cracked", "easter", "golden", "glass", "ice", dan "mushroom")
local function isValidEgg(name)
	local lowerName = string.lower(name)
	
	if string.find(lowerName, "spawn") or string.find(lowerName, "base") or string.find(lowerName, "_egg") or string.find(lowerName, "dog") or string.find(lowerName, "brown") or string.find(lowerName, "white") or string.find(lowerName, "stone") or string.find(lowerName, "leaf") or string.find(lowerName, "cracked") or string.find(lowerName, "easter") or string.find(lowerName, "golden") or string.find(lowerName, "glass") or string.find(lowerName, "ice") or string.find(lowerName, "mushroom") then
		return false
	end
	
	if string.find(lowerName, "egg") or string.find(lowerName, "telur") then
		return true
	end
	
	return false
end

-- 7. Fungsi Mengambil Warna Fisik dari Bagian Telur (Blackhole = Pink, Cherub = Merah, Solaris = Gold)
local function getPartColor(part, parentName)
	local lowerParentName = string.lower(parentName or "")
	if string.find(lowerParentName, "blackhole") then
		return Color3.fromRGB(255, 105, 180)
	elseif string.find(lowerParentName, "cherub") then
		return Color3.fromRGB(255, 0, 0)
	elseif string.find(lowerParentName, "solaris") then
		return Color3.fromRGB(255, 215, 0)
	end
	
	if part:IsA("BasePart") then
		if part.Color then
			return part.Color
		end
	end
	return Color3.fromRGB(255, 255, 255)
end

-- 8. Fungsi Pemindaian dan Munculkan Nama Telur di Map
local espActive = false
local function createEggLabel(eggPart, parentObj)
	if not eggPart or eggPart:FindFirstChild("GlobalEggBillboard") then return end
	
	local originalName = parentObj.Name
	local lowerName = string.lower(originalName)
	local eggColor = getPartColor(eggPart, originalName)
	
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "GlobalEggBillboard"
	billboard.Size = UDim2.new(0, 150, 0, 40)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = eggPart
	
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = originalName
	textLabel.TextColor3 = eggColor
	textLabel.TextSize = 15
	textLabel.Font = Enum.Font.GothamBold
	textLabel.TextStrokeTransparency = 0
	textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.Parent = billboard

	if string.find(lowerName, "blackhole") or string.find(lowerName, "cherub") or string.find(lowerName, "solaris") then
		local highlightName = "GlobalCustomHighlight"
		local highlight = eggPart:FindFirstChild(highlightName)
		if not highlight then
			highlight = Instance.new("Highlight")
			highlight.Name = highlightName
			highlight.Adornee = parentObj:IsA("Model") and parentObj or eggPart
			highlight.FillColor = eggColor
			highlight.FillTransparency = 0.4
			highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
			highlight.OutlineTransparency = 0
			highlight.Parent = eggPart
		end
	end
end

toggleEspBtn.MouseButton1Click:Connect(function()
	espActive = not espActive
	if espActive then
		toggleEspBtn.Text = "Matikan ESP Telur"
		TweenService:Create(toggleEspBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(231, 76, 60)}):Play()
		statusLabel.Text = "Status: ESP Telur Aktif"
		statusLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
		
		for _, descendant in ipairs(Workspace:GetDescendants()) do
			if isValidEgg(descendant.Name) then
				if descendant:IsA("BasePart") or descendant:IsA("Model") then
					local targetPart = descendant:IsA("Model") and (descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart")) or descendant
					if targetPart then createEggLabel(targetPart, descendant) end
				end
			end
		end
	else
		toggleEspBtn.Text = "Aktifkan ESP Telur"
		TweenService:Create(toggleEspBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(46, 204, 113)}):Play()
		statusLabel.Text = "Status: ESP Telur Mati"
		statusLabel.TextColor3 = Color3.fromRGB(140, 140, 165)
		
		for _, descendant in ipairs(Workspace:GetDescendants()) do
			local bb = descendant:FindFirstChild("GlobalEggBillboard", true)
			if bb then bb:Destroy() end
			local hl = descendant:FindFirstChild("GlobalCustomHighlight", true)
			if hl then hl:Destroy() end
		end
	end
end)
