getgenv().getactors = function()
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("Actor") then
            return v
        end
    end
end

run_on_actor(getactors(), [==[

loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/modules/fakedrawinglib.lua"))()

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = game.Workspace.CurrentCamera
local replicatedStorage = game:GetService("ReplicatedStorage")
local handModels = replicatedStorage:WaitForChild("HandModels")
local workspace = game.Workspace

if game.CoreGui:FindFirstChild("ScreenGui") then
    game.CoreGui:FindFirstChild("ScreenGui"):Destroy()
  end


local modules = {
    ["PlayerClient"] = {},
    ["BowClient"] = {},
    ["Camera"] = {},
    ["RangedWeaponClient"] = {},
    ["GetEquippedItem"] = {},
    ["FPS"] = {},
}

for _, v in pairs(getgc(true)) do
    if typeof(v) == "function" and islclosure(v) then
        local info = debug.getinfo(v)
        local name = string.match(info.short_src, "%.([%w_]+)$")

        if name and modules[name] and info.name ~= nil then
            modules[name][info.name] = info.func
        end
    end
end


local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/zah-femboy/IM-NOT-ZAH/main/i%20might%20be%20zah'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/zah-femboy/IM-PURPLE/refs/heads/main/lmao'))()

local Window =
      Library:CreateWindow(
      {
          Title = "🎃 Hollow.<font color='rgb(127, 110, 234)'>cfg</font> 🎃",
          Center = true,
          AutoShow = true,
          TabPadding = 16,
          MenuFadeTime = 0.2
    }
)
  
local Tabs = {
      Combat = Window:AddTab("Combat"),
      Visuals = Window:AddTab("Visual"),
      Misc = Window:AddTab("Misc"),
      Local = Window:AddTab("Local"),
      ["UI Settings"] = Window:AddTab("UI Settings")
}
  
Library:Notify(("Status: 🔴 - Detek ur gonna get banned)"), 6)

  local HitSoundTabBox = Tabs.Misc:AddLeftTabbox()  
  local Hitsoundsee = HitSoundTabBox:AddTab('HitSounds')

  local TabBox = Tabs.Combat:AddLeftTabbox()
  local CombatTab = TabBox:AddTab("Combat")

  local VisualsTabBox = Tabs.Visuals:AddLeftTabbox()
  local Esp = VisualsTabBox:AddTab("Esp")

  local HitboxTabBox = Tabs.Combat:AddRightTabbox()  
  local HitboxExpander = HitboxTabBox:AddTab('Hitbox')

  local HboTabBox = Tabs.Combat:AddRightTabbox()  
  local HboTab = HboTabBox:AddTab('Hitbox Override')
  
  local AntiAimTab = Tabs.Misc:AddRightTabbox()  
  local AntiAim = AntiAimTab:AddTab('AntiAim')

  local WeaponModsTab = Tabs.Misc:AddRightTabbox()  
  local WeaponMods = WeaponModsTab:AddTab('Weapon Mods')

  local PlayerModsTabBox = Tabs.Misc:AddLeftTabbox()  
  local PlayerMods = PlayerModsTabBox:AddTab('PlayerMods')

  local VechicleModsTabBox = Tabs.Misc:AddLeftTabbox()  
  local VechicleMods = VechicleModsTabBox:AddTab('Vechial Mods')

  local WorldVTabBox = Tabs.Visuals:AddRightTabbox()  
  local WorldVisuals = WorldVTabBox:AddTab('World Visuals')

  local FOVTabBox = Tabs.Misc:AddRightTabbox()
  local FOVTab = FOVTabBox:AddTab('Zoom')

  local CustomViewmodelTabBox = Tabs.Local:AddLeftTabbox('Viewmodel')
  local CustomViewmodelTab = CustomViewmodelTabBox:AddTab('Viewmodel')

  local ItemTabBox = Tabs.Local:AddRightTabbox()
  local ItemTab = ItemTabBox:AddTab('Item Visuals')
  
  local ESPSettings = {
    BoxEnabled = false,
    DistanceEnabled = false,
    NameEnabled = false,
    EquippedItemEnabled = false,
    MaxDistance = 3000,
    VisibilityCheckEnabled = false,
    BoxColor = Color3.fromRGB(255, 255, 255),
    DistanceColor = Color3.fromRGB(255, 255, 255),
    NameColor = Color3.fromRGB(255, 255, 255),
    EquippedItemColor = Color3.fromRGB(255, 255, 255),
    NonVisibleColor = Color3.fromRGB(255, 0, 0),
    TextOutlineEnabled = false,
    TextOutlineColor = Color3.fromRGB(0, 0, 0),
}

Esp:AddToggle('Box', {
    Text = 'Box',
    Default = false,
    Callback = function(value)
        ESPSettings.BoxEnabled = value
    end
  }):AddColorPicker('BoxC', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Color',
    Callback = function(value)
        ESPSettings.BoxColor = value
    end
  })

Esp:AddToggle('Distance', {
    Text = 'Distance',
    Default = false,
    Callback = function(value)
    ESPSettings.DistanceEnabled = value
    end
  }):AddColorPicker('DistanceC', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Color',
    Callback = function(value)
    ESPSettings.DistanceColor = value
    end
  })


Esp:AddToggle('Name', {
    Text = 'Name',
    Default = false,
    Callback = function(value)
    ESPSettings.NameEnabled = value
    end
  }):AddColorPicker('Namec', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Color',
    Callback = function(value)
        ESPSettings.NameColor = value
    end
  })


Esp:AddToggle('Equipped Item', {
    Text = 'Equipped Item',
    Default = false,
    Callback = function(value)
    ESPSettings.EquippedItemEnabled = value
    end
  }):AddColorPicker('Equipped Item Color', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Color',
    Callback = function(value)
        ESPSettings.EquippedItemColor = value
    end
  })

Esp:AddToggle('Visibility Check', {
    Text = 'Visibility Check',
    Default = false,
    Callback = function(value)
    ESPSettings.VisibilityCheckEnabled = value
    end
  }):AddColorPicker('Visibility Checkc', {
    Default = Color3.fromRGB(255, 0, 0),
    Title = 'Color',
    Callback = function(value)
    ESPSettings.NonVisibleColor = value
    end
  })

Esp:AddToggle('Text Outlines', {
    Text = 'Text Outlines',
    Default = false,
    Callback = function(value)
    ESPSettings.TextOutlineEnabled = value
    end
  }):AddColorPicker('Coloree', {
    Default = Color3.fromRGB(1,1,1),
    Title = 'Color',
    Callback = function(value)
    ESPSettings.TextOutlineColor = value
    end
  })

Esp:AddSlider('Max Distance:', {
    Text = 'Max Distance:',
    Default = 1500,
    Min = 0,
    Max = 3000,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
    ESPSettings.MaxDistance = value
    end
  })


local function getEquippedItem(playerData)
    if playerData and playerData.equippedItem then
        local equippedItem = playerData.equippedItem
        local itemType = typeof(equippedItem) == "table" and equippedItem.type or equippedItem
        return {type = "" .. (itemType or "None") .. ""}
    end
    return {type = "None"}
end

local playerList = debug.getupvalue(modules.PlayerClient.updatePlayers, 1) or {}
local cachedPlayers = {}

local function UpdatePlayerCache()
    for _, playerData in pairs(playerList) do
        local Player = playerData.model
        if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") and not cachedPlayers[Player] then
            cachedPlayers[Player] = playerData
        end
    end
end

local function IsSleeping(Model)
    if Model and Model:FindFirstChild("AnimationController") and Model.AnimationController:FindFirstChild("Animator") then
        for _, track in pairs(Model.AnimationController.Animator:GetPlayingAnimationTracks()) do
            if track.Animation.AnimationId == "rbxassetid://13280887764" then
                return true
            end
        end
    end
    return false
end

local function IsHeadBehindWall(Camera, Head)
    local ray = Ray.new(Camera.CFrame.Position, (Head.Position - Camera.CFrame.Position).Unit * (Head.Position - Camera.CFrame.Position).Magnitude)
    local hit, position = workspace:FindPartOnRayWithIgnoreList(ray, {Camera, Head.Parent}, false, true)
    if hit then
        return true
    end
    return false
end

local BoxESP = {}

function BoxESP.Create(Player, playerData)

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.fromRGB(255, 255, 255)  
    Box.Filled = false
    Box.Outline = true
    Box.OutlineColor = Color3.fromRGB(1,1,1)  
    Box.Transparency = 1
    Box.Thickness = 0.1

    local Distance = Drawing.new("Text")
    Distance.Visible = false
    Distance.Color = ESPSettings.DistanceColor
    Distance.Center = true
    Distance.Outline = ESPSettings.TextOutlineEnabled
    Distance.OutlineColor = ESPSettings.TextOutlineColor
    Distance.Size = 12
    Distance.Font = 3

    local EquippedItem = Drawing.new("Text")
    EquippedItem.Visible = false
    EquippedItem.Color = ESPSettings.EquippedItemColor
    EquippedItem.Center = true
    EquippedItem.Outline = ESPSettings.TextOutlineEnabled
    EquippedItem.OutlineColor = ESPSettings.TextOutlineColor
    EquippedItem.Size = 12
    EquippedItem.Font = 3


local function UpdateBox()
    if not Player or not Player:IsA("Model") or not Player:FindFirstChild("HumanoidRootPart") or not Player:FindFirstChild("Head") then
        Box.Visible = false
        Distance.Visible = false
        EquippedItem.Visible = false
        return
    end

    if IsSleeping(Player) then
        Box.Visible = false
        Distance.Visible = false
        EquippedItem.Visible = false
        return
    end

    local RootPart = Player.HumanoidRootPart
    local Head = Player.Head

    local distance = (Camera.CFrame.Position - RootPart.Position).Magnitude

    if distance > ESPSettings.MaxDistance then
        Box.Visible = false
        Distance.Visible = false
        EquippedItem.Visible = false
        return
    end

    local RootPartPos, IsVisibleRoot = Camera:WorldToViewportPoint(RootPart.Position)
    local HeadPos, IsVisibleHead = Camera:WorldToViewportPoint(Head.Position)
    local IsVisible = IsVisibleRoot and IsVisibleHead

    local scale_factor = 1 / (RootPartPos.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
    local width, height = math.floor(69 * scale_factor), math.floor(62 * scale_factor)

    local roundedDistance = math.floor(distance + 0.5)
    if roundedDistance % 2 ~= 0 then
        roundedDistance = roundedDistance + 1
    end

local nametagText = "Player"
local nametag = Head:FindFirstChild("Nametag")
if nametag and nametag:FindFirstChild("tag") and nametag.tag:IsA("TextLabel") then
    nametagText = nametag.tag.Text ~= "" and nametag.tag.Text or "Player"
end

    
    local headBehindWall = ESPSettings.VisibilityCheckEnabled and IsHeadBehindWall(Camera, Head)

    if headBehindWall then
        Box.Color = ESPSettings.NonVisibleColor
        Distance.Color = ESPSettings.NonVisibleColor
        EquippedItem.Color = ESPSettings.NonVisibleColor
    else
        Box.Color = ESPSettings.BoxColor
        Distance.Color = ESPSettings.DistanceColor
        EquippedItem.Color = ESPSettings.EquippedItemColor
    end


        local Target2dPosition, IsVisible = Camera:WorldToViewportPoint(RootPart.Position)
        local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
        local width, height = math.floor(56 * scale_factor), math.floor(62 * scale_factor)

        Box.Visible = ESPSettings.BoxEnabled and IsVisible
        Box.Size = Vector2.new(width, height)
        Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)


    if ESPSettings.DistanceEnabled then
        Distance.Visible = IsVisible
        Distance.Text = ESPSettings.NameEnabled and ("[" .. tostring(roundedDistance) .. "] " .. nametagText) or ("[" .. tostring(roundedDistance) .. "]")
    else
        Distance.Visible = ESPSettings.NameEnabled and IsVisible
        Distance.Text = ESPSettings.NameEnabled and nametagText or ""
    end
    Distance.Position = Vector2.new(RootPartPos.X, RootPartPos.Y - height / 2 - 15)
    Distance.Outline = ESPSettings.TextOutlineEnabled
    Distance.OutlineColor = ESPSettings.TextOutlineColor

    local equippedItem = getEquippedItem(playerData)
    EquippedItem.Visible = ESPSettings.EquippedItemEnabled and IsVisible
    EquippedItem.Text = equippedItem.type
    EquippedItem.Position = Vector2.new(RootPartPos.X, RootPartPos.Y + height / 2 + 5)
    EquippedItem.Outline = ESPSettings.TextOutlineEnabled
    EquippedItem.OutlineColor = ESPSettings.TextOutlineColor
end

    game:GetService("RunService").RenderStepped:Connect(UpdateBox)

    return Box, Distance, EquippedItem
end

local Boxes = {}

local function EnableBoxESP()
    for Player, playerData in pairs(cachedPlayers) do
        if not Boxes[Player] and Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
            local Box, Distance, EquippedItem = BoxESP.Create(Player, playerData)
            Boxes[Player] = {Box = Box, Distance = Distance, EquippedItem = EquippedItem}
        end
    end
end

UpdatePlayerCache()
EnableBoxESP()

game:GetService("RunService").Heartbeat:Connect(function()
    UpdatePlayerCache()
    EnableBoxESP()
end)

local FieldOfView = Drawing.new("Circle")
FieldOfView.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FieldOfView.Radius = _G.fovSize or 233
FieldOfView.Color = Color3.fromRGB(255, 255, 255)
FieldOfView.Outline = true
FieldOfView.OutlineColor = Color3.fromRGB(1,1,1)
FieldOfView.Thickness = 1
FieldOfView.Visible = _G.showFOV or true

local Line = Drawing.new("Line")
Line.Color = Color3.fromRGB(255, 255, 255)
Line.Outline = true
Line.OutlineColor = Color3.fromRGB(1,1,1)
Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
Line.Thickness = 1
Line.Visible = _G.showSnapline or true

_G.silentAimEnabled = _G.silentAimEnabled or true
_G.showFOV = _G.showFOV or false
_G.showSnapline = _G.showSnapline or true
_G.fovSize = _G.fovSize or 0

local Decode = base64.decode
local playerListCache = {}
local lastUpdated = 0
local snaplineTarget = nil

local PlayerList = debug.getupvalue(modules.PlayerClient.updatePlayers, 1)
local CurrentWeapon
for _, v in next, getgc(true) do
    if type(v) == "function" and debug.getinfo(v).name == "GetEquippedItem" then
        CurrentWeapon = v
        break
    end
end

local function getPlayersInRange()
    local closest, playerTable = nil, nil
    local closestMagnitude = math.huge
    for i, v in pairs(PlayerList) do
        if v.type == "Player" and v.model:FindFirstChild("Head") and not v.sleeping then
            local PartPos, OnScreen = Camera:WorldToViewportPoint(v.model:GetPivot().Position)
            local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).magnitude
            local PlayerDistance = (workspace.Ignore.LocalCharacter.Middle:GetPivot().Position - v.model:GetPivot().Position).Magnitude
            if Magnitude < _G.fovSize and PlayerDistance <= 1500 and Magnitude < closestMagnitude and OnScreen then
                closestMagnitude = Magnitude
                closest = v.model
                playerTable = v
            end
        end
    end
    return closest, playerTable
end

local function updateTarget()
    local target = snaplineTarget
    if target then
        getgenv().Target = target
    end
end

local function updateSnapline()
    local Target = getPlayersInRange()
    if Target then
        local success, headPos, onScreen = pcall(Camera.WorldToViewportPoint, Camera, Target:FindFirstChild(Decode("SGVhZA==")).Position)
        if success and onScreen then
            Line.Visible = _G.showSnapline
            Line.To = Vector2.new(headPos.X, headPos.Y)
            snaplineTarget = Target
            getgenv().SilentEnabled = _G.silentAimEnabled
        else
            Line.Visible = false
            snaplineTarget = nil
            getgenv().SilentEnabled = false
        end
    else
        Line.Visible = false
        snaplineTarget = nil
        getgenv().SilentEnabled = false
    end
end

local function onRenderStepped()
    FieldOfView.Visible = _G.showFOV
    FieldOfView.Radius = _G.fovSize

    updateSnapline()
    updateTarget()
end

RunService.RenderStepped:Connect(onRenderStepped)



CombatTab:AddToggle('Silent Aim', {
    Text = 'Silent Aim',
    Default = false,
    Callback = function(value)
        _G.silentAimEnabled = value
    end
})

CombatTab:AddToggle('Show Fov', {
    Text = 'Show Fov',
    Default = false,
    Callback = function(value)
        _G.showFOV = value
    end
}):AddColorPicker('Fov color', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Fov color',
    Callback = function(value)
        FieldOfView.Color = value
    end
})

CombatTab:AddToggle('Show Snapline', {
    Text = 'Show Snapline',
    Default = false,
    Callback = function(value)
        _G.showSnapline = value
    end
}):AddColorPicker('Snapline cp;pr', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Snapline color',
    Callback = function(value)
        Line.Color = value
    end
})

CombatTab:AddSlider('Fov Radius:', {
    Text = 'Fov Radius:',
    Default = 0,
    Min = 0,
    Max = 600,
    Rounding = 1,
    Compact = false,
    Callback = function(value) 
        FieldOfView.Radius = value
        _G.fovSize = value 
    end
})

function GetLocalToolName()
    if getrenv()._G.classes.FPS.GetEquippedItem() == nil then
        return "zah is cool"
    else
        return getrenv()._G.classes.FPS.GetEquippedItem().type 
    end
end

local killauradistance = 8

local function GetPlayer()
    local closest, playerTable = nil, nil
    local closestMagnitude = math.huge
    for i, v in pairs(PlayerList) do
        if v.type == "Player" and v.model:FindFirstChild("Head") and not v.sleeping then
            local PartPos, OnScreen = Camera:WorldToViewportPoint(v.model:GetPivot().Position)
            local PlayerDistance = (workspace.Ignore.LocalCharacter.Middle:GetPivot().Position - v.model:GetPivot().Position).Magnitude

            if PlayerDistance <= killauradistance and OnScreen then
                if PlayerDistance < closestMagnitude then
                    closestMagnitude = PlayerDistance
                    closest = v.model
                    playerTable = v
                end
            end
        end
    end
    return closest, playerTable
end

local KAHitPartSelected = "Head"
local Wait = 0.95
local AuraGoodToUse = false

local function HandleFireServer(self, ...)
    local args = {...}
    if args[1] == 10 and args[2] == "Hit" then
        PlayerID = args[3]
    end
    return Bypass(self, unpack(args))
end

local Bypass
Bypass = hookfunction(game:GetService("Players").LocalPlayer:FindFirstChild("TCP").FireServer, HandleFireServer)

task.spawn(function()
    while task.wait() do
        local PlayerHumanoid, fr = GetPlayer()
        if PlayerHumanoid and AuraGoodToUse and PlayerHumanoid ~= nil and fr ~= nil then
            game:GetService("Players").LocalPlayer.TCP:FireServer(10, "Swing")
            game:GetService("Players").LocalPlayer.TCP:FireServer(10, "Hit", fr.id, PlayerHumanoid.HumanoidRootPart.Position, KAHitPartSelected, Vector3.new(-0.1275634765625, 0.5433349609375, -0.237548828125))
            wait(Wait)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        local Weapon = GetLocalToolName()
        if Weapon == "MiningDrill" then
            Wait = 0
        else
            Wait = 0.95
        end
        
        if Weapon == "Hammer" or Weapon == "Crowbar" or Weapon == "StoneHammer" or Weapon == "SteelHammer" or Weapon == "MiningDrill" or Weapon == "IronHammer" or Weapon == "Kabar" then
            AuraGoodToUse = true
        else
            AuraGoodToUse = false
        end
    end
end)

CombatTab:AddToggle('Kill Aura', {
    Text = 'Kill Aura',
    Default = false,
    Callback = function(state)
        AuraGoodToUse = state
    end
  })

CombatTab:AddSlider('Distance', {Text = 'Distance:', Default = 0, Min = 0, Max = 12, Rounding = 1, Compact = false}):OnChanged(function(value)
    killauradistance = value   
end)

CombatTab:AddDropdown('Hit Part:', {
    Text = "Hit Part:", 
    Default = "Head",
    Values = {"Head", "Torso", "RightLowerArm", "RightUpperArm", "LeftUpperArm", "LeftLowerArm", "RightLowerLeg", "RightUpperLeg", "LeftLowerLeg", "LeftUpperLeg", "RightFoot", "LeftFoot"},
    Callback = function(Value)
        KAHitPartSelected = Value
    end
})

local isGroundedToggle = false

local function updateIsGrounded()
    local originalIsGrounded
    originalIsGrounded = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if not checkcaller() then
            if key == "IsGrounded" then
                return isGroundedToggle and true or originalIsGrounded(self, key)
            end
        end
        return originalIsGrounded(self, key)
    end))

    local function forceIsGrounded()
        for _, obj in ipairs(getgc(true)) do
            if type(obj) == "table" and rawget(obj, "IsGrounded") then
                local originalFunction = obj.IsGrounded
                obj.IsGrounded = function(...)
                    return isGroundedToggle and true or originalFunction(...)
                end
            end
        end
    end

    forceIsGrounded()
end

PlayerMods:AddToggle('Always Grounded', {
    Text = 'Always Grounded',
    Default = false,
    Callback = function(value)
        isGroundedToggle = value
        updateIsGrounded()
    end
  })

  updateIsGrounded() 


local isSprintBlockedToggle = false

local function updateSetSprintBlocked()
    local originalSetSprintBlocked
    originalSetSprintBlocked = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if not checkcaller() then
            if key == "SetSprintBlocked" then
                return isSprintBlockedToggle and true or originalSetSprintBlocked(self, key)
            end
        end
        return originalSetSprintBlocked(self, key)
    end))

    local function forceSetSprintBlocked()
        for _, obj in ipairs(getgc(true)) do
            if type(obj) == "table" and rawget(obj, "SetSprintBlocked") then
                local originalFunction = obj.SetSprintBlocked
                obj.SetSprintBlocked = function(...)
                    return isSprintBlockedToggle and true or originalFunction(...)
                end
            end
        end
    end

    forceSetSprintBlocked()
end

PlayerMods:AddToggle('No Slowdown', {
    Text = 'No Slowdown',
    Default = false,
    Callback = function(value)
        isSprintBlockedToggle = value
        updateSetSprintBlocked()
    end
  })

  updateSetSprintBlocked() 

_G.Torsox = 0.6530659198760986
_G.Torsoy = 2.220424175262451
_G.Torsoz = 1.4367451667785645
_G.zirec = true

local function HBE()
    for _, playerData in pairs(playerList) do
        local model = playerData.model
        if model and model:FindFirstChild("Head") and model:FindFirstChild("Torso") then
            local Torso = model.Torso
            pcall(function()
                Torso.Size = Vector3.new(_G.Torsox, _G.Torsoy, _G.Torsoz)
                Torso.Transparency = 0.5
                Torso.CanCollide = false
            end)
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    if _G.zirec then
        HBE() 
    else
        _G.Torsox = 0.6530659198760986
        _G.Torsoy = 2.220424175262451
        _G.Torsoz = 1.4367451667785645
        HBE() 
    end
end)

local mt = getrawmetatable(game)
local oldnamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if method == "Size" and tostring(self) == "Torso" then
        return Vector3.new(_G.Torsox, _G.Torsoy, _G.Torsoz)
    end

    return oldnamecall(self, ...)
end)

setreadonly(mt, true)


HitboxExpander:AddToggle('Hitbox Expander', {
    Text = 'Hitbox Expander',
    Default = false,
    Callback = function(value)
        _G.zirec = value
    end
  })

HitboxExpander:AddSlider('TorsoX', {Text = 'Torso Width (X):', Default = 0, Min = 0, Max = 12, Rounding = 0, Compact = false}):OnChanged(function(value)
    _G.Torsox = value   
end)
HitboxExpander:AddSlider('TorsoY', {Text = 'Torso Height (Y):', Default = 0, Min = 0, Max = 12, Rounding = 0, Compact = false}):OnChanged(function(value)
    _G.Torsoy = value   
end)
HitboxExpander:AddSlider('Torsoz', {Text = 'Torso Depth (Z):', Default = 0, Min = 0, Max = 12, Rounding = 0, Compact = false}):OnChanged(function(value)
    _G.Torsoz = value   
end)

local mt = getrawmetatable(game)
local oldnamecall = mt.__namecall
setreadonly(mt, false)

local TCP = game:GetService("Players").LocalPlayer:FindFirstChild("TCP")

local features = {
    hitboxOverride = {
        enabled = false,
        selectedPart = "Head"
    }
}

HboTab:AddToggle('Hitbox Override', {
    Text = 'Hitbox Override',
    Default = false,
    Callback = function(value)
        features.hitboxOverride.enabled = value 
    end
  })

  HboTab:AddDropdown('trhgfhfghfg', {
    Text = "Hitbox Part",
    Default = "Head",
    Values = {"Head", "Torso", "RightLowerArm", "RightUpperArm", "LeftUpperArm", "LeftLowerArm", 
              "RightLowerLeg", "RightUpperLeg", "LeftLowerLeg", "LeftUpperLeg", 
              "RightFoot", "LeftFoot"},
    Callback = function(Value)
        features.hitboxOverride.selectedPart = Value
    end
})

mt.__namecall = function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "FireServer" and self == TCP then
        if args[1] == 10 and args[2] == "Hit" and
           (args[6] == "Head" or args[6] == "Torso" or
            args[6] == "RightLowerArm" or args[6] == "RightUpperArm" or
            args[6] == "LeftUpperArm" or args[6] == "LeftLowerArm" or 
            args[6] == "RightLowerLeg" or args[6] == "RightUpperLeg" or 
            args[6] == "LeftLowerLeg" or args[6] == "LeftUpperLeg" or
            args[6] == "RightFoot" or args[6] == "LeftFoot") then

            if features.hitboxOverride.enabled then
                args[6] = features.hitboxOverride.selectedPart
            end
        end
    end

    return oldnamecall(self, unpack(args))
end

setreadonly(mt, true)

local AASpeed = 1
local ZZ = 0
local AA = false

AntiAim:AddToggle('EnableAA', {
    Text = 'Enable',
    Default = false,
    Callback = function(value)
        AA = value
    end
  }):AddKeyPicker(
  "AntiAim",
  {Default = "Non", SyncToggleState = true, Mode = "Toggle", Text = "AntiAim", NoUI = false}
  ):OnChanged(function(value)
        AA = value
  end)
  

AntiAim:AddSlider('Spped', {Text = 'Speed', Default = 0, Min = 0, Max = 3, Rounding = 0, Compact = false}):OnChanged(function(value)
    local AASpeed = value   
end)

AntiAim:AddSlider('AngleZZ', {Text = 'Angle', Default = 0, Min = 0, Max = 3, Rounding = 0, Compact = false}):OnChanged(function(value)
    ZZ = value   
end)

local mt = getrawmetatable(game)
local oldindex = mt.__namecall
setreadonly(mt, false)

local TCP = game:GetService("Players").LocalPlayer:FindFirstChild("TCP")

mt.__namecall = function(...)
    local Method = getnamecallmethod()
    local args = {...}

    if Method == "FireServer" and AA and args[1] == TCP then
        if args[2] == 1 and typeof(args[3]) == "Vector3" then
            args[4] = Vector3.new(-1.5000001192092896, ZZ, args[4].z)
            ZZ = ZZ - AASpeed
        end
    end

    return oldindex(unpack(args))
end

setreadonly(mt, true)


local toggleEnabled = false
local loopRunning = false

local function startLoop()
    while toggleEnabled do
        game:GetService("Players").LocalPlayer:WaitForChild("TCP"):FireServer(2, true)
        wait(1.5)  
    end
end

AntiAim:AddToggle('Fake Crouch', {
    Text = 'Fake Crouch',
    Default = false,
    Callback = function(value)
        toggleEnabled = value
        if value and not loopRunning then
            loopRunning = true
            spawn(startLoop) 
        elseif not value then
            loopRunning = false
        end
    end
})


for i, v in pairs(getgc(true)) do
    if type(v) == "table" then
        if rawget(v, "MaxVelocity") then
            v.MaxVelocity = math.huge
        end
    end
end

local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local speed = 100 

local moveDirection = Vector3.new(0, 0, 0)
local isMovingUp = false
local isMovingDown = false
local isActive = false 
local targetPlastics = nil
local nearestFlip = nil

local function getNearestModel()
    local minDistance = math.huge
    local nearestModel = nil
    local middlePosition = game.Workspace.Ignore.LocalCharacter.Middle.Position

    for _, model in ipairs(workspace:GetChildren()) do
        if model:IsA("Model") then
            local frame = model:FindFirstChild("Frame")
            local plastics = model:FindFirstChild("Plastics")
            if frame and plastics then
                local distance = (plastics.Position - middlePosition).Magnitude
                if distance < minDistance then
                    minDistance = distance
                    nearestModel = plastics
                end
            end
        end
    end

    return nearestModel
end

local function getNearestFlip()
    local minDistance = math.huge
    local nearestFlip = nil
    local middlePosition = game.Workspace.Ignore.LocalCharacter.Middle.Position

    for _, model in ipairs(workspace:GetChildren()) do
        if model:IsA("Model") then
            local frame = model:FindFirstChild("Frame")
            if frame then
                local flip = frame:FindFirstChild("Flip")
                if flip then
                    local distance = (frame.Position - middlePosition).Magnitude
                    if distance < minDistance then
                        minDistance = distance
                        nearestFlip = flip
                    end
                end
            end
        end
    end

    return nearestFlip
end

local function updateMovement()
    if not isActive or not targetPlastics then return end

    local cameraLookVector = camera.CFrame.LookVector
    local moveVector = Vector3.new(0, 0, 0)

    if moveDirection.Magnitude > 0 then
        moveVector = moveVector + (cameraLookVector * moveDirection.Z + camera.CFrame.RightVector * moveDirection.X)
    end
    if isMovingUp then
        moveVector = moveVector + Vector3.new(0, 1, 0)
    elseif isMovingDown then
        moveVector = moveVector + Vector3.new(0, -1, 0)
    end

    targetPlastics.Velocity = moveVector * speed
end

local function checkAndUpdateNearestModel()
    targetPlastics = getNearestModel()
    nearestFlip = getNearestFlip()

    if not targetPlastics or not nearestFlip then
        isActive = false
        return
    end

    isActive = true
end

VechicleMods:AddToggle('Atv Fly', {Text = 'Atv Fly', Default = false, Tooltip = 'Atv'}):AddKeyPicker(
    "AtvFly",
    {Default = "Non", SyncToggleState = true, Mode = "Toggle", Text = "Atv Fly", NoUI = false}
    ):OnChanged(function(value)
        isActive = value
        if not isActive and targetPlastics then
            targetPlastics.Velocity = Vector3.new(0, 0, 0)
        end
end)

VechicleMods:AddSlider('Speed', {Text = 'Speed', Default = 100, Min = 0, Max = 250, Rounding = 0, Compact = false}):OnChanged(function(value)
    speed = value 
end)

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or not isActive then return end

    if input.KeyCode == Enum.KeyCode.W then
        moveDirection = Vector3.new(moveDirection.X, moveDirection.Y, 1)
    elseif input.KeyCode == Enum.KeyCode.A then
        moveDirection = Vector3.new(-1, moveDirection.Y, moveDirection.Z)
    elseif input.KeyCode == Enum.KeyCode.S then
        moveDirection = Vector3.new(moveDirection.X, moveDirection.Y, -1)
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(1, moveDirection.Y, moveDirection.Z)
    elseif input.KeyCode == Enum.KeyCode.X then
        isMovingUp = true
    elseif input.KeyCode == Enum.KeyCode.LeftShift then
        isMovingDown = true
    end
end)

userInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed or not isActive then return end

    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S then
        moveDirection = Vector3.new(moveDirection.X, moveDirection.Y, 0)
    elseif input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(0, moveDirection.Y, moveDirection.Z)
    elseif input.KeyCode == Enum.KeyCode.X then
        isMovingUp = false
    elseif input.KeyCode == Enum.KeyCode.LeftShift then
        isMovingDown = false
    end
end)

runService.RenderStepped:Connect(function()
    if isActive then
        checkAndUpdateNearestModel()

        if targetPlastics then
            updateMovement()
        end

        if nearestFlip then
            nearestFlip.Enabled = true
        end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    for _, v in ipairs(workspace:GetChildren()) do
        local frame = v:FindFirstChild("Frame")
        if frame then
            local flip = frame:FindFirstChild("Flip")
            if flip then
                flip.Enabled = true
                flip.RigidityEnabled = true
                flip.Responsiveness = math.huge
            end
        end
    end
end)

local sounds = {
    ["Defualt"] = "rbxassetid://9119561046",
    ["meow"] = "rbxassetid://1091083826",
    ["Neko Kawaii Miauuu"] = "rbxassetid://1530807190",
    ["One"] = "rbxassetid://7380502345",
    ["Wow"] = "rbxassetid://2976402600",
    ["Rust"] = "rbxassetid://1255040462",
    ["Bubble"] = "rbxassetid://5952120301",
    ["AYAYA"] = "rbxassetid://1327236313",
    ["ara"] = "rbxassetid://5683417249",
    ["UNYA"] = "rbxassetid://6315490668",
    ["Klee"] = "rbxassetid://8594342648",
    ["Saber"] = "rbxassetid://8415678813",
    ["Baimware"] = "rbxassetid://3124331820",
    ["Osu"] = "rbxassetid://7149255551",
    ["TF2 Critical"] = "rbxassetid://296102734",
    ["Bat"] = "rbxassetid://3333907347",
    ["Call of Duty"] = "rbxassetid://5952120301",
    ["Pick"] = "rbxassetid://1347140027",
    ["Pop"] = "rbxassetid://198598793",
    ["Bruh"] = "rbxassetid://4275842574",
    ["Bamboo"] = "rbxassetid://3769434519",
    ["Crowbar"] = "rbxassetid://546410481",
    ["Weeb"] = "rbxassetid://6442965016",
    ["Beep"] = "rbxassetid://8177256015",
    ["Bambi"] = "rbxassetid://8437203821",
    ["Stone"] = "rbxassetid://3581383408",
    ["Old Fatality"] = "rbxassetid://6607142036",
    ["Click"] = "rbxassetid://8053704437",
    ["Ding"] = "rbxassetid://7149516994",
    ["Snow"] = "rbxassetid://6455527632",
    ["Laser"] = "rbxassetid://7837461331",
    ["Mario"] = "rbxassetid://2815207981",
    ["Steve"] = "rbxassetid://4965083997",
    ["drake"] = "rbxassetid://2201067635"
}
local SoundService = game:GetService("SoundService")

if SoundService:FindFirstChild("PlayerHit2") then
    local PlayerHit2 = SoundService.PlayerHit2
    PlayerHit2.Volume = 5
    PlayerHit2.Pitch = 1

    if PlayerHit2:FindFirstChild("EqualizerSoundEffect") then
        local EqualizerSoundEffect = PlayerHit2.EqualizerSoundEffect
        EqualizerSoundEffect.HighGain = -2
    end
end

local Options = {
    Enabled_Toggle1 = false,
    HeadshotHit = "Defualt"
}

Hitsoundsee:AddToggle('asdsadas', {
    Text = "Enable",
    Default = false,
    Callback = function(value)
        _G.Enabled_Toggle1 = value
    end
})

Hitsoundsee:AddSlider('psadsadsait', {Text = 'Hitsound Pitch:', Default = 1, Min = 0, Max = 2, Rounding = 0, Compact = false}):OnChanged(function(value)
    SoundService.PlayerHit2.Pitch = value 
end)

Hitsoundsee:AddSlider('asdasd', {Text = 'Hitsound Volume:', Default = 1, Min = 0, Max = 10, Rounding = 0, Compact = false}):OnChanged(function(value)
    SoundService.PlayerHit2.Volume = value
end)

Hitsoundsee:AddDropdown('Select Hitsound', {
    Text = "Select Hitsound:",
    Default = "Defualt",
    Values = {
        "Defualt", "meow", "Neko Kawaii Miauuu", "One", "Wow", "Rust", "Bubble", "AYAYA", "ara", "UNYA", "Klee", "Saber", 
        "Baimware", "Osu", "TF2 Critical", "Bat", "Call of Duty", "Pick", "Pop", "Bruh", "Bamboo", "Crowbar", "Weeb", 
        "Beep", "Bambi", "Stone", "Old Fatality", "Click", "Ding", "Snow", "Laser", "Mario", "Steve", "drake"
    },
    Callback = function(Value)
        local soundId = sounds[Value]
        if SoundService:FindFirstChild("PlayerHit2") then
            local PlayerHit2 = SoundService.PlayerHit2
            PlayerHit2.SoundId = soundId
        end
    end
})

  local varsglobal = {
  visuals = {
      isZoomed = false,
      zoomLevel = 30,
      zoomKey = F,
  },
  }
  
  local function updateZoom()
  local newFov = Camera.FieldOfView
  
  if varsglobal.visuals.isZoomed then
      newFov = varsglobal.visuals.zoomLevel
  end
  
  Camera.FieldOfView = newFov
  end
  
  RunService.RenderStepped:Connect(updateZoom)
  
  FOVTab:AddToggle('Zoom', {Text = 'Zoom', Default = false, Tooltip = 'Makes my dick jutter'}):AddKeyPicker(
  "ZoomKey",
  {Default = "Non", SyncToggleState = true, Mode = "Toggle", Text = "Zoom", NoUI = false}
  ):OnChanged(function(value)
  varsglobal.visuals.isZoomed = value
  end)
  
  FOVTab:AddSlider('ZoomLevelSlider', {
  Text = 'Zoom Level:',
  Suffix = "",
  Default = 10,
  Min = 10,
  Max = 35,
  Rounding = 0,
  Compact = false
  }):OnChanged(function(value)
  varsglobal.visuals.zoomLevel = value
  end)
  
  UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
  if input.KeyCode == varsglobal.visuals.zoomKey and not gameProcessedEvent then
      varsglobal.visuals.isZoomed = not varsglobal.visuals.isZoomed
  end
  end)

  local ViewmodelEnabled = false
  local ViewmodelPos = Vector3.new(0, 0, 0) 
  
  local function ModifyCameraCFrame(obj, idx, val)
    if obj == Camera and idx == 'CFrame' and ViewmodelEnabled then
        val = val + (val.LookVector * ViewmodelPos.Z) + (val.RightVector * ViewmodelPos.X) + (val.UpVector * ViewmodelPos.Y)
    end
    return val 
  end
  
  RunService.RenderStepped:Connect(function()
    local obj = Camera
    local idx = 'CFrame'
    local val = obj[idx]
    val = ModifyCameraCFrame(obj, idx, val)
    obj[idx] = val
  end)
  
  CustomViewmodelTab:AddToggle('enabled3', {Text = 'enabled', Default = ViewmodelEnabled}):OnChanged(function(Toggle)
    ViewmodelEnabled = Toggle
  end)
  
  CustomViewmodelTab:AddSlider('Viewmodelx', {Text = 'x-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
    ViewmodelPos = Vector3.new(Slider, ViewmodelPos.Y, ViewmodelPos.Z)
  end)
  
  CustomViewmodelTab:AddSlider('ViewmodelY', {Text = 'y-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
    ViewmodelPos = Vector3.new(ViewmodelPos.X, Slider, ViewmodelPos.Z)
  end)
  
  CustomViewmodelTab:AddSlider('ViewmodelX', {Text = 'z-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
    ViewmodelPos = Vector3.new(ViewmodelPos.X, ViewmodelPos.Y, Slider)
  end)

local Enabled = false
local DefaultHandModels = {}
local newColor

for _, model in pairs(handModels:GetChildren()) do
    for _, object in pairs(model:GetDescendants()) do
        if not object:IsA("AnimationController") then
            if object:IsA("BasePart") then
                if not newColor then
                    newColor = object.Color
                end
                
                DefaultHandModels[object.Name] = {Color = object.Color, Material = object.Material}
            end
        end
    end
end

local function applyChanges()
    for _, model in pairs(handModels:GetChildren()) do
        for _, object in pairs(model:GetDescendants()) do
            if object:IsA("BasePart") then
                object.Material = object.Material
                object.Color = newColor
            end
        end
    end
end

local function revertChanges()
    for _, model in pairs(handModels:GetChildren()) do
        for _, object in pairs(model:GetDescendants()) do
            if object:IsA("BasePart") then
                local originalProperties = DefaultHandModels[object.Name]
                if originalProperties then
                    object.Material = originalProperties.Material
                    object.Color = originalProperties.Color
                end
            end
        end
    end
end

ItemTab:AddToggle('Enabled2', {
    Text = 'Enabled',
    Default = false,
    Callback = function(value)
        Enabled = value
        if Enabled then
            applyChanges()
        else
            revertChanges()
        end
    end
}):AddColorPicker('NewCClor', {
    Default = newColor,
    Title = 'Color',
    Callback = function(value)
        newColor = value
        if Enabled then
            applyChanges()
        end
    end
})

ItemTab:AddDropdown('MaterialDropdown', {
    Text = "Material",
    Default = "ForceField",
    Values = {"CrackedLava", "ForceField", "Neon"},
    Callback = function(selectedMaterial)
        if Enabled then
            for _, model in pairs(handModels:GetChildren()) do
                for _, object in pairs(model:GetDescendants()) do
                    if object:IsA("BasePart") then
                        object.Material = Enum.Material[selectedMaterial]
                    end
                end
            end
        end
    end
})


WorldVisuals:AddToggle('Remove Grass', {
    Text = 'Remove Grass',
    Default = false,
    Callback = function(value)
        if value then
            sethiddenproperty(game.Workspace.Terrain, "Decoration", false)
        else
            sethiddenproperty(game.Workspace.Terrain, "Decoration", true)
        end
    end
})

WorldVisuals:AddToggle('Remove Shadows', {
    Text = 'Remove Shadows',
    Default = false,
    Callback = function(value)
        if value then
    sethiddenproperty(game:GetService("Lighting"), "GlobalShadows", false)
        else
    sethiddenproperty(game:GetService("Lighting"), "GlobalShadows", true)
        end
    end
})


  local ServerInfoGroup = Tabs['UI Settings']:AddRightGroupbox('Extra')
  
  ServerInfoGroup:AddButton('Copy Discord', function()
  if pcall(setclipboard,"https://discord.gg/qx4py3YdBn") then
  Library:Notify('copied discord link', 5)
  end
  end)
  

  local antiAFKConnection
  
  ServerInfoGroup:AddToggle('AntiAFK', {
    Text = "Anti Afk",
    Default = false,
    Callback = function(Value)
        if Value then
            local VirtualUser = game:GetService("VirtualUser")
            antiAFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        else
            if antiAFKConnection then
                antiAFKConnection:Disconnect()
            end
        end
    end
  })
  


  Library:SetWatermarkVisibility(true)
  Library:SetWatermark('🎃 Hollow.cfg 🎃')
  Library.KeybindFrame.Visible = true; 
  Library:OnUnload(function()
      Library.Unloaded = true
  end)
  
  local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
  
  MenuGroup:AddButton('Unload', function() Library:Unload() end)
  MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

  Library.ToggleKeybind = Options.MenuKeybind
  ThemeManager:SetLibrary(Library)
  SaveManager:SetLibrary(Library)
  SaveManager:IgnoreThemeSettings()
  SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
  ThemeManager:SetFolder('Hollow.Cfg')
  SaveManager:SetFolder('Hollow.Cfg/Configs')
  SaveManager:BuildConfigSection(Tabs['UI Settings'])
  ThemeManager:ApplyToTab(Tabs['UI Settings'])
  SaveManager:LoadAutoloadConfig()
  
  local Players = game:GetService("Players")
  local LocalPlayer = Players.LocalPlayer
  local AccountName = LocalPlayer.Name
  local AccountAge = LocalPlayer.AccountAge
  local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
  
  local ServerInfoGroup = Tabs['UI Settings']:AddRightGroupbox('Server Info')
  
  local ServerPlayersText = ServerInfoGroup:AddLabel(string.split(game:GetService("Players").LocalPlayer.PlayerGui.GameUI.ServerInfo.Text,"|")[1])
  local ServerPlayersText = ServerInfoGroup:AddLabel("Players: "..#Players:GetPlayers())
  local AccountNameText = ServerInfoGroup:AddLabel("Account Name: "..AccountName)
  local AccountAgeText = ServerInfoGroup:AddLabel("Account Age: "..AccountAge.." days")
  
  Players.PlayerAdded:Connect(function()
    ServerPlayersText:SetText("Players: "..#Players:GetPlayers())
  end)
  
  Players.PlayerRemoving:Connect(function()
    ServerPlayersText:SetText("Players: "..#Players:GetPlayers())
  end)

getgenv().mod_ui = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/unh4ppyy/lib/main/MODDEDUI"))()

while true do
game.Lighting.ClockTime = 12
task.wait()
end

]==])



