local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

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

-- 2. Buat Frame Menu Utama (Ukuran: 240x210)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 240, 0, 210)
mainFrame.Position = UDim2.new(0.5, -120, 0.5, -105)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = mainFrame

-- 3. Title Bar (Header Menu)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 6)
titleCorner.Parent = titleBar

-- Icon Telur (ImageLabel di Header)
local eggIcon = Instance.new("ImageLabel")
eggIcon.Size = UDim2.new(0, 18, 0, 18)
eggIcon.Position = UDim2.new(0, 8, 0.5, -9)
eggIcon.BackgroundTransparency = 1
-- Menggunakan Asset ID Icon Telur Roblox umum
eggIcon.Image = "rbxassetid://6023426915"
eggIcon.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -55, 1, 0)
titleText.Position = UDim2.new(0, 32, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Menu ESP Telur"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 12
titleText.Font = Enum.Font.SourceSansBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Tombol Minimize (-) Kecil
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 24, 0, 24)
minimizeBtn.Position = UDim2.new(1, -27, 0, 3)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextSize = 14
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.Parent = titleBar

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 4)
btnCorner.Parent = minimizeBtn

-- 4. Konten Menu
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 1, -30)
contentFrame.Position = UDim2.new(0, 0, 0, 30)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Bagian Pengatur Kecepatan Lari
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 210, 0, 18)
speedLabel.Position = UDim2.new(0.5, -105, 0, 8)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Kecepatan Lari (Speed):"
speedLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
speedLabel.TextSize = 11
speedLabel.Font = Enum.Font.SourceSansBold
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = contentFrame

local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0, 210, 0, 28)
speedInput.Position = UDim2.new(0.5, -105, 0, 28)
speedInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedInput.Text = "24"
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.TextSize = 12
speedInput.Font = Enum.Font.SourceSansBold
speedInput.Parent = contentFrame

local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 4)
speedCorner.Parent = speedInput

-- Tombol Terapkan Kecepatan
local applySpeedBtn = Instance.new("TextButton")
applySpeedBtn.Size = UDim2.new(0, 210, 0, 28)
applySpeedBtn.Position = UDim2.new(0.5, -105, 0, 60)
applySpeedBtn.BackgroundColor3 = Color3.fromRGB(230, 126, 34)
applySpeedBtn.Text = "Atur Kecepatan"
applySpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
applySpeedBtn.TextSize = 11
applySpeedBtn.Font = Enum.Font.SourceSansBold
applySpeedBtn.Parent = contentFrame

local applyCorner = Instance.new("UICorner")
applyCorner.CornerRadius = UDim.new(0, 4)
applyCorner.Parent = applySpeedBtn

-- Tombol Toggle Tampilkan Nama Telur di Map (ESP)
local toggleEspBtn = Instance.new("TextButton")
toggleEspBtn.Size = UDim2.new(0, 210, 0, 32)
toggleEspBtn.Position = UDim2.new(0.5, -105, 0, 95)
toggleEspBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
toggleEspBtn.Text = "Aktifkan ESP Telur"
toggleEspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleEspBtn.TextSize = 11
toggleEspBtn.Font = Enum.Font.SourceSansBold
toggleEspBtn.Parent = contentFrame

local espCorner = Instance.new("UICorner")
espCorner.CornerRadius = UDim.new(0, 4)
espCorner.Parent = toggleEspBtn

-- Label Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 210, 0, 25)
statusLabel.Position = UDim2.new(0.5, -105, 0, 133)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Siap"
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
statusLabel.TextSize = 10
statusLabel.Font = Enum.Font.SourceSans
statusLabel.Parent = contentFrame

-- 5. Logika Minimize & Restore Menu
local isMinimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		contentFrame.Visible = false
		mainFrame:TweenSize(UDim2.new(0, 240, 0, 30), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
		minimizeBtn.Text = "+"
	else
		mainFrame:TweenSize(UDim2.new(0, 240, 0, 210), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
		task.wait(0.1)
		contentFrame.Visible = true
		minimizeBtn.Text = "-"
	end
end)

-- 6. Logika Mengubah Kecepatan Lari
applySpeedBtn.MouseButton1Click:Connect(function()
	local character = player.Character
	if not character then return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		local newSpeed = tonumber(speedInput.Text)
		if newSpeed then
			humanoid.WalkSpeed = newSpeed
			statusLabel.Text = "Status: Speed diatur ke " .. newSpeed
			statusLabel.TextColor3 = Color3.fromRGB(230, 126, 34)
		else
			statusLabel.Text = "Status: Masukkan angka valid!"
			statusLabel.TextColor3 = Color3.fromRGB(231, 76, 60)
		end
	end
end)

-- Fungsi Filter (Mengabaikan "spawn", "base", "_egg", dan "dog")
local function isValidEgg(name)
	local lowerName = string.lower(name)
	
	-- Abaikan jika mengandung kata "spawn", "base", "_egg", atau "dog"
	if string.find(lowerName, "spawn") or string.find(lowerName, "base") or string.find(lowerName, "_egg") or string.find(lowerName, "dog") then
		return false
	end
	
	-- Wajib mengandung kata "egg" atau "telur"
	if string.find(lowerName, "egg") or string.find(lowerName, "telur") then
		return true
	end
	
	return false
end

-- 7. Fungsi Mengambil Warna Fisik dari Bagian Telur (Blackhole = Pink, Cherub = Merah)
local function getPartColor(part, parentName)
	local lowerParentName = string.lower(parentName or "")
	if string.find(lowerParentName, "blackhole") then
		-- Warna Pink Menyala
		return Color3.fromRGB(255, 105, 180)
	elseif string.find(lowerParentName, "cherub") then
		-- Warna Merah
		return Color3.fromRGB(255, 0, 0)
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
	textLabel.TextSize = 16
	textLabel.Font = Enum.Font.SourceSansBold
	textLabel.TextStrokeTransparency = 0
	textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.Parent = billboard

	-- Efek khusus bersinar (Highlight) jika Blackhole Egg atau Cherub Egg
	if string.find(lowerName, "blackhole") or string.find(lowerName, "cherub") then
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
		toggleEspBtn.BackgroundColor3 = Color3.fromRGB(192, 57, 43)
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
		toggleEspBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
		statusLabel.Text = "Status: ESP Telur Mati"
		statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
		
		for _, descendant in ipairs(Workspace:GetDescendants()) do
			local bb = descendant:FindFirstChild("GlobalEggBillboard", true)
			if bb then bb:Destroy() end
			local hl = descendant:FindFirstChild("GlobalCustomHighlight", true)
			if hl then hl:Destroy() end
		end
	end
end)
