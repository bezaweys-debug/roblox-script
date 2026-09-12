-- Delta Executor Speed & Jump Hub with Modern UI & Sliders

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

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "SpeedJumpHub"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -130)
MainFrame.Size = UDim2.new(0, 220, 0, 260)
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
Title.Text = "SPEED & JUMP HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 12
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
ScrollingFrame.Size = UDim2.new(1, -16, 1, -50)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 3

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ScrollingFrame.Visible = not isMinimized
    
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 70, 0, 35)
        Title.Visible = false
        MinimizeButton.Size = UDim2.new(1, -12, 1, -6)
        MinimizeButton.Position = UDim2.new(0, 6, 0, 3)
        MinimizeButton.Text = "SJ"
        MinimizeButton.TextSize = 13
    else
        MainFrame.Size = UDim2.new(0, 220, 0, 260)
        Title.Visible = true
        MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
        MinimizeButton.Position = UDim2.new(1, -30, 0, 6)
        MinimizeButton.Text = "-"
        MinimizeButton.TextSize = 16
    end
end)

local function createControl(name, defaultVal, minVal, maxVal, callback)
    local container = Instance.new("Frame")
    container.Parent = ScrollingFrame
    container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    container.Size = UDim2.new(1, 0, 0, 65)
    
    local corner = Instance.new("UICorner")
    corner.Parent = container
    corner.CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel")
    label.Parent = container
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 8, 0, 4)
    label.Size = UDim2.new(1, -16, 0, 24)
    label.Font = Enum.Font.GothamMedium
    label.Text = name .. ": " .. defaultVal
    label.TextColor3 = Color3.fromRGB(240, 240, 240)
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local minusBtn = Instance.new("TextButton")
    minusBtn.Parent = container
    minusBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
    minusBtn.Position = UDim2.new(0, 8, 0, 32)
    minusBtn.Size = UDim2.new(0, 45, 0, 26)
    minusBtn.Font = Enum.Font.GothamBold
    minusBtn.Text = "-"
    minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minusBtn.TextSize = 14
    
    local minusCorner = Instance.new("UICorner")
    minusCorner.Parent = minusBtn
    minusCorner.CornerRadius = UDim.new(0, 5)
    
    local plusBtn = Instance.new("TextButton")
    plusBtn.Parent = container
    plusBtn.BackgroundColor3 = Color3.fromRGB(30, 150, 30)
    plusBtn.Position = UDim2.new(1, -53, 0, 32)
    plusBtn.Size = UDim2.new(0, 45, 0, 26)
    plusBtn.Font = Enum.Font.GothamBold
    plusBtn.Text = "+"
    plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    plusBtn.TextSize = 14
    
    local plusCorner = Instance.new("UICorner")
    plusCorner.Parent = plusBtn
    plusCorner.CornerRadius = UDim.new(0, 5)
    
    local valDisplay = Instance.new("TextLabel")
    valDisplay.Parent = container
    valDisplay.BackgroundTransparency = 1
    valDisplay.Position = UDim2.new(0, 60, 0, 32)
    valDisplay.Size = UDim2.new(1, -120, 0, 26)
    valDisplay.Font = Enum.Font.GothamBold
    valDisplay.Text = tostring(defaultVal)
    valDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
    valDisplay.TextSize = 12
    
    local currentVal = defaultVal
    
    minusBtn.MouseButton1Click:Connect(function()
        currentVal = math.clamp(currentVal - 10, minVal, maxVal)
        valDisplay.Text = tostring(currentVal)
        callback(currentVal)
    end)
    
    plusBtn.MouseButton1Click:Connect(function()
        currentVal = math.clamp(currentVal + 10, minVal, maxVal)
        valDisplay.Text = tostring(currentVal)
        callback(currentVal)
    end)
    
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end

-- Kontrol Kecepatan Lari (WalkSpeed)
createControl("Kecepatan Lari", 16, 16, 300, function(val)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = val
    end
end)

-- Kontrol Ketinggian Loncat (JumpPower)
createControl("Ketinggian Loncat", 50, 50, 500, function(val)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.UseJumpPower = true
        char.Humanoid.JumpPower = val
    end
end)

-- Auto update jika karakter reset/respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
end)
