local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/Neverlose/source.lua"))()
function ToggleGuiCustom(value)
    if game:GetService("CoreGui"):FindFirstChild("Neverlose") == nil then return end
    enabled = (type(value) == "boolean" and value) or game:GetService("CoreGui"):FindFirstChild("Neverlose").Enabled
    game:GetService("CoreGui"):FindFirstChild("Neverlose").Enabled = not enabled
end

local GuiEnabled = true

local CHEAT_CLIENT = {}
local ESP_CLIENT = {}
local OTHER_CLIENT = {}
do
    CHEAT_CLIENT.player = game.Players.LocalPlayer
    CHEAT_CLIENT.camera = game.Workspace.CurrentCamera
    CHEAT_CLIENT.mouse = CHEAT_CLIENT.player:GetMouse()
    CHEAT_CLIENT.FOV = 200
    CHEAT_CLIENT.Enabled = false
    CHEAT_CLIENT.Tracer = false
    CHEAT_CLIENT.TracerColor = Color3.fromRGB(255,0,0)
    CHEAT_CLIENT.Bots = false
    CHEAT_CLIENT.Taps = 2
    OTHER_CLIENT.FireRate = 0.1
    CHEAT_CLIENT.AutoShoot = false

    ESP_CLIENT.Enabled = false
    ESP_CLIENT.Crosshair = false
    ESP_CLIENT.Boxes = false
    ESP_CLIENT.GColor = Color3.fromRGB(255,255,255)
    ESP_CLIENT.Bots = false
    ESP_CLIENT.Deads = false
    ESP_CLIENT.Distance = false


    OTHER_CLIENT.Fullbright = false
    OTHER_CLIENT.SpeedHack = false
    OTHER_CLIENT.SpeedhackBoost = 1.2
    _G.BaseFov = 90
    _G.ZoomFov = 20
    OTHER_CLIENT.GunMat = "ForceField"
    OTHER_CLIENT.HandMat = "ForceField"
    OTHER_CLIENT.Guntra = 0
    OTHER_CLIENT.Handtra = 0
    OTHER_CLIENT.Nohands = false
    OTHER_CLIENT.ViewModelChanges = false
    OTHER_CLIENT.Leaves = false
    OTHER_CLIENT.ViewModelOffset = CFrame.new(-2, -2, 0)
    OTHER_CLIENT.Ambient = Color3.fromRGB(255,255,255)
    OTHER_CLIENT.OutdoorAmbient = Color3.fromRGB(155,155,155)
end

local fovcircle = Drawing.new("Circle")
fovcircle.Visible = false
fovcircle.Radius = CHEAT_CLIENT.FOV
fovcircle.Thickness = 2
fovcircle.Filled = false
fovcircle.Transparency = 1
fovcircle.Color = Color3.fromRGB(255, 255, 255)
fovcircle.Position = Vector2.new(CHEAT_CLIENT.camera.ViewportSize.X / 2, CHEAT_CLIENT.camera.ViewportSize.Y / 2)
local fovcircle2 = Drawing.new("Circle")
fovcircle2.Visible = false
fovcircle2.Radius = 2
fovcircle2.Thickness = 1
fovcircle2.Filled = true
fovcircle2.Transparency = 1
fovcircle2.Color = Color3.fromRGB(255, 255, 255)
fovcircle2.Position = Vector2.new(CHEAT_CLIENT.camera.ViewportSize.X / 2, CHEAT_CLIENT.camera.ViewportSize.Y / 2)

local Window = Library:Window({
    text = "Nextronity"
})

local TabSection = Window:TabSection({
    text = "Project delta"
})

local Tab = TabSection:Tab({
    text = "Combat",
    icon = "rbxassetid://16881376749",
})
local Tab2 = TabSection:Tab({
    text = "Visual",
    icon = "rbxassetid://16881376749",
})
local Tab3 = TabSection:Tab({
    text = "Other",
    icon = "rbxassetid://16881376749",
})



local Section = Tab:Section({
    text = "Main"
})
local secmods = Tab:Section({
    text = "Gun mods"
})
local Section2 = Tab2:Section({
    text = "ESP"
})
local seccross = Tab2:Section({
    text = "Crosshair"
})
local sectracers = Tab2:Section({
    text = "Tracers"
})
local seccfov = Tab2:Section({
    text = "Camera FOV"
})
local secmisc = Tab2:Section({
    text = "Misc"
})
local secmodel = Tab2:Section({
    text = "View Model"
})
local Section3 = Tab3:Section({
    text = "Other"
})
local Section4 = Tab3:Section({
    text = "World"
})

local function Notify(tt, tx)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = tt,
        Text = tx,
        Duration = 5
    })
end

Section:Toggle({
    text = "Toggle aim",
    state = false, -- Default boolean
    callback = function(boolean)
        CHEAT_CLIENT.Enabled = boolean
    end
})
Section:Toggle({
    text = "Toggle FOV",
    state = false, -- Default boolean
    callback = function(boolean)
        fovcircle.Visible = boolean
    end
})

Section:Slider({
    text = "Aim FOV",
    min = 60,
    max = 600,
    callback = function(number)
        CHEAT_CLIENT.FOV = number
        fovcircle.Radius = CHEAT_CLIENT.FOV
    end
})

Section:Colorpicker({
    text = "FOV Circle Color",
    color = Color3.fromRGB(255,255,255),
    callback = function(RGB)
        fovcircle.Color = RGB
    end
})

secmods:Textbox({
    text = "FireRate",
    value = "0.1",
    callback = function(String)
        local inv = game.ReplicatedStorage.Players:FindFirstChild(CHEAT_CLIENT.player.Name).Inventory
        for i,v in ipairs(inv:GetChildren()) do
            local sett = require(v.SettingsModule)
            sett.FireRate = tonumber(String)
        end
        CHEAT_CLIENT.FireRate = tonumber(String)
    end
})
secmods:Slider({
    text = "n'taps",
    min = 1,
    max = 7,
    -- [[Float = 0,]] Idk what it does
    callback = function(number)
        CHEAT_CLIENT.Taps = number
    end
})



Section2:Toggle({
    text = "Toggle ESP",
    state = false, -- Default boolean
    callback = function(boolean)
        ESP_CLIENT.Enabled = boolean
    end
})
Section2:Toggle({
    text = "ESP Boxes",
    state = false, -- Default boolean
    callback = function(boolean)
        ESP_CLIENT.Boxes = boolean
    end
})
Section2:Toggle({
    text = "Distance",
    state = false, -- Default boolean
    callback = function(boolean)
        ESP_CLIENT.Distance = boolean
    end
})
--[[
Section2:Toggle({
    text = "Bodies",
    state = false, -- Default boolean
    callback = function(boolean)
        ESP_CLIENT.Deads = boolean
    end
})
]]
Section2:Toggle({
    text = "Bots",
    state = false, -- Default boolean
    callback = function(boolean)
        ESP_CLIENT.Bots = boolean
    end
})
Section2:Colorpicker({
    text = "ESP Global Color",
    color = Color3.fromRGB(255,255,255),
    callback = function(RGB)
        ESP_CLIENT.GColor = RGB
    end
})
seccross:Toggle({
    text = "CrossHair",
    state = false, -- Default boolean
    callback = function(boolean)
        ESP_CLIENT.Crosshair = boolean
        fovcircle2.Visible = boolean
    end
})
seccross:Slider({
    text = "Cross Thick",
    min = 0.5,
    max = 20,
    -- [[Float = 0,]] Idk what it does
    callback = function(number)
        fovcircle2.Thickness = number
    end
})
seccross:Slider({
    text = "Cross Radius",
    min = 0.5,
    max = 20,
    -- [[Float = 0,]] Idk what it does
    callback = function(number)
        fovcircle2.Radius = number
    end
})
seccross:Colorpicker({
    text = "Crosshair Color",
    color = Color3.fromRGB(255,255,255),
    callback = function(RGB)
        fovcircle2.Color = RGB
    end
})
sectracers:Toggle({
    text = "Tracers",
    state = false, -- Default boolean
    callback = function(boolean)
        CHEAT_CLIENT.Tracer = boolean
    end
})
sectracers:Colorpicker({
    text = "Tracer color",
    color = Color3.fromRGB(255,0,0),
    callback = function(RGB)
        TracerColor = RGB
    end
})
secmisc:Toggle({
    text = "Remove masks gui",
    state = false, -- Default boolean
    callback = function(boolean)
        if boolean == true then
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.HelmetMask.TitanShield.Size = UDim2.new(0,0,1,0)
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Mask.GP5.Size = UDim2.new(0,0,1,0)
            for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Visor:GetChildren()) do
                v.Size = UDim2.new(0,0,1,0)
            end
        else
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.HelmetMask.TitanShield.Size = UDim2.new(1,0,1,0)
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Mask.GP5.Size = UDim2.new(1,0,1,0)
            for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Visor:GetChildren()) do
                v.Size = UDim2.new(1,0,1,0)
            end
        end
    end
})
seccfov:Slider({
    text = "Base FOV",
    min = 50,
    max = 120,
    callback = function(number)
        _G.BaseFov = number
    end
})
seccfov:Slider({
    text = "Zoom FOV",
    min = 2,
    max = 120,
    callback = function(number)
        _G.ZoomFov = number
    end
})

--[[
secmodel:Toggle({
    text = "Enable",
    state = false, -- Default boolean
    callback = function(boolean)
        OTHER_CLIENT.ViewModelChanges = boolean
    end
})
]]
secmodel:Textbox({
    text = "Offset (x,y,z)",
    value = "-2, -2, 0",
    callback = function(String)
        local x, y, z = String:match("([^,]+), ([^,]+), ([^,]+)")
        if not x or not y or not z then return end
        local offset = CFrame.new(Vector3.new(tonumber(x), tonumber(y), tonumber(z)))
        if not offset then return end
        local inv = game.ReplicatedStorage.Players:FindFirstChild(CHEAT_CLIENT.player.Name).Inventory
        for i,v in ipairs(inv:GetChildren()) do
            local sett = require(v.SettingsModule)
            sett.weaponOffSet = offset
        end
        OTHER_CLIENT.ViewModelOffset = offset
    end
})



Section3:Button({
    text = "Ability to third person",
    callback = function()
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 99999
        game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
    end,
})
Section3:Toggle({
    text = "SpeedHack",
    state = false, -- Default boolean
    callback = function(boolean)
        OTHER_CLIENT.SpeedHack = boolean
        task.spawn(function()
            startspeedhack()
        end)
    end
})
Section3:Textbox({
    text = "Speedhack Boost",
    value = "1.2",
    callback = function(String)
        if tonumber(String) ~= nil then
            OTHER_CLIENT.SpeedhackBoost = tonumber(String)
        end
    end
})
Section3:Toggle({
    text = "Anti flash",
    state = false, -- Default boolean
    callback = function(boolean)
        if boolean == true then
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Flashbang.Size = UDim2.new(0,0,1,0)
        else
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Flashbang.Size = UDim2.new(1,0,1,0)
        end
    end
})

Section4:Toggle({
    text = "Terrain Grass",
    state = false, -- Default boolean
    callback = function(boolean)
        sethiddenproperty(workspace.Terrain, "Decoration", boolean)
    end
})
Section4:Toggle({
    text = "Toggle leaves",
    state = false, -- Default boolean
    callback = function(boolean)
        if not workspace:FindFirstChild("SpawnerZones") then
            Notify("Error", 'Cant run "Toggle Leaves" in lobby')
            return
        end
        OTHER_CLIENT.Leaves = boolean
        for i,v in ipairs(workspace.SpawnerZones.Foliage:GetDescendants()) do
            if v:FindFirstChildOfClass("SurfaceAppearance") then
                if boolean then
                    v.Transparency = 1
                else
                    v.Transparency = 0
                end
            end
        end
    end
})
Section4:Colorpicker({
    text = "Ambient color",
    color = Color3.fromRGB(255,255,255),
    callback = function(RGB)
        OTHER_CLIENT.Ambient = RGB
        game.Lighting.Ambient = RGB
    end
})
Section4:Colorpicker({
    text = "Outdoor ambient color",
    color = Color3.fromRGB(255,255,255),
    callback = function(RGB)
        OTHER_CLIENT.OutdoorAmbient = RGB
        game.Lighting.OutdoorAmbient = RGB
    end
})



game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        ToggleGuiCustom(GuiEnabled)
        GuiEnabled = not GuiEnabled
    end
end)

-------------------------------------------------------------------------

function isvisible2(target)
    local cameraPos = CHEAT_CLIENT.camera.CFrame.Position
    local targetPos
    if target ~= nil and target.Character ~= nil then
        target = target.Character
        if target:FindFirstChild("Head") then
            local ignoreList = {}
            for _, child in ipairs(target:GetChildren()) do
                if child:IsA("Model") or child:IsA("Hat") or child:IsA("MeshPart") or child.Name == "HeadTopHitBox" or child.Name == "FaceHitBox" then
                    table.insert(ignoreList, child)
                end
            end
            table.insert(ignoreList, game.Players.LocalPlayer.Character)
            targetPos = target.Head.Position

            local start = cameraPos
            local goal = targetPos
            local ray = Ray.new(start, (goal - start).unit * (goal - start).magnitude)
            local hit = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
            if hit then
                return false
            else
                return true
            end
        else
            return false
        end
    else
        return false
    end
end

local textisvis = Drawing.new("Text")
textisvis.Font = 2
textisvis.Text = "NOT VISIBLE"
textisvis.Size = 28
textisvis.Outline = true
textisvis.Center = true
textisvis.Transparency = 1
textisvis.Visible = false
local centerofscreen = Vector2.new(CHEAT_CLIENT.camera.ViewportSize.X / 2, CHEAT_CLIENT.camera.ViewportSize.Y / 2)
task.spawn(function()
    while wait(0.05) do
        textisvis.Visible = CHEAT_CLIENT.Enabled
        textisvis.Position = Vector2.new(centerofscreen.X, centerofscreen.Y + CHEAT_CLIENT.FOV + 15)
        local current_target = nil
        local maximum_distance = math.huge
        for _, v in pairs(game.Players:GetPlayers()) do
            local isvis = isvisible2(v)
            if v == plr or not v.Character or not v.Character:FindFirstChild("HumanoidRootPart") or isvis == false then
                continue
            end

            local position, on_screen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if not on_screen or isvis == false then
                continue
            end

            local distance = (Vector2.new(position.X, position.Y - game.GuiService:GetGuiInset(game.GuiService).Y) - Vector2.new(CHEAT_CLIENT.mouse.X, CHEAT_CLIENT.mouse.Y)).Magnitude
            if distance < maximum_distance and distance < CHEAT_CLIENT.FOV then
                current_target = v
                maximum_distance = distance
            end
        end
        local check = isvisible2(current_target)
        if check == true then
            textisvis.Text = "VISIBLE"
            textisvis.Color = Color3.fromRGB(52, 235, 70)
        else
            textisvis.Text = "NOT VISIBLE"
            textisvis.Color = Color3.fromRGB(235, 52, 52)
        end
    end
end)


function _G.createtracer(start, endp)
    local beam = Instance.new("Beam")
    beam.Name = "LineBeam"
    beam.Parent = game.Workspace
    local startpart = Instance.new("Part")
    startpart.CanCollide = false
    startpart.CanQuery = false
    startpart.Transparency = 1
    startpart.Position = start
    startpart.Parent = workspace
    startpart.Anchored = true
    startpart.Size = Vector3.new(0.01, 0.01, 0.01)
    local endpart = Instance.new("Part")
    endpart.CanCollide = false
    endpart.CanQuery = false
    endpart.Transparency = 1
    endpart.Position = endp
    endpart.Parent = workspace
    endpart.Anchored = true
    endpart.Size = Vector3.new(0.01, 0.01, 0.01)
    beam.Attachment0 = Instance.new("Attachment", startpart)
    beam.Attachment1 = Instance.new("Attachment", endpart)
    beam.Color = ColorSequence.new(CHEAT_CLIENT.TracerColor,  CHEAT_CLIENT.TracerColor)
    beam.Width0 = 0.05
    beam.Width1 = 0.05
    beam.FaceCamera = true
    beam.Transparency = NumberSequence.new(0)
    beam.LightEmission = 1

    wait(2)

    beam:Destroy()
    startpart:Destroy()
end

function _G.get_target()
    local current_target = nil
    local maximum_distance = math.huge
    local plr = game.Players.LocalPlayer
    if CHEAT_CLIENT.Enabled == false then return nil end

    if CHEAT_CLIENT.Bots == true then
        for _, v in pairs(game.Players:GetPlayers()) do
            local isvis = isvisible2(v)
            if v == plr or not v.Character or not v.Character:FindFirstChild("HumanoidRootPart") or isvis == false then
                continue
            end

            local position, on_screen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if not on_screen or isvis == false then
                continue
            end

            local distance = (Vector2.new(position.X, position.Y - game.GuiService:GetGuiInset(game.GuiService).Y) - Vector2.new(CHEAT_CLIENT.mouse.X, CHEAT_CLIENT.mouse.Y)).Magnitude
            if distance < maximum_distance and distance < CHEAT_CLIENT.FOV then
                current_target = v
                maximum_distance = distance
            end
        end
    else
        for _, v in pairs(game.Players:GetPlayers()) do
            local isvis = isvisible2(v)
            if v == plr or not v.Character or not v.Character:FindFirstChild("HumanoidRootPart") or isvis == false then
                continue
            end

            local position, on_screen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if not on_screen or isvis == false then
                continue
            end

            local distance = (Vector2.new(position.X, position.Y - game.GuiService:GetGuiInset(game.GuiService).Y) - Vector2.new(CHEAT_CLIENT.mouse.X, CHEAT_CLIENT.mouse.Y)).Magnitude
            if distance < maximum_distance and distance < CHEAT_CLIENT.FOV then
                current_target = v
                maximum_distance = distance
            end
        end
    end

    return current_target
end

local fpsbullet = require(game.ReplicatedStorage.Modules.FPS.Bullet)
fpsbullet.CreateBullet = function(prikol, p49, p50, p_u_51, _, p52, p53, p54, p55)
    local v1 = {}
    local v_u_6 = game.ReplicatedStorage.Remotes.VisualProjectile
    local v_u_108 = 1
    local v_u_106 = 0
    local v_u_7 = game.ReplicatedStorage.Remotes.FireProjectile
    local target = _G.get_target()
    local v_u_4 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"))
    local v9 = game:GetService("Players")
    local v_u_15 = v9.LocalPlayer
    local v_u_115 = v_u_4:GetEstimatedCameraPosition(v_u_15)
    local v_u_103
    local v_u_114
    local v_u_16 = game.ReplicatedStorage.Players:FindFirstChild(v_u_15.Name)
    local v_u_64 = v_u_16.Status.GameplayVariables:GetAttribute("EquipId")
    local v_u_13 = game.ReplicatedStorage:WaitForChild("VFX")
    if target ~= nil then
        target_part = target.Character.Head
        v_u_103 = CFrame.new(v_u_115, target_part.Position).LookVector
        v_u_114 = v_u_103
    else
        target_part = p55
        v_u_103 = CFrame.new(v_u_115, v_u_15:GetMouse().Hit.Position).LookVector
        v_u_114 = v_u_103
    end
    local v79 = {
        ["x"] = {
            ["Value"] = 0.00001
        },
        ["y"] = {
            ["Value"] = 0.00001
        }
    }
    local v_u_2 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"))
    local v3 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"))
    local v_u_5 = game.ReplicatedStorage.Remotes.ProjectileInflict
    local v_u_10 = game:GetService("ReplicatedStorage")
    local v_u_12 = v_u_10:WaitForChild("RangedWeapons")
    local v_u_17 = game.ReplicatedStorage.Temp
    local v9 = game:GetService("Players")
    local v_u_56 = v_u_15.Character
    local v135 = 500000
    local v_u_18 = v3.ReturnTable("GlobalIgnoreListProjectile")
    local v_u_115 = v_u_4:GetEstimatedCameraPosition(v_u_15)
    local v65 = v_u_10.AmmoTypes:FindFirstChild(p52)
    local v_u_74 = v65:GetAttribute("Pellets")
    local v60 = p50.ItemRoot
    local v61 = p49.ItemProperties
    local v62 = v_u_12:FindFirstChild(p49.Name)
    local v63 = v61:FindFirstChild("SpecialProperties")
    local v_u_66 = v63 and v63:GetAttribute("TracerColor") or v62:GetAttribute("ProjectileColor")
    local itemprop = require(v_u_16.Inventory:FindFirstChild(p49.Name).SettingsModule)

    if v_u_56:FindFirstChild(p49.Name) then
        local v83 = 0.01
        local v82 = 0.01
        local v81 = 10000
        if v61.Tool:GetAttribute("MuzzleDevice") or "Default" == "Suppressor" then
            if tick() - p53 < 0.8 then
                v_u_4:PlaySoundV2(v60.FireSoundSupressed, v60.FireSoundSupressed.TimeLength, v_u_17)
            else
                v_u_4:PlaySoundV2(v60.FireSoundSupressed, v60.FireSoundSupressed.TimeLength, v_u_17)
            end
        elseif tick() - p53 < 0.8 then
            v_u_4:PlaySoundV2(v60.FireSound, v60.FireSound.TimeLength, v_u_17)
        else
            v_u_4:PlaySoundV2(v60.FireSound, v60.FireSound.TimeLength, v_u_17)
        end
        local v_u_59
        if p_u_51.Item.Attachments:FindFirstChild("Front") then
            v_u_59 = p_u_51.Item.Attachments.Front:GetChildren()[1].Barrel
            local _ = p50.Attachments.Front:GetChildren()[1].Barrel
        else
            v_u_59 = p_u_51.Item.Barrel
            local _ = p50.Barrel
        end

        function v185()
            local v_u_110 = RaycastParams.new()
            v_u_110.FilterType = Enum.RaycastFilterType.Exclude
            local v_u_111 = { v_u_56, p_u_51, v_u_18 }
            v_u_110.FilterDescendantsInstances = v_u_111
            v_u_110.IgnoreWater = false
            v_u_110.CollisionGroup = "WeaponRay"
            v_u_110.IgnoreWater = true

            local v_u_128, v_u_129
            if v_u_72 then
                v_u_128 = v_u_13.MuzzleEffects.Tracer:Clone()
                v_u_128.Name = game.Players.LocalPlayer.UserId
                v_u_128.Color = v_u_66
                v_u_14:AddItem(v_u_128, 10)
                v_u_128.Position = Vector3.new(0, -100, 0)
                v_u_128.Parent = game.Workspace.NoCollision.Effects
                local _ = v_u_57.AssemblyLinearVelocity
                v_u_129 = v_u_59.Position
            else
                v_u_129 = nil
                v_u_128 = nil
            end

            v_u_106 += 1
            if v_u_106 == 1 then
                v_u_108 = 0
                local v125 = game.Players.LocalPlayer.UserId
                v_u_107 = tostring(v125)
                task.spawn(function()
                    for i=1, CHEAT_CLIENT.Taps do
                        if not v_u_7:InvokeServer(v_u_114, v_u_108, false) then
                            game.ReplicatedStorage.Modules.FPS.Binds.AdjustBullets:Fire(v_u_64, 1)
                        end
                    end
                end)
            elseif 1 < v_u_106 then
                for i=1, CHEAT_CLIENT.Taps do
                    v_u_6:FireServer(v_u_114, v_u_108)
                end
            end

            local v_u_131 = nil
            local v_u_132 = 0
            local v_u_133 = 0
            function v184(p134)
                v_u_132 = v_u_132 + p134
                if 0.008333333333333333 < v_u_132 then
                    v_u_133 = v_u_133 + v_u_132
                    local v136 = workspace:Raycast(v_u_115, v_u_114 * v135, v_u_110)
                    local v137 = nil
                    local v138 = nil
                    local v139 = nil
                    local v140
                    if v136 then
                        v137 = v136.Instance
                        v140 = v136.Position
                        v138 = v136.Normal
                        v139 = v136.Material
                    else
                        v140 = v_u_115 + v_u_114 * v135
                    end

                    if v137 == nil then
                        v_u_131:Disconnect()
                        return
                    end
                    task.spawn(function()
                        _G.createtracer(v60.Position, v140)
                    end)

                    local v175 = v137.CFrame:ToObjectSpace(CFrame.new(v140))
                    v_u_2.Impact(v137, v140, v138, v139, v_u_114, "Ranged", true)
                    if v_u_128 then
                        if v_u_128:FindFirstChild("Trail") then
                            wait(v_u_128.Trail.Lifetime)
                        end
                        v_u_128:Destroy()
                        return
                    end
                    v_u_5:FireServer(v137, v175, v_u_108)
                    v_u_131:Disconnect()
                    return
                end
                v_u_131:Disconnect()
            end
            v_u_131 = game:GetService("RunService").RenderStepped:Connect(v184)
            return
        end
        if v_u_74 == nil then
            task.spawn(v185)
        else
            for _ = 1, v_u_74 do
                task.spawn(v185)
            end
        end
        return v83, v82, v81, v79
    end
    task.wait(itemprop.FireRate)
    return v1
end

local csys = require(game.ReplicatedStorage.Modules.CameraSystem)
local dop2 = require(game.ReplicatedStorage.Modules.spring).new(Vector3.new(), Vector3.new(), Vector3.new(), 15, 0.5)
local dop3 = game:GetService("TweenService")
local dop4 = workspace.Camera
local dop5 = false
local dop6 = 1
local dop7 = false
local dop8 = 1
local dop9 = 1
local dop10 = nil
local function FieldOfViewUpdate(p11, p12, p13)
    local v14 = p12 or Enum.EasingStyle.Quad
    local v15 = p13 or Enum.EasingDirection.Out
    local targetfov
    if dop8 > 1 then
        targetfov = _G.ZoomFov
    else
        targetfov = _G.BaseFov
    end
    local v16 = dop9 ~= 1 and dop9 or dop5 and dop6 or targetfov
    dop3:Create(dop4, TweenInfo.new(p11, v14, v15), {
        ["FieldOfView"] = v16 > 1 and dop7 and v16 or v16
    }):Play()
    if dop10 then
        local v_u_17 = dop10
        task.spawn(function()
            local v_u_18 = v_u_17:FindFirstChild("Head") or v_u_17.PrimaryPart
            dop2.p = v_u_18.Position
            local v_u_19 = nil
            v_u_19 = game:GetService("RunService").RenderStepped:Connect(function(p20)
                dop4.CFrame = CFrame.lookAt(dop4.CFrame.Position, dop2.p)
                dop2.target = v_u_18.Position
                dop2:update(p20)
                if dop10 ~= v_u_17 then
                    v_u_19:Disconnect()
                end
            end)
        end)
    end
end
csys.SetZoomTarget = function(_, p21, p22, p23, p24, p25)
    dop7 = p22
    dop8 = p21
    FieldOfViewUpdate(p23, p24, p25)
end

pcall(function()
    local lighting = game:GetService("Lighting");
    lighting.Ambient = OTHER_CLIENT.Ambient
    lighting.OutdoorAmbient = OTHER_CLIENT.OutdoorAmbient
    lighting.Brightness = 1;
    lighting.FogEnd = 100000
    lighting.GlobalShadows = false
        for i,v in pairs(lighting:GetDescendants()) do
                if v:IsA("Atmosphere") then
                        v:Destroy()
                end
        end
    for i, v in pairs(lighting:GetDescendants()) do
        if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
            v.Enabled = false;
        end;
    end;
    lighting.Changed:Connect(function()
        lighting.Ambient = OTHER_CLIENT.Ambient
        lighting.Brightness = 1;
        lighting.FogEnd = 100000
        lighting.OutdoorAmbient = OTHER_CLIENT.OutdoorAmbient
            for i,v in pairs(lighting:GetDescendants()) do
                    if v:IsA("Atmosphere") then
                            v:Destroy()
                    end
            end
    end);
    spawn(function()
        local character = game:GetService("Players").LocalPlayer.Character;
        while wait(0.05) do
            repeat wait(0.05) until character ~= nil;
            if not character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                local headlight = Instance.new("PointLight", character.HumanoidRootPart);
                headlight.Brightness = 1;
                headlight.Range = 60;
            end;
        end;
    end);
end)

local inesp = {}
local function esp(plr, char)
    for i,v in ipairs(inesp) do
        if v[1] == char then
            return
        end
    end
    task.spawn(function()
        if not char then return end
        local hum = char:WaitForChild("Humanoid")
        local hrp = char:WaitForChild("HumanoidRootPart")

        local title = Drawing.new("Text")
        title.Visible = false
        title.Transparency = 1
        title.Size = 14
        title.Outline = true
        title.Color = ESP_CLIENT.GColor
        title.OutlineColor = Color3.fromRGB(0,0,0)
        title.Center = true

        local box = Drawing.new("Square")
        box.Visible = false
        box.Color = ESP_CLIENT.GColor
        box.Thickness = 1
        box.Transparency = 1
        box.Filled = false

        local tableinfo = {char, title, box, false}
        table.insert(inesp, tableinfo)

        local died
        local leaving

        local function selfdestruct()
            title.Visible = false
            box.Visible = false
            if died then
                died:Disconnect()
                died = nil
            end
            if leaving then
                leaving:Disconnect()
                leaving = nil
            end
            return
        end

        died = hum.Died:Connect(selfdestruct)
        leaving = workspace.DescendantRemoving:Connect(function(what)
            if what == hrp then
                selfdestruct()
                table.remove(inesp, table.find(inesp, tableinfo))
            end
        end)
    end)
end
local function destruct(title, box, dist)
    title.Visible = false
    box.Visible = false
end
local runs = game:GetService("RunService")
runs.RenderStepped:Connect(function()
    for i, v in ipairs(inesp) do
        local char = v[1]
        local title = v[2]
        local box = v[3]

        if not char:FindFirstChild("HumanoidRootPart") or char.Humanoid.Health <= 0 then
            destruct(title, box)
            continue
        end

        local hrp = char.HumanoidRootPart
        local isbot = char:FindFirstAncestor("AiZones") ~= nil
        local isbody = char:FindFirstAncestor("DroppedItems") ~= nil
        local hrpvec2, on_screen = CHEAT_CLIENT.camera:WorldToViewportPoint(hrp.Position)

        if on_screen and ESP_CLIENT.Enabled then
            if isbot and not ESP_CLIENT.Bots then
                destruct(title, box)
                continue
            elseif isbody and not ESP_CLIENT.Deads then
                destruct(title, box)
                continue
            end

            local headpos = CHEAT_CLIENT.camera:WorldToViewportPoint(char.Head.Position + Vector3.new(0, 0.5, 0))
            local legpos = CHEAT_CLIENT.camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))

            if ESP_CLIENT.Boxes then
                if isbody then
                    box.Visible = false
                else
                    box.Visible = true
                end
                box.Visible = true
                box.Color = ESP_CLIENT.GColor
                box.Size = Vector2.new(1000 / hrpvec2.Z + 2, headpos.Y - legpos.Y)
                box.Position = Vector2.new(hrpvec2.X - box.Size.X / 2, hrpvec2.Y - box.Size.Y / 2)
            else
                box.Visible = false
            end

            title.Position = Vector2.new(headpos.X, headpos.Y - 25)
            if ESP_CLIENT.Distance == true then
                if isbody then
                    title.Text = char.Name .. " | " .. math.floor((CHEAT_CLIENT.player.Character.PrimaryPart.Position - char.PrimaryPart.Position).Magnitude * 0.28) .. "m"
                else
                    title.Text = char.Name .. " | HP: " .. math.floor(char.Humanoid.Health) .. " | " .. math.floor((CHEAT_CLIENT.player.Character.PrimaryPart.Position - char.PrimaryPart.Position).Magnitude * 0.28) .. "m"
                end
            else
                if isbody then
                    title.Text = char.Name
                else
                    title.Text = char.Name .. " | HP: " .. math.floor(char.Humanoid.Health)
                end
            end
            title.Color = ESP_CLIENT.GColor
            title.Visible = true
        else
            destruct(title, box)
        end
    end
end)

for i,v in ipairs(game.ReplicatedStorage.AmmoTypes:GetChildren()) do
    v:SetAttribute("RecoilStrength", 8)
end

function startspeedhack()
    local speaker = game:GetService("Players").LocalPlayer
    local chr = speaker.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
    local hb = game:GetService("RunService").Heartbeat
    while OTHER_CLIENT.SpeedHack and chr and hum and hum.Parent do
        local delta = hb:Wait()
        if hum.MoveDirection.Magnitude > 0 then
            chr:TranslateBy(hum.MoveDirection * tonumber(OTHER_CLIENT.SpeedhackBoost) * delta * 10)
        else
            chr:TranslateBy(hum.MoveDirection * delta * 10)
        end
    end
end
local function stringtoenum(materialString)
    materialString = materialString:upper()
    for _, materialType in ipairs(Enum.Material:GetEnumItems()) do
        if materialType.Name:upper() == materialString then
            return materialType
        end
    end
    return nil
end

task.spawn(function()
    while wait(1) do
        fovcircle2.Position = Vector2.new(CHEAT_CLIENT.camera.ViewportSize.X / 2, CHEAT_CLIENT.camera.ViewportSize.Y / 2)
        fovcircle.Position = Vector2.new(CHEAT_CLIENT.camera.ViewportSize.X / 2, CHEAT_CLIENT.camera.ViewportSize.Y / 2)

        if ESP_CLIENT.Bots == true then
            for i,zone in ipairs(workspace.AiZones:GetChildren()) do
                for key,bot in ipairs(zone:GetChildren()) do
                    if bot:FindFirstChild("HumanoidRootPart") then
                        pcall(function()
                            esp(nil, bot)
                        end)
                    end
                end
            end
        end
        if ESP_CLIENT.Deads == true then
            for i,model in ipairs(workspace.DroppedItems:GetChildren()) do
                if model:GetAttribute("DisplayName") then
                    pcall(function()
                        esp(model)
                    end)
                end
            end
        end
        for i,model in ipairs(workspace:GetChildren()) do
            if model:FindFirstChild("HumanoidRootPart") and game.Players:FindFirstChild(model.Name) and model.Humanoid.Health > 0 and model ~= game.Players.LocalPlayer.Character then
                pcall(function()
                    esp(nil, model)
                end)
            end
        end
        if workspace:FindFirstChild("SpawnerZones") then
            for i,v in ipairs(workspace.SpawnerZones.Foliage:GetDescendants()) do
                if v:FindFirstChildOfClass("SurfaceAppearance") then
                    if OTHER_CLIENT.Leaves then
                        v.Transparency = 1
                    else
                        v.Transparency = 0
                    end
                end
            end
        end
        local inv = game.ReplicatedStorage.Players:FindFirstChild(CHEAT_CLIENT.player.Name).Inventory
        for i,v in ipairs(inv:GetChildren()) do
            local sett = require(v.SettingsModule)
            sett.FireRate = CHEAT_CLIENT.FireRate
            sett.weaponOffSet = OTHER_CLIENT.ViewModelOffset
        end
    end
end)

if not isfile("NEXTRONITYdelta(discord.gg-nextronity).mp3") then
    writefile("NEXTRONITYdelta(discord.gg-nextronity).mp3", game:HttpGet("https://drive.google.com/uc?export=download&id=1rkBP0c_5G5jC0-4G7vUqzM3aGN6OqLcf"));
    local flex = Instance.new('Sound', game:GetService('CoreGui'))
    flex.SoundId = getcustomasset("NEXTRONITYdelta(discord.gg-nextronity).mp3")
    flex.PlaybackSpeed = 1
    flex.Playing = true
    flex.Volume = 2
else

end
Notify("Nextronity loaded", "Press Insert to open/close menu")
