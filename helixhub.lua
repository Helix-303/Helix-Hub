-- // Rayfield UI Library Yükleme
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Helix Hub Universal Script",
   LoadingTitle = "Rayfield UI",
   LoadingSubtitle = "by Helix",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false
})

-- // K ve M Tuş Ayarları
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.K then
            -- Rayfield menü aç/kapat (K tuşu)
            local gui = game:GetService("CoreGui"):FindFirstChild("Rayfield")
            if gui then
                gui.Enabled = not gui.Enabled
            end
        elseif input.KeyCode == Enum.KeyCode.M then
            -- Mouse kilidini aç/kapat (M tuşu)
            UserInputService.MouseIconEnabled = not UserInputService.MouseIconEnabled
        end
    end
end)

-- // TAB 1: MAIN (Senin eski özelliklerin)
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateButton({
    Name = "Invisible GUI",
    Callback = function()
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

MainTab:CreateButton({
    Name = "Fly GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

MainTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

MainTab:CreateButton({
    Name = "Universal Glass Bridge GUI",
    Callback = function()
        pcall(function() game.CoreGui.AxomGlassGUI:Destroy() end)
        local gui = Instance.new("ScreenGui", game.CoreGui)
        gui.Name = "AxomGlassGUI"
        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0, 450, 0, 280)
        frame.Position = UDim2.new(0.5, -225, 0.5, -140)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        frame.Active = true
        frame.Draggable = true
        local title = Instance.new("TextLabel", frame)
        title.Text = "GLASS BRIDGE PATH | Helix"
        title.Size = UDim2.new(1, 0, 0, 40)
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1
        local show = Instance.new("TextButton", frame)
        show.Text = "SHOW"
        show.Size = UDim2.new(0.8, 0, 0, 50)
        show.Position = UDim2.new(0.1, 0, 0, 70)
        show.BackgroundColor3 = Color3.fromRGB(20, 100, 20)
        local unshow = Instance.new("TextButton", frame)
        unshow.Text = "UNSHOW"
        unshow.Size = UDim2.new(0.8, 0, 0, 50)
        unshow.Position = UDim2.new(0.1, 0, 0, 140)
        unshow.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
        local storedParts = {}
        show.MouseButton1Click:Connect(function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if (v:IsA("Part") or v:IsA("MeshPart")) and v.Size.Y < 2 then
                    storedParts[v] = {Color = v.BrickColor, Trans = v.Transparency}
                    v.BrickColor = v.CanCollide and BrickColor.new("Lime green") or BrickColor.new("Really red")
                    v.Transparency = 0
                end
            end
        end)
        unshow.MouseButton1Click:Connect(function()
            for v, data in pairs(storedParts) do
                if v and v.Parent then v.BrickColor = data.Color v.Transparency = data.Trans end
            end
        end)
    end
})

-- // TAB 2: TRAVERSAL (Yeni eklenen özellikler)
local TraversalTab = Window:CreateTab("Traversal", 4483362458)

TraversalTab:CreateButton({
   Name = "Disable Enemies AI",
   Callback = function()
   for _, enemy in pairs(workspace.Enemies:GetChildren()) do
    local enemyMain = enemy:FindFirstChild("EnemyMain")
    if enemyMain then
        local args = {
            [1] = {
                [1] = {
                    [1] = "\24",
                    [2] = enemyMain,
                    [3] = math.huge
                }
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
    wait(0.05)
end
   end,
})

TraversalTab:CreateToggle({
   Name = "Sigma Boi Aura",
   CurrentValue = false,
   Flag = "SigmaAura",
   Callback = function(Value)
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
      
      -- Toggle açıkken "True", kapalıyken "False" gönderir
      local stateStr = Value and "True" or "False"
      
      for i = 1, 30 do
         local codeChar = string.char(i)
         local args = {
            {
               { codeChar, stateStr }
            }
         }
         pcall(function()
            remoteEvent:FireServer(unpack(args))
         end)
         task.wait(0.1)
      end
   end,
})

TraversalTab:CreateButton({
   Name = "Spawn Weapons",
   Callback = function()
      local targetRemote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")

local weaponsToSpawn = {
    "Bat",
    "Knife", 
    "Axe",
    "Machete",
    "Crowbar",
    "Chainsaw",
    "Katana",
}

for _, weaponName in pairs(weaponsToSpawn) do
    local weapon = workspace:FindFirstChild(weaponName, true) 
    
    if weapon then
        local args = {
            {
                {
                    "\016",
                    weapon
                }
            }
        }
        targetRemote:FireServer(unpack(args))
    end
    
    wait(0.2)
end

local workspaceFolders = {
    "Weapons",
    "Tools",
    "Items", 
    "Drops",
    "SpawnedItems"
}

for _, folderName in pairs(workspaceFolders) do
    local folder = workspace:FindFirstChild(folderName)
    if folder then
        for _, weaponName in pairs(weaponsToSpawn) do
            local weapon = folder:FindFirstChild(weaponName)
            if weapon then
                local args = {
                    {
                        {
                            "\016",
                            weapon
                        }
                    }
                }
                targetRemote:FireServer(unpack(args))
                wait(0.2)
            end
        end
    end
end
   end,
})

Rayfield:LoadConfiguration()
