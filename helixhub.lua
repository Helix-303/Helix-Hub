-- // Rayfield yükleme
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Helix Hub Universal Script",
   LoadingTitle = "Rayfield UI",
   LoadingSubtitle = "by Helix",
   ConfigurationSaving = {
      Enabled = false
   }
})

local Tab = Window:CreateTab("Main", 4483362458)

-- // 1. Invisible GUI butonu
Tab:CreateButton({
    Name = "Invisible GUI",
    Callback = function()
        -- senin invisible gui kodun burda çalışıyor
        loadstring([[
            local key = Enum.KeyCode.X -- key to toggle invisibility
            local invis_on = false
            local defaultSpeed = 16
            local boostedSpeed = 48
            local isSpeedBoosted = false

            local player = game.Players.LocalPlayer
            local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
            local frame = Instance.new("Frame", screenGui)
            local toggleButton = Instance.new("TextButton", frame)
            local closeButton = Instance.new("TextButton", frame)
            local signatureLabel = Instance.new("TextLabel", frame)
            local speedButton = Instance.new("TextButton", frame)

            screenGui.ResetOnSpawn = false
            frame.Size = UDim2.new(0, 100, 0, 110)
            frame.Position = UDim2.new(0.5, -110, 0.5, -60)
            frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            frame.Active = true
            frame.Draggable = true

            toggleButton.Size = UDim2.new(0, 80, 0, 30)
            toggleButton.Position = UDim2.new(0, 10, 0, 30)
            toggleButton.Text = "INVISIBLE"
            toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleButton.Font = Enum.Font.SourceSans
            toggleButton.TextScaled = true

            closeButton.Size = UDim2.new(0, 20, 0, 20)
            closeButton.Position = UDim2.new(1, -30, 0, 5)
            closeButton.Text = "X"
            closeButton.BackgroundColor3 = Color3.fromRGB(255, 123, 0)
            closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            closeButton.Font = Enum.Font.SourceSans
            closeButton.TextSize = 18

            signatureLabel.Size = UDim2.new(0, 100, 0, 10)
            signatureLabel.Position = UDim2.new(0, 0, 0.9, 0)
            signatureLabel.Text = "By: Helix"
            signatureLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            signatureLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            signatureLabel.Font = Enum.Font.SourceSans
            signatureLabel.TextScaled = true
            signatureLabel.Transparency = 0.3

            speedButton.Size = UDim2.new(0, 80, 0, 30)
            speedButton.Position = UDim2.new(0, 10, 0, 65)
            speedButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            speedButton.Text = "SPEED BOOST"
            speedButton.TextScaled = true
            speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            speedButton.Font = Enum.Font.SourceSans

            local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
            sound.SoundId = "rbxassetid://942127495"
            sound.Volume = 1

            local function setTransparency(character, transparency)
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("Decal") then
                        part.Transparency = transparency
                    end
                end
            end

            local function toggleInvisibility()
                invis_on = not invis_on
                sound:Play()
                if invis_on then
                    local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    wait()
                    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-25.95, 84, 3537.55))
                    wait(.15)
                    local Seat = Instance.new('Seat', game.Workspace)
                    Seat.Anchored = false
                    Seat.CanCollide = false
                    Seat.Name = 'invischair'
                    Seat.Transparency = 1
                    Seat.Position = Vector3.new(-25.95, 84, 3537.55)
                    local Weld = Instance.new("Weld", Seat)
                    Weld.Part0 = Seat
                    Weld.Part1 = game.Players.LocalPlayer.Character:FindFirstChild("Torso") or game.Players.LocalPlayer.Character.UpperTorso
                    wait()
                    Seat.CFrame = savedpos
                    setTransparency(game.Players.LocalPlayer.Character, 0.5)
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Invis (on)",
                        Duration = 3,
                        Text = "STATUS:"
                    })
                else
                    local invisChair = workspace:FindFirstChild('invischair')
                    if invisChair then
                        invisChair:Destroy()
                    end
                    setTransparency(game.Players.LocalPlayer.Character, 0)
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Invis (off)",
                        Duration = 3,
                        Text = "STATUS:"
                    })
                end
            end

            local function toggleSpeedBoost()
                isSpeedBoosted = not isSpeedBoosted
                sound:Play()
                local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    if isSpeedBoosted then
                        humanoid.WalkSpeed = boostedSpeed
                        speedButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Speed Boost (on)",
                            Duration = 3,
                            Text = "Speed: " .. boostedSpeed
                        })
                    else
                        humanoid.WalkSpeed = defaultSpeed
                        speedButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "Speed Boost (off)",
                            Duration = 3,
                            Text = "Speed: " .. defaultSpeed
                        })
                    end
                end
            end

            toggleButton.MouseButton1Click:Connect(toggleInvisibility)
            speedButton.MouseButton1Click:Connect(toggleSpeedBoost)
            closeButton.MouseButton1Click:Connect(function()
                frame.Visible = false
            end)

            player.CharacterAdded:Connect(function(character)
                isSpeedBoosted = false
                local humanoid = character:WaitForChild("Humanoid")
                humanoid.WalkSpeed = defaultSpeed
                speedButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end)
        ]])()
    end
})

-- // 2. Fly GUI butonu
Tab:CreateButton({
    Name = "Fly GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

-- // 3. Infinite Yield butonu
Tab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

Tab:CreateButton({
    Name = "Universal Glass Bridge GUI",
    Callback = function()
        --// Universal Glass Bridge Path Show (Dark Theme)

pcall(function() game.CoreGui.AxomGlassGUI:Destroy() end)

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "AxomGlassGUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 450, 0, 280)
frame.Position = UDim2.new(0.5, -225, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35) -- koyu tema
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local glow = Instance.new("UIStroke", frame)
glow.Thickness = 2
glow.Color = Color3.fromRGB(100, 180, 255) -- mavi glow
glow.Transparency = 0.2

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel", frame)
title.Text = "UNIVERSAL GLASS BRIDGE PATH SHOW | Made by Helix"
title.Size = UDim2.new(1, -50, 0, 40)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(230, 230, 255) -- açık beyaz
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -45, 0, 5)
close.Text = "❌"
close.BackgroundColor3 = Color3.fromRGB(60, 20, 20) -- koyu kırmızı ton
close.BackgroundTransparency = 0.2
close.TextColor3 = Color3.fromRGB(255, 120, 120)
close.Font = Enum.Font.GothamBold
close.TextScaled = true
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local function createButton(name, posY, bgColor)
    local btn = Instance.new("TextButton", frame)
    btn.Text = name
    btn.Size = UDim2.new(0.8, 0, 0, 50)
    btn.Position = UDim2.new(0.1, 0, 0, posY)
    btn.BackgroundColor3 = bgColor
    btn.BackgroundTransparency = 0.15
    btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    return btn
end

local show = createButton("SHOW", 70, Color3.fromRGB(20, 100, 20))   -- koyu yeşil
local reset = createButton("UNSHOW", 140, Color3.fromRGB(120, 30, 30)) -- koyu kırmızı

--// Logic
local storedParts = {}
local alreadyMarked = {}

local function revealOnce()
    for _, v in ipairs(workspace:GetDescendants()) do
        if (v:IsA("Part") or v:IsA("MeshPart")) and v.Size.Y < 2 then
            if not storedParts[v] then
                storedParts[v] = {
                    Color = v.BrickColor,
                    Material = v.Material,
                    Transparency = v.Transparency
                }
            end
            if not alreadyMarked[v] then
                if v.CanCollide then
                    v.BrickColor = BrickColor.new("Lime green")
                    v.Material = Enum.Material.SmoothPlastic
                    v.Transparency = 0
                else
                    v.BrickColor = BrickColor.new("Really red")
                    v.Material = Enum.Material.SmoothPlastic
                    v.Transparency = 0
                end
                alreadyMarked[v] = true
            end
        end
    end
end

local function resetAll()
    for v, data in pairs(storedParts) do
        if v and v.Parent then
            v.BrickColor = data.Color
            v.Material = data.Material
            v.Transparency = data.Transparency
        end
        alreadyMarked[v] = nil
    end
end

show.MouseButton1Click:Connect(revealOnce)
reset.MouseButton1Click:Connect(resetAll)
    end
})
Tab:CreateButton({
    Name = "",
    Callback = function()
        
    end
})
Tab:CreateButton({
    Name = "isim",
    Callback = function()
        
    end
})
