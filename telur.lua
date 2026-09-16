-- Pastikan CoreGui aman digunakan
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

-- Hapus UI lama jika script dijalankan ulang agar tidak menumpuk
if CoreGui:FindFirstChild("TelurESP_Mini") then
    CoreGui.TelurESP_Mini:Destroy()
end

-- Membuat ScreenGui Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TelurESP_Mini"
ScreenGui.Parent = CoreGui

-- Frame Utama (Panel Menu yang Diperkecil)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -75)
MainFrame.Size = UDim2.new(0, 220, 0, 145) -- Ukuran lebih kecil & kompak
MainFrame.Active = true
MainFrame.Draggable = true

-- Judul Menu
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Size = UDim2.new(1, 0, 0, 32)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "🥚 ESP Telur Mini"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

-- Tombol Minimalkan Menu (-)
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = Title
MinimizeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
MinimizeButton.Position = UDim2.new(1, -28, 0, 4)
MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14

-- Status Text (Kecil)
local StatusText = Instance.new("TextLabel")
StatusText.Parent = MainFrame
StatusText.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
StatusText.Position = UDim2.new(0.05, 0, 0.28, 0)
StatusText.Size = UDim2.new(0.9, 0, 0, 25)
StatusText.Font = Enum.Font.SourceSans
StatusText.Text = "Status: Nonaktif"
StatusText.TextColor3 = Color3.fromRGB(255, 150, 150)
StatusText.TextSize = 12

-- Tombol Toggle ESP
local EspButton = Instance.new("TextButton")
EspButton.Parent = MainFrame
EspButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
EspButton.Position = UDim2.new(0.05, 0, 0.58, 0)
EspButton.Size = UDim2.new(0.9, 0, 0, 45)
EspButton.Font = Enum.Font.SourceSansBold
EspButton.Text = "Nyalakan ESP (Warna Objek)"
EspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EspButton.TextSize = 13
EspButton.TextWrapped = true

--------------------------------------------------
-- LOGIKA SCRIPT
--------------------------------------------------

-- Fungsi untuk mendeteksi warna asli dari objek telur
local function ambilWarnaObjek(obj)
    if obj:IsA("BasePart") then
        return obj.Color
    elseif obj:IsA("Model") then
        if obj.PrimaryPart then
            return obj.PrimaryPart.Color
        else
            for _, anak in ipairs(obj:GetDescendants()) do
                if anak:IsA("BasePart") then
                    return anak.Color
                end
            end
        end
    end
    return Color3.fromRGB(255, 255, 255)
end

-- 1. Fungsi Tombol Minimalkan / Maksimalkan Menu
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    for _, child in ipairs(MainFrame:GetChildren()) do
        if child ~= Title and child:IsA("GuiObject") then
            child.Visible = not isMinimized
        end
    end
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 220, 0, 32)
        MinimizeButton.Text = "+"
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
    else
        MainFrame.Size = UDim2.new(0, 220, 0, 145)
        MinimizeButton.Text = "-"
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

-- 2. Fungsi Toggle ESP Sesuai Warna Asli Objek
local espAktif = false
EspButton.MouseButton1Click:Connect(function()
    espAktif = not espAktif
    
    if espAktif then
        EspButton.Text = "Matikan ESP"
        EspButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
        StatusText.Text = "Status: Aktif"
        StatusText.TextColor3 = Color3.fromRGB(200, 255, 200)
        
        -- Memindai map dan memasang ESP berdasarkan warna fisik objek
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local nama = string.lower(obj.Name)
            if (string.find(nama, "telur") or string.find(nama, "egg")) and (obj:IsA("BasePart") or obj:IsA("Model")) then
                if not obj:FindFirstChild("TelurMini_Tag") then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "TelurMini_Tag"
                    billboard.Size = UDim2.new(0, 120, 0, 40)
                    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                    billboard.AlwaysOnTop = true
                    
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Parent = billboard
                    textLabel.BackgroundTransparency = 1
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.Font = Enum.Font.SourceSansBold
                    textLabel.Text = obj.Name
                    
                    -- Mengambil warna asli dari objek game tersebut
                    textLabel.TextColor3 = ambilWarnaObjek(obj)
                    textLabel.TextStrokeTransparency = 0
                    textLabel.TextSize = 13
                    
                    billboard.Parent = obj
                end
            end
        end
    else
        EspButton.Text = "Nyalakan ESP (Warna Objek)"
        EspButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        StatusText.Text = "Status: Nonaktif"
        StatusText.TextColor3 = Color3.fromRGB(255, 150, 150)
        
        -- Hapus semua tag ESP
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local tag = obj:FindFirstChild("TelurMini_Tag")
            if tag then
                tag:Destroy()
            end
        end
    end
end)
