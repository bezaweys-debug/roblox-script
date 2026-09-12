-- Modern Fly GUI V3 (Minimized to "Fly" button)
-- Original Logic by XNEO, UI Remake for Delta Executor

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

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

local FlyToggle = Instance.new("TextButton")
local HeightFrame = Instance.new("Frame")
local UpButton = Instance.new("TextButton")
local DownButton = Instance.new("TextButton")
local SpeedFrame = Instance.new("Frame")
local MinusButton = Instance.new("TextButton")
local PlusButton = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")

-- Properties
main.Name = "ModernFlyGUI"
main.Parent = game.CoreGui
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

MainFrame.Parent = main
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -120)
MainFrame.Size = UDim2.new(0, 210, 0, 180)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 10)

UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2.5

TopBar.Parent = MainFrame
TopBar.BackgroundTransparency = 1
TopBar.Size = UDim2.new(1, 0, 0, 35)

Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "FLY HUB V3"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left

CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
CloseButton.Position = UDim2.new(1, -28, 0, 6)
CloseButton.Size = UDim2.new(0, 22, 0, 22)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 12
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(0, 5)

MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinimizeButton.Position = UDim2.new(1, -54, 0, 6)
MinimizeButton.Size = UDim2.new(0, 22, 0, 22)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 5)

ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 10, 0, 40)
ContentContainer.Size = UDim2.new(1, -20, 1, -50)

UIListLayout.Parent = ContentContainer
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

FlyToggle.Parent = ContentContainer
FlyToggle.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
FlyToggle.Size = UDim2.new(1, 0, 0, 35)
FlyToggle.Font = Enum.Font.GothamBold
FlyToggle.Text = "Status: OFF"
FlyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyToggle.TextSize = 12
Instance.new("UICorner", FlyToggle).CornerRadius = UDim.new(0, 6)

HeightFrame.Parent = ContentContainer
HeightFrame.BackgroundTransparency = 1
HeightFrame.Size = UDim2.new(1, 0, 0, 30)

UpButton.Parent = HeightFrame
UpButton.BackgroundColor3 = Color3.fromRGB(40, 100, 200)
UpButton.Size = UDim2.new(0.48, 0, 1, 0)
UpButton.Font = Enum.Font.GothamBold
UpButton.Text = "NAIK (UP)"
UpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
UpButton.TextSize = 11
Instance.new("UICorner", UpButton).CornerRadius = UDim.new(0, 6)

DownButton.Parent = HeightFrame
DownButton.BackgroundColor3 = Color3.fromRGB(200, 100, 40)
DownButton.Position = UDim2.new(0.52, 0, 0, 0)
DownButton.Size = UDim2.new(0.48, 0, 1, 0)
DownButton.Font = Enum.Font.GothamBold
DownButton.Text = "TURUN"
DownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DownButton.TextSize = 11
Instance.new("UICorner", DownButton).CornerRadius = UDim.new(0, 6)

SpeedFrame.Parent = ContentContainer
SpeedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpeedFrame.Size = UDim2.new(1, 0, 0, 35)
Instance.new("UICorner", SpeedFrame).CornerRadius = UDim.new(0, 6)

MinusButton.Parent = SpeedFrame
MinusButton.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
MinusButton.Position = UDim2.new(0, 5, 0, 5)
MinusButton.Size = UDim2.new(0, 35, 0, 25)
MinusButton.Font = Enum.Font.GothamBold
MinusButton.Text = "-"
MinusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusButton.TextSize = 14
Instance.new("UICorner", MinusButton).CornerRadius = UDim.new(0, 5)

PlusButton.Parent = SpeedFrame
PlusButton.BackgroundColor3 = Color3.fromRGB(30, 150, 30)
PlusButton.Position = UDim2.new(1, -40, 0, 5)
PlusButton.Size = UDim2.new(0, 35, 0, 25)
PlusButton.Font = Enum.Font.GothamBold
PlusButton.Text = "+"
PlusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusButton.TextSize = 14
Instance.new("UICorner", PlusButton).CornerRadius = UDim.new(0, 5)

SpeedLabel.Parent = SpeedFrame
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0, 45, 0, 0)
SpeedLabel.Size = UDim2.new(1, -90, 1, 0)
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.Text = "Speed: 1"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextSize = 12

-- UI Functionality
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ContentContainer.Visible = not isMinimized
    
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 70, 0, 35)
        Title.Visible = false
        CloseButton.Visible = false
        MinimizeButton.Size = UDim2.new(1, -12, 1, -6)
        MinimizeButton.Position = UDim2.new(0, 6, 0, 3)
        MinimizeButton.Text = "Fly"
        MinimizeButton.TextSize = 12
    else
        MainFrame.Size = UDim2.new(0, 210, 0, 180)
        Title.Visible = true
        CloseButton.Visible = true
        MinimizeButton.Size = UDim2.new(0, 22, 0, 22)
        MinimizeButton.Position = UDim2.new(1, -54, 0, 6)
        MinimizeButton.Text = "-"
        MinimizeButton.TextSize = 16
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

-- Fly Logic (Original XNEO Core)
local speeds = 1
local nowe = false
local tpwalking = false
local speaker = LocalPlayer

game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "FLY GUI V3";
    Text = "BY XNEO (Modern UI)";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
})

FlyToggle.MouseButton1Down:Connect(function()
    if nowe == true then
        nowe = false
        FlyToggle.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
        FlyToggle.Text = "Status: OFF"

        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    else 
        nowe = true
        FlyToggle.BackgroundColor3 = Color3.fromRGB(30, 150, 30)
        FlyToggle.Text = "Status: ON"

        for i = 1, speeds do
            task.spawn(function()
                local hb = RunService.Heartbeat    
                tpwalking = true
                local chr = LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
        
        LocalPlayer.Character.Animate.Disabled = true
        local Char = LocalPlayer.Character
        local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

        for i,v in next, Hum:GetPlayingAnimationTracks() do
            v:AdjustSpeed(0)
        end
        
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
        speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    end

    if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
        local torso = LocalPlayer.Character.Torso
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0

        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        if nowe == true then LocalPlayer.Character.Humanoid.PlatformStand = true end
        
        while nowe == true or LocalPlayer.Character.Humanoid.Health == 0 do
            RunService.RenderStepped:Wait()
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then speed = maxspeed end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then speed = 0 end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            bg.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        bg:Destroy()
        bv:Destroy()
        LocalPlayer.Character.Humanoid.PlatformStand = false
        LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false

    else
        local UpperTorso = LocalPlayer.Character.UpperTorso
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0

        local bg = Instance.new("BodyGyro", UpperTorso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = UpperTorso.CFrame
        local bv = Instance.new("BodyVelocity", UpperTorso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        if nowe == true then LocalPlayer.Character.Humanoid.PlatformStand = true end
        
        while nowe == true or LocalPlayer.Character.Humanoid.Health == 0 do
            task.wait()
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then speed = maxspeed end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then speed = 0 end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            bg.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        bg:Destroy()
        bv:Destroy()
        LocalPlayer.Character.Humanoid.PlatformStand = false
        LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    end
end)

-- Up & Down Controls
local isGoingUp = false
local isGoingDown = false

UpButton.MouseButton1Down:Connect(function()
    isGoingUp = true
    while isGoingUp do
        task.wait()
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
    end
end)
UpButton.MouseButton1Up:Connect(function() isGoingUp = false end)
UpButton.MouseLeave:Connect(function() isGoingUp = false end)

DownButton.MouseButton1Down:Connect(function()
    isGoingDown = true
    while isGoingDown do
        task.wait()
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
    end
end)
DownButton.MouseButton1Up:Connect(function() isGoingDown = false end)
DownButton.MouseLeave:Connect(function() isGoingDown = false end)

-- Speed Controls
local function updateSpeedWalk()
    if nowe == true then
        tpwalking = false
        for i = 1, speeds do
            task.spawn(function()
                local hb = RunService.Heartbeat    
                tpwalking = true
                local chr = LocalPlayer.Character
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
    end
end

PlusButton.MouseButton1Down:Connect(function()
    speeds = speeds + 1
    SpeedLabel.Text = "Speed: " .. speeds
    updateSpeedWalk()
end)

MinusButton.MouseButton1Down:Connect(function()
    if speeds > 1 then
        speeds = speeds - 1
        SpeedLabel.Text = "Speed: " .. speeds
        updateSpeedWalk()
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.7)
    LocalPlayer.Character.Humanoid.PlatformStand = false
    LocalPlayer.Character.Animate.Disabled = false
end)
