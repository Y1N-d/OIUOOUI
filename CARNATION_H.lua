---@diagnostic disable: deprecated, undefined-global, lowercase-global

--====== (([[{{ UI LIB }}]])) ======--
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--====== (([[{{ UI APPEARENCE }}]])) ======--

--// CCC WINDOW
local christmasTheme = {
    TextColor = Color3.fromRGB(235, 255, 235),

    Background = Color3.fromRGB(18, 22, 18),
    Topbar = Color3.fromRGB(20, 40, 25),
    Shadow = Color3.fromRGB(10, 12, 10),

    NotificationBackground = Color3.fromRGB(22, 40, 28),
    NotificationActionsBackground = Color3.fromRGB(200, 40, 40),

    TabBackground = Color3.fromRGB(30, 55, 35),
    TabStroke = Color3.fromRGB(60, 120, 80),
    TabBackgroundSelected = Color3.fromRGB(200, 40, 40), -- vermelho natal
    TabTextColor = Color3.fromRGB(235, 255, 235),
    SelectedTabTextColor = Color3.fromRGB(255, 235, 235),

    ElementBackground = Color3.fromRGB(28, 45, 32),
    ElementBackgroundHover = Color3.fromRGB(35, 60, 42),
    SecondaryElementBackground = Color3.fromRGB(22, 35, 26),
    ElementStroke = Color3.fromRGB(70, 130, 90),
    SecondaryElementStroke = Color3.fromRGB(55, 100, 75),

    SliderBackground = Color3.fromRGB(40, 170, 95),   -- verde natal
    SliderProgress = Color3.fromRGB(60, 200, 120),
    SliderStroke = Color3.fromRGB(120, 255, 180),

    ToggleBackground = Color3.fromRGB(28, 45, 32),
    ToggleEnabled = Color3.fromRGB(40, 180, 90),
    ToggleDisabled = Color3.fromRGB(95, 95, 95),
    ToggleEnabledStroke = Color3.fromRGB(120, 255, 180),
    ToggleDisabledStroke = Color3.fromRGB(120, 120, 120),
    ToggleEnabledOuterStroke = Color3.fromRGB(60, 140, 90),
    ToggleDisabledOuterStroke = Color3.fromRGB(70, 70, 70),

    DropdownSelected = Color3.fromRGB(35, 60, 42),
    DropdownUnselected = Color3.fromRGB(28, 45, 32),

    InputBackground = Color3.fromRGB(28, 45, 32),
    InputStroke = Color3.fromRGB(80, 150, 110),
    PlaceholderColor = Color3.fromRGB(190, 220, 200)
}

local halloweenTheme = {
    TextColor = Color3.fromRGB(255, 235, 200),

    Background = Color3.fromRGB(18, 18, 18),
    Topbar = Color3.fromRGB(30, 15, 5),
    Shadow = Color3.fromRGB(10, 10, 10),

    NotificationBackground = Color3.fromRGB(25, 15, 10),
    NotificationActionsBackground = Color3.fromRGB(255, 140, 0),

    TabBackground = Color3.fromRGB(45, 25, 10),
    TabStroke = Color3.fromRGB(90, 50, 20),
    TabBackgroundSelected = Color3.fromRGB(255, 140, 0),
    TabTextColor = Color3.fromRGB(255, 210, 160),
    SelectedTabTextColor = Color3.fromRGB(35, 20, 5),

    ElementBackground = Color3.fromRGB(28, 18, 10),
    ElementBackgroundHover = Color3.fromRGB(38, 25, 15),
    SecondaryElementBackground = Color3.fromRGB(20, 12, 8),
    ElementStroke = Color3.fromRGB(90, 50, 20),
    SecondaryElementStroke = Color3.fromRGB(60, 35, 15),

    SliderBackground = Color3.fromRGB(255, 120, 0),
    SliderProgress = Color3.fromRGB(255, 150, 30),
    SliderStroke = Color3.fromRGB(255, 180, 80),

    ToggleBackground = Color3.fromRGB(30, 18, 10),
    ToggleEnabled = Color3.fromRGB(255, 120, 0),
    ToggleDisabled = Color3.fromRGB(90, 90, 90),
    ToggleEnabledStroke = Color3.fromRGB(255, 170, 60),
    ToggleDisabledStroke = Color3.fromRGB(120, 120, 120),
    ToggleEnabledOuterStroke = Color3.fromRGB(180, 90, 20),
    ToggleDisabledOuterStroke = Color3.fromRGB(70, 70, 70),

    DropdownSelected = Color3.fromRGB(40, 25, 15),
    DropdownUnselected = Color3.fromRGB(30, 18, 10),

    InputBackground = Color3.fromRGB(30, 18, 10),
    InputStroke = Color3.fromRGB(100, 55, 25),
    PlaceholderColor = Color3.fromRGB(200, 170, 130)
}

local Window = Rayfield:CreateWindow({
   Name = "CC Carnation Alpha v0.9 🎃",
   Icon = "boxes",
   LoadingTitle = "Carnation Hub",
   LoadingSubtitle = "Alpha v0.9 🎃",
   
   Theme = halloweenTheme,

   ToggleUIKeybind = Enum.KeyCode.RightControl,

     DisableRayfieldPrompts = false,
      DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
   
      ConfigurationSaving = {
         Enabled = true,
         FolderName = nil, -- Create a custom folder for your hub/game
         FileName = "Big Hub"
      },
   
      Discord = {
         Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
         Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
         RememberJoins = true -- Set this to false to make them join the discord every time they load it up
      },
   
      KeySystem = false, -- Set this to true to use our key system
      KeySettings = {
         Title = "Untitled",
         Subtitle = "Key System",
         Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
         FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
         SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
         GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
         Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
      }
   })

--====== (([[{{ TABS }}]])) ======--

local TabMain      = Window:CreateTab("Main", "package")
local TabEvent     = Window:CreateTab("Halloween Event", "calendar")
local TabAutos     = Window:CreateTab("Auto Exchange", "piggy-bank")
local TabTeleport  = Window:CreateTab("Teleports", "goal")
local TabKeys      = Window:CreateTab("Auto Moves", "keyboard")
local TabLP        = Window:CreateTab("LocalPlayer", "user-round")
local TabMisc      = Window:CreateTab("Extras", "circle-plus")

--// Essentials
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Camera = workspace.CurrentCamera
local LP = game:GetService("Players").LocalPlayer

local lastPressH = 0
local lastPressF = 0

--====== (([[{{ LOCAL }}]])) ======--

--// Folders
local NPCFolder = workspace:WaitForChild("Living")

--// Others
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local HRP = nil
local CoreGui = game:GetService("CoreGui")

--// Data
local data = LP:WaitForChild("Data")
local exp = data:WaitForChild("Exp")
local mastery = data:WaitForChild("Mastery")

--// Remotes
local GlobalRemotes = ReplicatedStorage:WaitForChild("GlobalUsedRemotes")

local upgRemote = GlobalRemotes:WaitForChild("UpgradeMas")
local brkRemote = GlobalRemotes:WaitForChild("Breakthrough")

--// Slider
local defaultWalkSpeed = LP.Character.Humanoid.WalkSpeed
local defaultJumpPower = LP.Character.Humanoid.JumpPower

--// Remotes/Keys
local exchangeRemote = game:GetService("ReplicatedStorage").ABCRemotes.Exchange
local BlockEvent = ReplicatedStorage["ABC - First Priority"].Utility.Modules.Warp.Index.Event.Reliable
local HEvent = ReplicatedStorage["ABC - First Priority"].Utility.Modules.Warp.Index.Event.Reliable
local M1Event = ReplicatedStorage["ABC - First Priority"].Utility.Modules.Warp.Index.Event.Reliable

local autoPressHEnabled = false
local autoPressHConnection

local autoBlockEnabled = false
local autoParryEnabled = false
local autoBlockConnection
local autoParryConnection
local holdingBlock = false
local lastBlockBar = nil

-- [[ TOGGLES ]] --

--// Main
local autofarmEnabled = false
local autofarmThread = nil
local autokillEnabled = false
local autokillRunning = false
local AK_PROXIMITY = 20
local AK_DELAY = 10

--//  LivingTP
local autoM1Active = false
local LivingTeleportActive = false
local antiAFKConnection
local PlayerTeleportActive = false
local PlayerLoopActive = false
local selectedPlayerLoop = nil
local selectedPlayerLoopModel = nil
local teleportConnection = nil
local TakeDamageActive = false

local HollowsTPActive = false
local hollowsTeleportConnection = nil

local CurseTPActive = false
local CurseTeleportConnection = nil

local SpawnMeatActive = false
local spawnMeatConnection

local collisionCache = {}
local HollowCollision = {}
local CurseCollision = {}
local OthersCollision = {}
local LivingCollision = {}

--// AutoMoves
local autoMovesEnabled = false
local autoMovesThread
local selectedKeys = {"E", "R", "T", "Y"} -- valores iniciais do dropdown
local delayBetweenKeys = 0.1
local delayBetweenCycles = 0.1

--// Event
local Q3BossFarmEnabled = false
local Q3BossFarmConnection
local Q3BossHPressConnection
local Q3BossAutokillConnection

--// Take Damage
local CenterOffset = 6
local UpdateRate = 0.05

--// Sell
local SellEvent = game:GetService("ReplicatedStorage").GlobalUsedRemotes.SellItem
local sellAllEnabled = false

--// Event
local autoExchangeEnabled = false
local autoExchangeThread = nil

--// Remotes
local fireMEnabled = false
local fireBreakthroughEnabled = false

--// Position
local playerLoopPosition = "BackCloser"

-- [[ TELEPORTS ]] --

--// TP Delay
local teleportDelay = 0.05
local promptDelay = 0.1

--// Living TP
_G.TeleportPosition = "Back"
local selectedLivingNPC = nil
local livingDropdown = nil

-- [[ DROPDOWNS ]] --

--// { AUTO LIST }
local npcNames = {}
local areaNames = {}
local livingNPCNames = {}
local livingNPCObjects = {}
local playerNames = {}


--// { Manual List }
local autofarmIgnoreOptions = {
    "Box",
    "Barrel",
    "Chest",
    "NichirinOres",
    "MagicOres"
}

local ignoredAutofarmItems = {}

local positionOptions = {
    "Down",
    "Up",
    "Back",
    "Front"
}

local technologyList = {
    "Compatibility",
    "Future",
    "Legacy",
    "ShadowMap",
    "Unified",
    "Voxel"
}

local technologyMap = {
    Compatibility = Enum.Technology.Compatibility,
    Future = Enum.Technology.Future,
    Legacy = Enum.Technology.Legacy,
    ShadowMap = Enum.Technology.ShadowMap,
    Unified = Enum.Technology.Unified,
    Voxel = Enum.Technology.Voxel
}

    local LoopPositions = {
        "Back",
        "BackCloser",
        "Down"
}

local sellableItems = {
    "Arrow",
    "Mysterious Camera",
    "Hamon Manual",
    "Rokakaka",
    "Stop Sign",
    "Stone Mask",
    "Haunted Sword",
    "Spin Manual",
    "Barrel",
    "Bomu Bomu Devil Fruit",
    "Mochi Mochi Devil Fruit",
    "Bari Bari Devil Fruit"
}

local ignoredItems = {}

--// HOLLOWS LIST
local HOLLOWS_NPCS = {
    -- "BarraganWorldBoss",
    "Adjuchas",
    "Menos",
    "MenosWeak",
    "Fishbone",
    "Frog Hollow"
}

--// CURSE LIST
local CURSE_NPCS = {
    -- "Space Curse",
    "Paper Curse",
    "Paper Curse Half",
    "Paper Curse Quarter",
    "Spider Curse",
    "Contorted Curse",
    "Glutton Curse",
    "Mosquito Curse"
}

--// OTHERS LIST
local OTHERS_NPCS = {
    "Thug",
    "Bandit",
    "Monkey"
}

local keyMap = {
    E = Enum.KeyCode.E,
    R = Enum.KeyCode.R,
    T = Enum.KeyCode.T,
    Y = Enum.KeyCode.Y,
    G = Enum.KeyCode.G,
    H = Enum.KeyCode.H,
    J = Enum.KeyCode.J,
    B = Enum.KeyCode.B
}

-- [[ THREADS ]] --

--// Main
local autoM1Thread = nil
local teleportThread = nil
local playerTeleportThread = nil
local playerLoopThread = nil
local TakeDamageThread = nil

-- [[ ESP ]] --

--// Local
local espColor = Color3.fromRGB(255, 0, 0)
local espFolder = Instance.new("Folder")
espFolder.Name = "ESPFolder"
espFolder.Parent = game.CoreGui
local NPC_FOLDER = workspace.Living

--// Trigger
local ESP_ENABLED = true
local ESP_BOX = false
local ESP_TRACER = false
local ESP_NAME = false
local ESP_DISTANCE = false

--// ESP Color Main
local espColor = Color3.fromRGB(255,0,0)

--// ESP List
local Tracers = {}
local Names = {}
local Boxes = {}
local NPC_LIST = {}

--// REMOVE ESP
local function removeESP(npc)
    if Tracers[npc] then
        Tracers[npc]:Remove()
        Tracers[npc] = nil
    end
    if Names[npc] then
        Names[npc]:Remove()
        Names[npc] = nil
    end
    if Boxes[npc] then
        Boxes[npc]:Destroy()
        Boxes[npc] = nil
    end
end

--// BOX
local function updateBox(npc, model)
    if not ESP_BOX then
        if Boxes[npc] then Boxes[npc]:Destroy() Boxes[npc]=nil end
        return
    end

    if not Boxes[npc] then
        local H = Instance.new("Highlight")
        H.FillTransparency = 1
        H.OutlineColor = espColor
        H.Parent = model
        Boxes[npc] = H
    else
        Boxes[npc].OutlineColor = espColor
    end
end

--// NAME + DISTANCE
local function updateName(npc, root)
    if not ESP_NAME and not ESP_DISTANCE then
        if Names[npc] then Names[npc]:Remove() Names[npc]=nil end
        return
    end
    
    if not Names[npc] then
        local Billboard = Instance.new("BillboardGui")
        Billboard.Size = UDim2.new(0,100,0,30)
        Billboard.AlwaysOnTop = true

        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1,0,1,0)
        Label.BackgroundTransparency = 1
        Label.Font = Enum.Font.SourceSansSemibold
        Label.TextStrokeTransparency = 0.5
        Label.TextSize = 14
        Label.TextColor3 = espColor
        Label.Parent = Billboard

        Names[npc] = Billboard
        Billboard.Parent = root
    end

    local text = ""

    if ESP_NAME then
        text = npc.Name
    end
    
    if ESP_DISTANCE then
        local mag = (root.Position - LP.Character.HumanoidRootPart.Position).Magnitude
        text = text .. " [" .. math.floor(mag) .. "m]"
    end

    Names[npc].TextLabel.Text = text
    Names[npc].TextLabel.TextColor3 = espColor
end

--// TRACER
local function updateTracer(npc, pos2D, visible)
    if not ESP_TRACER then
        if Tracers[npc] then 
            Tracers[npc].Visible = false 
        end
        return
    end

    if not Tracers[npc] then
        local line = Drawing.new("Line")
        line.Thickness = 1.5
        line.Color = espColor
        line.Visible = false
        Tracers[npc] = line
    end

    local line = Tracers[npc]

    if not visible then
        line.Visible = false
        return
    end

    local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then
        line.Visible = false
        return
    end

    local myPos, myVisible = Camera:WorldToViewportPoint(myHRP.Position)
    if not myVisible then
        line.Visible = false
        return
    end

    line.From = Vector2.new(myPos.X, myPos.Y)
    line.To = Vector2.new(pos2D.X, pos2D.Y)
    line.Color = espColor
    line.Visible = true
end

--// GLOBAL UPDATE ESP
function updateESP()
    if not ESP_ENABLED then
        for npc,_ in pairs(NPC_LIST) do
            removeESP(npc)
        end
        return
    end

    for _, npc in ipairs(NPC_FOLDER:GetChildren()) do
        if npc:FindFirstChild("Humanoid") 
        and npc:FindFirstChild("HumanoidRootPart") 
        and npc.Humanoid.Health > 0 then
            NPC_LIST[npc] = true
        end
    end

    for npc,_ in pairs(NPC_LIST) do
        if npc.Parent ~= NPC_FOLDER 
        or not npc:FindFirstChild("Humanoid") 
        or not npc:FindFirstChild("HumanoidRootPart")
        or npc.Humanoid.Health <= 0 then
            removeESP(npc)
            NPC_LIST[npc] = nil
        else
            
            local HRP = npc.HumanoidRootPart
            local pos, visible = Camera:WorldToViewportPoint(HRP.Position)

            if visible then
                updateBox(npc, npc)
                updateName(npc, HRP)
                updateTracer(npc, Vector2.new(pos.X,pos.Y), visible)
            else
                updateTracer(npc, Vector2.new(-1000,-1000), false)
            end
        end
    end
end

--// RENDER LOOP
RunService.RenderStepped:Connect(function()
    if LP.Character 
    and LP.Character:FindFirstChild("HumanoidRootPart") then
        updateESP()
    end
end)

--====== (([[{{ FUNCTIONS }}]])) ======--

--// Main
local function updateHRP()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        HRP = LP.Character.HumanoidRootPart
    end
end

LP.CharacterAdded:Connect(function()
    task.wait(1)
    updateHRP()
end)
updateHRP()

local function activatePrompt(prompt)
    prompt.HoldDuration = 0
    task.wait(promptDelay)
    if fireproximityprompt then
        fireproximityprompt(prompt)
    else
        prompt:InputHoldBegin()
        task.wait()
        prompt:InputHoldEnd()
    end
end

local function setNoCollision(char, state)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            if state then
                if collisionCache[part] == nil then
                    collisionCache[part] = part.CanCollide
                end
                part.CanCollide = false
            else
                if collisionCache[part] ~= nil then
                    part.CanCollide = collisionCache[part]
                end
            end
        end
    end
end

-- [[{{ ITEM FARM }}]] --

--// Ignore Items Autofarm
local function shouldIgnoreAutofarm(itemName)
    for _, v in ipairs(ignoredAutofarmItems) do
        if itemName:lower():find(v:lower()) then
            return true
        end
    end
    return false
end

--// Trigger ItemFarm
local function runItemFarm()
    if autofarmThread then return end

    autofarmThread = task.spawn(function()
        while autofarmEnabled do
            local foundItemInThisLoop = false
            local player = game.Players.LocalPlayer
            local char = player.Character
            local HRP = char and char:FindFirstChild("HumanoidRootPart")
            if not HRP then
                task.wait(0.1)
            else
                local folders = {workspace:FindFirstChild("Item"), workspace:FindFirstChild("Item2")}
                
                for _, itemFolder in ipairs(folders) do
                    if itemFolder then
                        for _, v in ipairs(itemFolder:GetDescendants()) do
                            if not autofarmEnabled then break end -- sai do loop se desativado
                            if v:IsA("BasePart") and not shouldIgnoreAutofarm(v.Name) then
                                _G.ItemFarmPriority = true
                                foundItemInThisLoop = true

                                HRP.CFrame = CFrame.new(v.Position + Vector3.new(0, 4, 0)) * HRP.CFrame.Rotation
                                task.wait(teleportDelay or 0.1)

                                local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                                if prompt then activatePrompt(prompt) end

                                task.wait(0.1)
                            end
                        end
                    end
                end

                if not foundItemInThisLoop then
                    _G.ItemFarmPriority = false
                end

                task.wait(0.1)
            end
        end

        autofarmThread = nil
        _G.ItemFarmPriority = false
    end)
end

-- [[{{ AUTOKILL }}]] --

--// Trigger AutoKill
local function autokill()
    if autokillRunning then return end
    autokillRunning = true

    task.spawn(function()
        while autokillEnabled do
            local char = LP.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then
                task.wait(1)
                continue
            end

            local entities = workspace:FindFirstChild("Living") and workspace.Living:GetChildren()
            if entities then
                for _, entity in ipairs(entities) do
                    if entity ~= char and entity:FindFirstChild("Humanoid") and entity:FindFirstChild("HumanoidRootPart") then
                        local distance = (hrp.Position - entity.HumanoidRootPart.Position).Magnitude
                        if distance <= AK_PROXIMITY then
                            entity.Humanoid.Health = 0
                            task.wait(AK_DELAY)
                        end
                    end
                end
            end

            task.wait(0.5)
        end
        autokillRunning = false
    end)
end

-- [[{{ REFRESH }}]] --

--// NPC List
function refreshNPCList()
    -- garante que as tabelas existam (evita nil/reuso)
    NPCList = {}
    NPCObjects = {}

    local npcFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("NPCs")
    if npcFolder then
        for _, npc in ipairs(npcFolder:GetChildren()) do
            if npc and npc:IsA("Model") then
                table.insert(NPCList, npc.Name)
                NPCObjects[npc.Name] = npc
            end
        end
    end

    table.sort(NPCList, function(a, b)
        return a:lower() < b:lower()
    end)

    -- Atualiza o dropdown se a API tiver Refresh
    if npcDropdown and type(npcDropdown.Refresh) == "function" then
        pcall(function()
            npcDropdown:Refresh(NPCList)
        end)
    end

    -- Define uma opção atual automaticamente (primeira da lista) para evitar nil nos TPs
    if #NPCList > 0 then
        selectedNPC = NPCList[1]
        selectedNPCModel = NPCObjects[selectedNPC]
        if npcDropdown and type(npcDropdown.Set) == "function" then
            pcall(function()
                npcDropdown:Set({ selectedNPC })
            end)
        end
    else
        selectedNPC = nil
        selectedNPCModel = nil
        if npcDropdown and type(npcDropdown.Set) == "function" then
            pcall(function()
                npcDropdown:Set({})
            end)
        end
    end
end

--// Area List
local function refreshAreaList()

    areaNames = {}

    local locFolder = workspace:FindFirstChild("Locations")

    if locFolder then
        for _, area in ipairs(locFolder:GetChildren()) do
            if area:IsA("BasePart") or area:FindFirstChildWhichIsA("BasePart") then
                table.insert(areaNames, area.Name)
            end
        end
    end

    table.sort(areaNames, function(a, b)
        return a:lower() < b:lower()
    end)

    if areaDropdown then
        areaDropdown:Refresh(areaNames)
    end
end

--// LivingNPC List
function refreshLivingNPCList()
    table.clear(livingNPCNames)
    table.clear(livingNPCObjects)

    local npcFolder = workspace:FindFirstChild("Living")
    if npcFolder then
        local nameCount = {} -- para numerar duplicados
        for _, npc in ipairs(npcFolder:GetChildren()) do
            if npc:IsA("Model") then
                local baseName = npc.Name
                local displayName = baseName

                nameCount[baseName] = (nameCount[baseName] or 0) + 1
                if nameCount[baseName] > 1 then
                    displayName = baseName .. " " .. tostring(nameCount[baseName])
                end

                table.insert(livingNPCNames, displayName)
                livingNPCObjects[displayName] = npc
            end
        end
    end

    table.sort(livingNPCNames, function(a, b)
        return a:lower() < b:lower()
    end)

    -- Atualiza o dropdown se existir
    if livingDropdown then
        pcall(function()
            livingDropdown:Refresh(livingNPCNames)
        end)
    end

    -- Define automaticamente a primeira opção para evitar nil
    if #livingNPCNames > 0 then
        selectedLivingNPC = livingNPCNames[1]
        selectedLivingNPCModel = livingNPCObjects[selectedLivingNPC]
        if livingDropdown and type(livingDropdown.Set) == "function" then
            pcall(function()
                livingDropdown:Set({ selectedLivingNPC })
            end)
        end
    else
        selectedLivingNPC = nil
        selectedLivingNPCModel = nil
        if livingDropdown and type(livingDropdown.Set) == "function" then
            pcall(function()
                livingDropdown:Set({})
            end)
        end
    end
end

local function getLivingNPC(displayName)
    return livingNPCObjects[displayName]
end

local function isModelStillThere(npc)
    return npc 
        and npc.Parent
        and npc:IsDescendantOf(workspace)
        and npc:FindFirstChild("HumanoidRootPart")
end

--// HOLLOW PRIORITY
local function getPriorityHollow()
    local livingFolder = workspace:FindFirstChild("Living")
    if not livingFolder then return nil end

    for _, targetName in ipairs(HOLLOWS_NPCS) do
        for _, npc in ipairs(livingFolder:GetChildren()) do
            if npc.Name == targetName and npc.Parent and npc:FindFirstChild("HumanoidRootPart") then
                return npc
            end
        end
    end
    return nil
end

--// CURSE PRIORITY
local function getPriorityCurse()
    local livingFolder = workspace:FindFirstChild("Living")
    if not livingFolder then return nil end

    for _, targetName in ipairs(CURSE_NPCS) do
        for _, npc in ipairs(livingFolder:GetChildren()) do
            if npc.Name == targetName and npc.Parent and npc:FindFirstChild("HumanoidRootPart") then
                return npc
            end
        end
    end
    return nil
end

--// Others PRIORITY
local function getPriorityOthers()
    local livingFolder = workspace:FindFirstChild("Living")
    if not livingFolder then return nil end

    for _, targetName in ipairs(OTHERS_NPCS) do
        for _, npc in ipairs(livingFolder:GetChildren()) do
            if npc.Name == targetName and npc.Parent and npc:FindFirstChild("HumanoidRootPart") then
                return npc
            end
        end
    end
    return nil
end

--// Player List
local function refreshPlayerList()
    local playerNames = {}

    local livingFolder = workspace:FindFirstChild("Living")

    if livingFolder then
        for _, obj in ipairs(livingFolder:GetChildren()) do
            if obj:IsA("Model") then
                local humanoidRoot = obj:FindFirstChild("HumanoidRootPart")
                if humanoidRoot then
                    local plr = game.Players:GetPlayerFromCharacter(obj)
                    if plr then
                        table.insert(playerNames, obj.Name)
                    end
                end
            end
        end
    end
    
    table.sort(playerNames, function(a, b)
        return a:lower() < b:lower()
    end)

    selectedPlayerLoop = nil
    selectedPlayerLoopModel = nil
    if playerDropdown then
        playerDropdown:Refresh(playerNames)
    end
end

--/ TakeDamage
local function getDummies()
    local list = {}
    if not NPCFolder then return list end -- Proteção contra erro de pasta inexistente [cite: 2]
    
    for _, model in ipairs(NPCFolder:GetChildren()) do
        if model:IsA("Model") and model.Name == "Attacking Dummy" then
            local hrp = model:FindFirstChild("HumanoidRootPart")
            if hrp then
                table.insert(list, hrp) -- [cite: 37]
            end
        end
    end
    return list
end

local function loopTeleportCircle()
    while TakeDamageActive do
        local char = LP.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        
        if not hrp then 
            task.wait(0.1)
            continue 
        end
        
        local targets = getDummies()
        local originalPlayerCF = hrp.CFrame -- Guarda onde tu estás realmente

        if #targets > 0 then
            for i, dummyHRP in ipairs(targets) do
                if not TakeDamageActive then break end
                
                -- 1. PARTE VISUAL (Traz o NPC para a tua frente no teu ecrã)
                local angle = (2 * math.pi / #targets) * i
                local x = math.sin(angle) * 3
                local z = math.cos(angle) * 3
                local visualPos = hrp.Position + Vector3.new(x, 0, z)
                
                -- Faz o NPC olhar para ti enquanto orbita
                dummyHRP.CFrame = CFrame.lookAt(visualPos, Vector3.new(hrp.Position.X, visualPos.Y, hrp.Position.Z))

                -- 2. PARTE DA HITBOX (Leva-te até ao NPC original para o servidor validar o dano)
                -- O 'pcall' evita que o script pare se o NPC morrer durante o loop
                pcall(function()
                    -- Teleporta o teu HRP para a frente da posição REAL do Dummy
                    -- Usamos 2 studs de distância para garantir que a tua espada/punho acerta
                    hrp.CFrame = dummyHRP.CFrame * CFrame.new(0, 0, 2)
                    
                    -- Pequeníssima espera para o servidor processar que estiveste lá
                    task.wait(0.01) 
                    
                    -- Volta para a posição onde queres estar visualmente
                    hrp.CFrame = originalPlayerCF
                end)
            end
        end
        
        task.wait(0.02) -- Velocidade do ciclo de dano
    end
end

--// Sell Ignore
local function shouldIgnore(item)
    for _, ignored in ipairs(ignoredItems) do
        if item == ignored then
            return true
        end
    end
    return false
end

--// AutoBlock/Auto Parry
local function pressBlock()
    if not holdingBlock then
        holdingBlock = true
        BlockEvent:FireServer(
            (function(bytes)
                local b = buffer.create(#bytes)
                for i = 1, #bytes do buffer.writeu8(b, i - 1, bytes[i]) end
                return b
            end)({22}),
            (function(bytes)
                local b = buffer.create(#bytes)
                for i = 1, #bytes do buffer.writeu8(b, i - 1, bytes[i]) end
                return b
            end)({254, 2, 0, 6, 1, 70, 5, 1})
        )
    end
end

local function releaseBlock()
    if holdingBlock then
        holdingBlock = false
        BlockEvent:FireServer(
            (function(bytes)
                local b = buffer.create(#bytes)
                for i = 1, #bytes do buffer.writeu8(b, i - 1, bytes[i]) end
                return b
            end)({22}),
            (function(bytes)
                local b = buffer.create(#bytes)
                for i = 1, #bytes do buffer.writeu8(b, i - 1, bytes[i]) end
                return b
            end)({254, 2, 0, 6, 1, 70, 5, 0})
        )
    end
end

local function getPlayerData(char)
    local cdValues = char:FindFirstChild("CDValues")
    local usedValues = char:FindFirstChild("UsedValues")
    local blockBar = usedValues and usedValues:FindFirstChild("BlockBar")
    local blocking = cdValues and cdValues:FindFirstChild("Blocking")
    local parryCD = cdValues and cdValues:FindFirstChild("Parry_Cooldown")
    if not blockBar then return nil end
    return {
        blockBar = blockBar,
        blocking = blocking,
        parryCD = parryCD
    }
end

--// Auto TS
local function pressHRemote()
    HEvent:FireServer(
        (function(bytes)
            local b = buffer.create(#bytes)
            for i = 1, #bytes do
                buffer.writeu8(b, i - 1, bytes[i])
            end
            return b
        end)({22}),
        (function(bytes)
            local b = buffer.create(#bytes)
            for i = 1, #bytes do
                buffer.writeu8(b, i - 1, bytes[i])
            end
            return b
        end)({254, 1, 0, 6, 1, 72})
    )
end

--// Auto M1
local function pressM1Remote()
    M1Event:FireServer(
        (function(bytes)
            local b = buffer.create(#bytes)
            for i = 1, #bytes do
                buffer.writeu8(b, i - 1, bytes[i])
            end
            return b
        end)({22}),
        (function(bytes)
            local b = buffer.create(#bytes)
            for i = 1, #bytes do
                buffer.writeu8(b, i - 1, bytes[i])
            end
            return b
        end)({254, 1, 0, 6, 3, 76, 77, 66})
    )
end

--====== (([[{{ MAIN }}]])) ======--

--// AutoFarm Section
local SecAutoFarm  = TabMain:CreateSection("Auto Farm")

-- [[{{ AUTO FARM }}]] --

--// Everything Autofarm
TabMain:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "Everything Autofarm",
    Callback = function(Value)
        autofarmEnabled = Value
        if Value then
            runItemFarm()
        else
            _G.ItemFarmPriority = false
        end
    end,
})

local AutofarmIgnoreDropdown = TabMain:CreateDropdown({
    Name = "Ignore Items (Autofarm)",
    Description = "Select items that the autofarm will ignore",
    Options = autofarmIgnoreOptions,
    CurrentOption = {},  -- inicia vazio
    MultipleOptions = true,
    Flag = "IgnoredAutofarmItems",
    Callback = function(selected)
        ignoredAutofarmItems = selected or {}
    end,
})

--// KillNext Entities
TabMain:CreateToggle({
    Name = "KillNext Entities (Use TimeStop)",
    CurrentValue = false,
    Flag = "InstantKill Next Entities",
    Callback = function(Value)
        autokillEnabled = Value
        if Value then
            autokill()
        end
    end
})

-- [[{{ LIVING TELEPORT }}]] --

--// Living TP Section
local SecLivingTP  = TabMain:CreateSection("Living TP")

--// HOLLOWS TP
TabMain:CreateToggle({
    Name = "TP Hollows",
    CurrentValue = false,
    Flag = "TPHollows",
    Callback = function(Value)
        HollowsTPActive = Value

        if Value then
            if hollowsTeleportConnection then
                hollowsTeleportConnection:Disconnect()
            end

            hollowsTeleportConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not HollowsTPActive or _G.ItemFarmPriority then return end

                local player = game.Players.LocalPlayer
                local char = player and player.Character
                if not char then return end

                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local target = getPriorityHollow()
                if not target then return end

                local targetHRP = target:FindFirstChild("HumanoidRootPart")
                if not targetHRP then return end

                _G.CurrentTPTarget = target

                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if HollowCollision[part] == nil then
                            HollowCollision[part] = part.CanCollide
                        end
                        part.CanCollide = false
                    end
                end

                hrp.AssemblyLinearVelocity = Vector3.zero

                local offset = Vector3.zero
                local pos = _G.TeleportPosition
                if pos == "Back" then
                    offset = -targetHRP.CFrame.LookVector * 7.5
                elseif pos == "Front" then
                    offset = targetHRP.CFrame.LookVector * 3
                elseif pos == "Up" then
                    offset = Vector3.new(0, 6.9, 0)
                elseif pos == "Down" then
                    offset = Vector3.new(0, -6.7, 0)
                end

                hrp.CFrame = targetHRP.CFrame + offset
            end)

        else
            if hollowsTeleportConnection then
                hollowsTeleportConnection:Disconnect()
                hollowsTeleportConnection = nil
            end

            _G.CurrentTPTarget = nil

            local player = game.Players.LocalPlayer
            local char = player and player.Character
            if char then
                for part, oldState in pairs(HollowCollision) do
                    if part and part.Parent then
                        part.CanCollide = oldState
                    end
                end
            end

            table.clear(HollowCollision)
        end
    end
})

--// CURSES TP
TabMain:CreateToggle({
    Name = "TP Curses",
    CurrentValue = false,
    Flag = "TPCurses",
    Callback = function(Value)
        CurseTPActive = Value

        if Value then
            if curseTeleportConnection then
                curseTeleportConnection:Disconnect()
            end

            curseTeleportConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not CurseTPActive or _G.ItemFarmPriority then return end

                local player = game.Players.LocalPlayer
                local char = player and player.Character
                if not char then return end

                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local target = getPriorityCurse()
                if not target then return end

                local targetHRP = target:FindFirstChild("HumanoidRootPart")
                if not targetHRP then return end

                _G.CurrentTPTarget = target

                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if CurseCollision[part] == nil then
                            CurseCollision[part] = part.CanCollide
                        end
                        part.CanCollide = false
                    end
                end

                hrp.AssemblyLinearVelocity = Vector3.zero

                local offset = Vector3.zero
                local pos = _G.TeleportPosition
                if pos == "Back" then
                    offset = -targetHRP.CFrame.LookVector * 7.5
                elseif pos == "Front" then
                    offset = targetHRP.CFrame.LookVector * 3
                elseif pos == "Up" then
                    offset = Vector3.new(0, 6.9, 0)
                elseif pos == "Down" then
                    offset = Vector3.new(0, -6.7, 0)
                end

                hrp.CFrame = targetHRP.CFrame + offset
            end)

        else
            if curseTeleportConnection then
                curseTeleportConnection:Disconnect()
                curseTeleportConnection = nil
            end

            _G.CurrentTPTarget = nil

            local player = game.Players.LocalPlayer
            local char = player and player.Character
            if char then
                for part, oldState in pairs(CurseCollision) do
                    if part and part.Parent then
                        part.CanCollide = oldState
                    end
                end
            end

            table.clear(CurseCollision)
        end
    end
})

--// Others TP
TabMain:CreateToggle({
    Name = "TP Others",
    CurrentValue = false,
    Flag = "TPOthers",
    Callback = function(Value)
        OthersTPActive = Value

        if Value then
            if othersTeleportConnection then
                othersTeleportConnection:Disconnect()
            end

            othersTeleportConnection = RunService.Heartbeat:Connect(function()
                if not OthersTPActive or _G.ItemFarmPriority then return end

                local player = Players.LocalPlayer
                local char = player and player.Character
                if not char then return end

                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local target = getPriorityOthers()
                if not target then return end

                local targetHRP = target:FindFirstChild("HumanoidRootPart")
                if not targetHRP then return end

                _G.CurrentTPTarget = target

                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if OthersCollision[part] == nil then
                            OthersCollision[part] = part.CanCollide
                        end
                        part.CanCollide = false
                    end
                end

                hrp.AssemblyLinearVelocity = Vector3.zero

                local offset = Vector3.zero
                local pos = _G.TeleportPosition
                if pos == "Back" then
                    offset = -targetHRP.CFrame.LookVector * 7.5
                elseif pos == "Front" then
                    offset = targetHRP.CFrame.LookVector * 3
                elseif pos == "Up" then
                    offset = Vector3.new(0, 6.9, 0)
                elseif pos == "Down" then
                    offset = Vector3.new(0, -6.7, 0)
                end

                hrp.CFrame = targetHRP.CFrame + offset
            end)
        else
            if othersTeleportConnection then
                othersTeleportConnection:Disconnect()
                othersTeleportConnection = nil
            end

            _G.CurrentTPTarget = nil

            local player = Players.LocalPlayer
            local char = player and player.Character
            if char then
                for part, oldState in pairs(OthersCollision) do
                    if part and part.Parent then
                        part.CanCollide = oldState
                    end
                end
            end

            table.clear(OthersCollision)
        end
    end
})

--// Living Teleport
TabMain:CreateToggle({
    Name = "Living TP",
    CurrentValue = false,
    Flag = "LivingTP",
    Callback = function(Value)
        LivingTeleportActive = Value

        if Value then
            if livingTeleportConnection then
                livingTeleportConnection:Disconnect()
            end

            livingTeleportConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not LivingTeleportActive then return end

                local player = game.Players.LocalPlayer
                local char = player and player.Character
                if not char then return end

                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local target = getLivingNPC(selectedLivingNPC)
                if not target then return end

                local targetHRP = target:FindFirstChild("HumanoidRootPart")
                if not targetHRP then return end

                _G.CurrentTPTarget = target

                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if LivingCollision[part] == nil then
                            LivingCollision[part] = part.CanCollide
                        end
                        part.CanCollide = false
                    end
                end

                hrp.AssemblyLinearVelocity = Vector3.zero

                local offset = Vector3.zero
                local pos = _G.TeleportPosition
                if pos == "Back" then
                    offset = -targetHRP.CFrame.LookVector * 7.5
                elseif pos == "Front" then
                    offset = targetHRP.CFrame.LookVector * 3
                elseif pos == "Up" then
                    offset = Vector3.new(0, 6.9, 0)
                elseif pos == "Down" then
                    offset = Vector3.new(0, -6.7, 0)
                end

                hrp.CFrame = targetHRP.CFrame + offset
            end)

        else
            if livingTeleportConnection then
                livingTeleportConnection:Disconnect()
                livingTeleportConnection = nil
            end

            _G.CurrentTPTarget = nil

            local player = game.Players.LocalPlayer
            local char = player and player.Character
            if char then
                for part, oldState in pairs(LivingCollision) do
                    if part and part.Parent then
                        part.CanCollide = oldState
                    end
                end
            end

            table.clear(LivingCollision)
        end
    end
})

--// Teleport Position
TabMain:CreateDropdown({
    Name = "TP Position",
    Options = positionOptions,
    CurrentOption = {"Back"},
    Flag = "TPPosition",
    Callback = function(option)
        _G.TeleportPosition = option and option[1] or "Back"
    end
})

--// Living List
livingDropdown = TabMain:CreateDropdown({
    Name = "Living List",
    Options = livingNPCNames,
    CurrentOption = {},
    Flag = "LivingList",
    Callback = function(option)
        selectedLivingNPC = (option and option[1]) or nil
        selectedLivingNPCModel = selectedLivingNPC and livingNPCObjects[selectedLivingNPC] or nil
    end
})

refreshLivingNPCList()

--// Refresh Living List
TabMain:CreateButton({
    Name = "Refresh Living List",
    Callback = function()
        refreshLivingNPCList()
    end
})

-- [[{{ GUI OPENER }}]] --

--// GUI Opener Section
local SecGUIOPENER  = TabMain:CreateSection("GUI Opener")

--// Open Stand Storage
TabMain:CreateButton({
    Name = "Open Stand Storage",
    Description = "Toggle UI",
    Callback = function()
        local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        local storage = PlayerGui:FindFirstChild("StandStorage")
        if storage then
            storage.Enabled = not storage.Enabled
        end
    end
})

--// Open Shop
TabMain:CreateButton({
    Name = "Open Shop",
    Description = "Toggle UI",
    Callback = function()
        local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        local shop = PlayerGui:FindFirstChild("ShopGUI") and PlayerGui.ShopGUI:FindFirstChild("Outer")
        if not shop then return end

        local openPos = UDim2.new(0.5, 0, 0.85, 0)
        local closedPos = UDim2.new(0.5, 0, 1.8, 0)

        if shop.Position == openPos then
            shop.Position = closedPos
        else
            shop.Position = openPos
        end
    end
})

--// Open Seller
TabMain:CreateButton({
    Name = "Open Seller",
    Description = "Toggle UI",
    Callback = function()
        local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        local sellGUI = PlayerGui:FindFirstChild("SellGUI")
        if sellGUI then
            sellGUI.Enabled = not sellGUI.Enabled
        end
    end
})

--// Auto Upgrade Section
local SecAutoMastery  = TabMain:CreateSection("Auto Upgrade")

--// Auto Mastery
TabMain:CreateToggle({
    Name = "Auto Mastery (Max Level)",
    Description = "Auto mastery upgrade",
    CurrentValue = false,
    Flag = "AutoMastery",
    Callback = function(state)
        fireMEnabled = state
        if state and exp.Value >= 30725 then
            upgRemote:FireServer()
        end
    end
})

-- Auto Mastery Listener
exp.Changed:Connect(function(v)
    if fireMEnabled and v >= 30725 then
        upgRemote:FireServer()
    end
end)

--// Auto Breakthrough
TabMain:CreateToggle({
    Name = "Auto Breakthrough (Mastery 15)",
    Description = "Auto breakthrough",
    CurrentValue = false,
    Flag = "AutoBreakthrough",
    Callback = function(state)
        fireBreakthroughEnabled = state
        if state and mastery.Value >= 15 then
            brkRemote:FireServer()
        end
    end
})

-- Mastery Listener
mastery.Changed:Connect(function(v)
    if fireBreakthroughEnabled and v >= 15 then
        brkRemote:FireServer()
    end
end)


--====== (([[{{ AUTO SELL }}]])) ======--

-- [[{{ Auto Sell }}]] --

--// Remotes Section
local SecExchange = TabAutos:CreateSection("Selling")

--// Auto Sell
TabAutos:CreateToggle({
    Name = "Auto Sell",
    Description = "Sell all items except ignored ones",
    CurrentValue = false,
    Flag = "SellAll",
    Callback = function(state)
        sellAllEnabled = state

        task.spawn(function()
            while sellAllEnabled do
                if sellableItems then
                    for i = 1, #sellableItems do
                        local item = sellableItems[i]
                        if item and not shouldIgnore(item) then
                            SellEvent:FireServer(item)
                        end
                        task.wait(0.1)
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

-- Dropdown de itens a ignorar
TabAutos:CreateDropdown({
    Name = "Ignore Items",
    Description = "Select items that will NOT be sold",
    Options = sellableItems, -- valores fixos
    CurrentOption = {},       -- inicia vazio
    MultipleOptions = true,   -- permite selecionar múltiplos
    Flag = "IgnoredItems",
    Callback = function(selected)
        ignoredItems = selected or {}
    end
})

--====== (([[{{ TELEPORTS }}]])) ======--

--// Teleports Sections
local SecTeleportNPC  = TabTeleport:CreateSection("NPCs TP")

-- [[{{ NPCS TP }}]] --

local selectedNPC = nil

TabTeleport:CreateButton({
    Name = "Teleport To NPC",
    Description = "Teleport to selected NPC",
    Callback = function()
        if not selectedNPC then return end

        local npcFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("NPCs")
        if not npcFolder then return end

        local npc = npcFolder:FindFirstChild(selectedNPC)
        if not npc then return end

        local targetPart = npc:FindFirstChild("HumanoidRootPart")
        if not targetPart then
            for _, part in ipairs(npc:GetDescendants()) do
                if part:IsA("BasePart") then
                    targetPart = part
                    break
                end
            end
        end

        if not targetPart then return end

        local player = game.Players.LocalPlayer
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        -- Resetar velocidade para não cair
        hrp.AssemblyLinearVelocity = Vector3.zero

        -- Offset vertical para não ficar dentro do chão
        local offsetY = (targetPart.Size.Y / 2) + 3

        -- Teleporta mantendo a rotação original
        hrp.CFrame = CFrame.new(targetPart.Position + Vector3.new(0, offsetY, 0), targetPart.Position + Vector3.new(0, offsetY, 0) + hrp.CFrame.LookVector)
    end
})

--// NPC List Dropdown
npcDropdown = TabTeleport:CreateDropdown({
    Name = "NPC List",
    Description = "Choose an NPC to teleport",
    Options = npcNames,
    CurrentOption = {}, -- Rayfield espera tabela
    Flag = "NPCList",
    Callback = function(option)
        selectedNPC = (option and option[1]) or nil
    end
})
--// Initial NPC List Load
refreshNPCList()

--// Refresh NPC List Button
TabTeleport:CreateButton({
    Name = "Refresh NPC List",
    Description = "Reload all NPCs from workspace",
    Callback = function()
        refreshNPCList()
    end
})

-- [[{{ AREA TP }}]] --

--// Area TP Section
local SecTeleportArea = TabTeleport:CreateSection("Area TP")

--// Teleport to Area
local selectedArea = nil

TabTeleport:CreateButton({
    Name = "Teleport To Area",
    Description = "Teleport to selected area",
    Callback = function()
        if not selectedArea then return end

        local locFolder = workspace:FindFirstChild("Locations")
        if not locFolder then return end

        local area = locFolder:FindFirstChild(selectedArea)
        if not area then return end

        local player = game.Players.LocalPlayer
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local part = area:IsA("BasePart") and area or area:FindFirstChildWhichIsA("BasePart")
        if not part then return end

        -- Resetar velocidade para não cair
        hrp.AssemblyLinearVelocity = Vector3.zero

        -- Offset vertical para não ficar dentro do chão
        local offsetY = (part.Size.Y / 2) + 3

        -- Teleporta mantendo a rotação original
        hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, offsetY, 0), part.Position + Vector3.new(0, offsetY, 0) + hrp.CFrame.LookVector)
    end
})

--// Area List Dropdown
areaDropdown = TabTeleport:CreateDropdown({
    Name = "Area List",
    Description = "Choose an area to teleport",
    Options = areaNames,
    CurrentOption = {}, -- Rayfield espera tabela
    Flag = "AreaList",
    Callback = function(option)
        selectedArea = (option and option[1]) or nil
    end
})

--// Initial Area List Load
refreshAreaList()

--// Refresh Area List Button
TabTeleport:CreateButton({
    Name = "Refresh Area List",
    Description = "Reload all areas from workspace",
    Callback = function()
        refreshAreaList()
    end
})

-- [[{{ PLAYER TP }}]] --

--// Player TP Section
local SecTeleportPLAYER  = TabTeleport:CreateSection("Player TP")

--// Player Loop TP
TabTeleport:CreateToggle({
    Name = "PlayerLoop TP",
    CurrentValue = false,
    Flag = "PlayerLoopTP",
    Callback = function(state)
        PlayerLoopActive = state
        local player = game.Players.LocalPlayer
        local storedCollisionState = {}

        if state and not playerLoopThread then
            playerLoopThread = task.spawn(function()
                while PlayerLoopActive do
                    task.wait()

                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then continue end
                    if not selectedPlayerLoopModel then continue end

                    local targetHum = selectedPlayerLoopModel:FindFirstChild("Humanoid")
                    if not targetHum or targetHum.Health <= 0 then
                        local foundNew = false
                        local livingFolder = workspace:FindFirstChild("Living")
                        if livingFolder then
                            for _, obj in ipairs(livingFolder:GetChildren()) do
                                if obj.Name == selectedPlayerLoop then
                                    selectedPlayerLoopModel = obj
                                    foundNew = true
                                    break
                                end
                            end
                        end
                        if not foundNew then
                            task.wait(0.1)
                            continue
                        end
                    end

                    local targetHRP = selectedPlayerLoopModel:FindFirstChild("HumanoidRootPart")
                    if not targetHRP then continue end

                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            if storedCollisionState[part] == nil then
                                storedCollisionState[part] = part.CanCollide
                            end
                            part.CanCollide = false
                        end
                    end

                    hrp.AssemblyLinearVelocity = Vector3.zero

                    local offset = Vector3.new()

                    if playerLoopPosition == "Back" then
                        offset = -targetHRP.CFrame.LookVector * 6.7 + Vector3.new(0, 3, 0)
                    elseif playerLoopPosition == "BackCloser" then
                        offset = -targetHRP.CFrame.LookVector * 5.7 + Vector3.new(0, 3, 0)
                    elseif playerLoopPosition == "Down" then
                        offset = Vector3.new(0, -6, 0)
                    end

                    hrp.CFrame = CFrame.new(targetHRP.Position + offset, targetHRP.Position)
                end

                local char = player.Character
                if char then
                    for part, oldState in pairs(storedCollisionState) do
                        if part and part:IsDescendantOf(char) then
                            part.CanCollide = oldState
                        end
                    end
                end

                storedCollisionState = {}
                playerLoopThread = nil
            end)
        end
    end
})

-- Teleport To Player
TabTeleport:CreateButton({
    Name = "Teleport To Player",
    Description = "Teleport to selected Player",
    Callback = function()
        if not selectedPlayerLoop then return end

        local livingFolder = workspace:FindFirstChild("Living")
        if not livingFolder then return end

        local targetChar
        for _, obj in ipairs(livingFolder:GetChildren()) do
            if obj.Name == selectedPlayerLoop then
                targetChar = obj
                break
            end
        end

        if not targetChar then return end

        local targetPart = targetChar:FindFirstChild("HumanoidRootPart") or targetChar:FindFirstChildWhichIsA("BasePart")
        if not targetPart then return end

        local char = game.Players.LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = targetPart.CFrame + Vector3.new(0, 3, 0)
        end
    end
})

-- Dropdown PlayerLoop Position
TabTeleport:CreateDropdown({
    Name = "PlayerLoop Position",
    Description = "Teleport position",
    Options = LoopPositions,
    CurrentOption = { "Back" },
    Flag = "PlayerLoopPos",
    Callback = function(pos)
        playerLoopPosition = (pos and pos[1]) or "Back"
    end
})

-- Dropdown Player List
playerDropdown = TabTeleport:CreateDropdown({
    Name = "Player List",
    Description = "Choose a player to teleport",
    Options = playerNames,
    CurrentOption = {},
    Flag = "PlayerList",
    Callback = function(selected)
        selectedPlayerLoop = (selected and selected[1]) or nil

        local livingFolder = workspace:FindFirstChild("Living")
        if livingFolder then
            for _, obj in ipairs(livingFolder:GetChildren()) do
                if obj.Name == selectedPlayerLoop then
                    selectedPlayerLoopModel = obj
                    break
                end
            end
        end
    end
})

--// Initial Player List Load
refreshPlayerList()

-- Refresh Player List
TabTeleport:CreateButton({
    Name = "Refresh Player List",
    Description = "Reload all players from workspace",
    Callback = function()
        refreshPlayerList()
    end
})

--====== (([[{{ KEYBOARD }}]])) ======--

-- [[{{ Keys }}]] --

--// Keyboard Section
local SecKeys  = TabKeys:CreateSection("Auto Moves")

--// Auto M1
TabKeys:CreateToggle({
    Name = "Auto M1",
    CurrentValue = false,
    Flag = "AutoM1",
    Callback = function(toggleState)
        AutoM1Active = toggleState

        if AutoM1Thread then
            AutoM1Active = false
            task.wait()
            AutoM1Thread = nil
        end

        if AutoM1Active then
            AutoM1Thread = task.spawn(function()
                while AutoM1Active do
                    pressM1Remote()
                    task.wait(0.05)
                end
                AutoM1Thread = nil
            end)
        end
    end
})

--// Auto Moves
TabKeys:CreateToggle({
    Name = "AutoMoves",
    CurrentValue = false,
    Flag = "AutoMoves",
    Callback = function(state)
        autoMovesEnabled = state

        -- Para thread existente
        if autoMovesThread then
            autoMovesEnabled = false
            task.wait()
            autoMovesThread = nil
        end

        -- Inicia AutoMoves
        if autoMovesEnabled then
            autoMovesThread = task.spawn(function()
                while autoMovesEnabled do
                    for _, keyName in ipairs(selectedKeys) do
                        local key = keyMap[keyName]
                        if key then
                            VIM:SendKeyEvent(true, key, false, game)
                            task.wait(delayBetweenKeys)
                            VIM:SendKeyEvent(false, key, false, game)
                        end
                    end
                    task.wait(delayBetweenCycles)
                end
                autoMovesThread = nil
            end)
        end
    end
})

TabKeys:CreateDropdown({
    Name = "Select Keys",
    Options = {"E", "R", "T", "Y", "G", "H", "J", "B"},
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "AutoMovesKeys",
    Callback = function(values)
        selectedKeys = values
    end
})

TabKeys:CreateSlider({
    Name = "Delay Between Keys (Seconds)",
    Range = {0.1, 5},
    Increment = 0.1,
    Suffix = "s",
    CurrentValue = 0.5,
    Flag = "AutoMovesKeyDelay",
    Callback = function(value)
        delayBetweenKeys = value
    end
})

-- [[{{ Others }}]] --

--// Others Section
local SecOthers  = TabKeys:CreateSection("Others")

--// AutoTS Toggle
TabKeys:CreateToggle({
    Name = "Auto TimeStop (Require StopSign)",
    CurrentValue = false,
    Flag = "PressH",
    Callback = function(state)
        autoPressHEnabled = state

        if autoPressHConnection then
            autoPressHConnection:Disconnect()
            autoPressHConnection = nil
        end

        if not autoPressHEnabled then return end

        autoPressHConnection = RunService.Heartbeat:Connect(function()
            if not autoPressHEnabled then return end

            -- Verifica se algum teleport está ativo
            local isAnyTPActive = LivingTeleportActive or HollowsTPActive or CurseTPActive or OthersTPActive
            if not isAnyTPActive then return end

            local char = LP.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            local target = _G.CurrentTPTarget
            if not target or not target:FindFirstChild("HumanoidRootPart") then return end

            local distance = (hrp.Position - target.HumanoidRootPart.Position).Magnitude
            local DISTANCE_THRESHOLD = 15
            if distance > DISTANCE_THRESHOLD then return end

            local PRESS_DELAY = 7
            local now = os.clock()
            if now - lastPressH < PRESS_DELAY then return end
            lastPressH = now

            pressHRemote()
        end)
    end
})

--// Auto Block Toggle
TabKeys:CreateToggle({
    Name = "Auto Block",
    CurrentValue = false,
    Flag = "AutoBlock",
    Callback = function(state)
        autoBlockEnabled = state

        if autoBlockConnection then
            autoBlockConnection:Disconnect()
            autoBlockConnection = nil
        end

        if autoBlockEnabled then
            autoBlockConnection = RunService.Heartbeat:Connect(function()
                local char = LP.Character
                if not char then return end
                local data = getPlayerData(char)
                if not data then return end

                -- Solta se BlockBar diminuiu
                if lastBlockBar and data.blockBar.Value < lastBlockBar and holdingBlock then
                    releaseBlock()
                end
                lastBlockBar = data.blockBar.Value

                -- Segura se BlockBar >= 30
                if data.blockBar.Value >= 30 and not holdingBlock then
                    pressBlock()
                end
            end)
        else
            releaseBlock()
        end
    end
})

--// Auto Parry Toggle
TabKeys:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Flag = "AutoParry",
    Callback = function(state)
        autoParryEnabled = state

        if autoParryConnection then
            autoParryConnection:Disconnect()
            autoParryConnection = nil
        end

        if autoParryEnabled then
            autoParryConnection = RunService.Heartbeat:Connect(function()
                local char = LP.Character
                if not char then return end
                local data = getPlayerData(char)
                if not data then return end

                if lastBlockBar and data.blockBar.Value < lastBlockBar and holdingBlock then
                    releaseBlock()
                end
                lastBlockBar = data.blockBar.Value

                if not data.parryCD and (not data.blocking or data.blocking.Value == false) and not holdingBlock then
                    pressBlock()
                end
            end)
        else
            releaseBlock()
        end
    end
})

LP.CharacterAdded:Connect(function(char)
    lastBlockBar = nil
end)

--====== (([[{{ LOCAL PLAYER }}]])) ======--

--// Local Player Section
local SecMovement = TabLP:CreateSection("Local Player")

--// Walkspeed Slider
TabLP:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 16,
    Flag = "Walkspeed",
    Callback = function(value)
        defaultWalkSpeed = value
    end
})

task.spawn(function()
    while true do
        task.wait(0)
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            if defaultWalkSpeed > 16 and LP.Character.Humanoid.WalkSpeed ~= defaultWalkSpeed then
                LP.Character.Humanoid.WalkSpeed = defaultWalkSpeed
            end
        end
    end
end)

--// Jumppower Slider
TabLP:CreateSlider({
    Name = "Jumppower",
    Range = {50, 500},
    Increment = 1,
    CurrentValue = 50,
    Flag = "Jumppower",
    Callback = function(value)
        defaultJumpPower = value
    end
})

task.spawn(function()
    while true do
        task.wait(0)
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            if defaultJumpPower > 50 and LP.Character.Humanoid.JumpPower ~= defaultJumpPower then
                LP.Character.Humanoid.JumpPower = defaultJumpPower
            end
        end
    end
end)

--// Anti-AFK Button
TabLP:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        if antiAFKConnection then return end

        local VirtualUser = game:GetService("VirtualUser")
        antiAFKConnection = LP.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
})

--// Server Hop Button
TabLP:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
        for _, v in ipairs(servers) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
                break
            end
        end
    end
})

--====== (([[{{ EXTRAS }}]])) ======--

-- [[{{ ESP }}]] --

--// ESP Section
local SecESP = TabMisc:CreateSection("ESP")

--// ESP Toggles
TabMisc:CreateToggle({
    Name = "Box",
    CurrentValue = false,
    Flag = "ESP_Box",
    Callback = function(state)
        ESP_BOX = state
    end
})

TabMisc:CreateToggle({
    Name = "Tracer",
    CurrentValue = false,
    Flag = "ESP_Tracer",
    Callback = function(state)
        ESP_TRACER = state
    end
})

TabMisc:CreateToggle({
    Name = "Name",
    CurrentValue = false,
    Flag = "ESP_Name",
    Callback = function(state)
        ESP_NAME = state
    end
})

TabMisc:CreateToggle({
    Name = "Distance",
    CurrentValue = false,
    Flag = "ESP_Distance",
    Callback = function(state)
        ESP_DISTANCE = state
    end
})

--// ESP Color Picker
TabMisc:CreateColorPicker({
    Name = "ESP Color",
    Color = espColor or Color3.fromRGB(255, 0, 0),
    Flag = "ESP_Color",
    Callback = function(color)
        espColor = color
    end
})
--// SCRIPTS EXTRAS BUTTONS

--// Extras Scripts Section
local SecScripts  = TabMisc:CreateSection("External Scripts")

TabMisc:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-nameless-admin-15646"))()
    end
})

TabMisc:CreateButton({
    Name = "TurtleSpy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/Turtle%20Spy.lua"))()
    end
})

TabMisc:CreateButton({
    Name = "RemoteSpy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end
})

TabMisc:CreateButton({
    Name = "DEX Explorer Upgraded",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/DexPlusBackup.luau"))()
    end
})

-- [[{{ LIGHTING }}]] --

--// Lighting Section
local SecLighting  = TabMisc:CreateSection("Lighting")

--// Lighting Technology Dropdown
TabMisc:CreateDropdown({
    Name = "Lighting Technology",
    Options = technologyList,
    CurrentOption = nil, -- Nenhum selecionado inicialmente
    MultiSelect = false, -- Garantir que só um valor seja selecionado
    Flag = "Lighting_Technology",
    Callback = function(selected)
        -- Se o Rayfield estiver retornando uma tabela, pega o primeiro valor
        if type(selected) == "table" then
            selected = selected[1]
        end

        if not selected or selected == "" then return end

        local lighting = game:GetService("Lighting")
        if lighting and Enum.Technology[selected] then
            lighting.Technology = Enum.Technology[selected]
        end
    end
})

--// Remove Blur Button
TabMisc:CreateButton({
    Name = "Remover Blur",
    Callback = function()
        local blur = game:GetService("Lighting")
        local count = 0
        
        for _, v in ipairs(blur:GetDescendants()) do
            if string.find(string.lower(v.Name), "blur") or v:IsA("BlurEffect") then
                v:Destroy()
                count = count + 1
            end
        end
        
        print("Success: " .. count .. " Blur effects were deleted.")
    end
})

--// Remove Every Effect Button
TabMisc:CreateButton({
    Name = "Remover Every Effect",
    Callback = function()
        game.Lighting:ClearAllChildren()
    end
})

--====== (([[{{ EVENT }}]])) ======--

--// Event Section
local SecEvent  = TabEvent:CreateSection("BloodStone Event")

--// Open BloodStone Shop
TabEvent:CreateButton({
    Name = "Open BloodStone Shop",
    Callback = function()
        local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        local shop = playerGui:FindFirstChild("OrnamentShop")
        if shop then
            shop.Enabled = not shop.Enabled
        end
    end
})

--// Exchange BloodStone
local exchangeRemote = game:GetService("ReplicatedStorage"):WaitForChild("ABCRemotes"):WaitForChild("Exchange")
TabEvent:CreateButton({
    Name = "Exchange BloodStone",
    Callback = function()
        local args = {true}
        exchangeRemote:FireServer(unpack(args))
    end
})

--// Auto Exchange BloodStone
TabEvent:CreateToggle({
    Name = "Auto Exchange BloodStone",
    CurrentValue = false,
    Flag = "AutoExchangeBloodStone",
    Callback = function(state)
        autoExchangeEnabled = state

        if autoExchangeThread then
            autoExchangeEnabled = false
            task.wait()
            autoExchangeThread = nil
        end

        if autoExchangeEnabled then
            autoExchangeThread = task.spawn(function()
                while autoExchangeEnabled do
                    local success, err = pcall(function()
                        exchangeRemote:FireServer(true)
                    end)
                    task.wait(1)
                end
                autoExchangeThread = nil
            end)
        end
    end
})

-- [[{{ Boss }}]] --

--// Q3Boss Section
local SecQ3Boss  = TabEvent:CreateSection("Q3Boss")

--// TP Q3Boss
TabEvent:CreateToggle({
    Name = "TP Q3Boss",
    CurrentValue = false,
    Flag = "TPQ3Boss",
    Callback = function(state)
        Q3BossTPActive = state
        local RunService = game:GetService("RunService")
        local player = game.Players.LocalPlayer
        local storedCollisionState = {}

        if Q3BossTeleportConnection then
            Q3BossTeleportConnection:Disconnect()
            Q3BossTeleportConnection = nil
        end

        if state then
            Q3BossTeleportConnection = RunService.Heartbeat:Connect(function()
                if not Q3BossTPActive or _G.ItemFarmPriority then return end

                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local targetNPC = workspace:FindFirstChild("Living") and workspace.Living:FindFirstChild("Q3Boss")
                if not targetNPC then return end
                _G.CurrentTPTarget = targetNPC

                local targetHRP = targetNPC:FindFirstChild("HumanoidRootPart")
                if not targetHRP then return end

                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and storedCollisionState[part] == nil then
                        storedCollisionState[part] = part.CanCollide
                        part.CanCollide = false
                    end
                end

                hrp.AssemblyLinearVelocity = Vector3.zero
                local offset = -targetHRP.CFrame.LookVector * 7.5
                hrp.CFrame = targetHRP.CFrame + offset
            end)
        else
            _G.CurrentTPTarget = nil
            local char = player.Character
            if char then
                for part, oldState in pairs(storedCollisionState) do
                    if part and part.Parent then part.CanCollide = oldState end
                end
            end
            storedCollisionState = {}
        end
    end
})

--// AutoSpawn Q3Boss
TabEvent:CreateToggle({
    Name = "AutoSpawn Q3Boss",
    CurrentValue = false,
    Flag = "AutoSpawnQ3Boss",
    Callback = function(state)
        SpawnMeatActive = state
        local RunService = game:GetService("RunService")

        if spawnMeatConnection then
            spawnMeatConnection:Disconnect()
            spawnMeatConnection = nil
        end

        if not SpawnMeatActive then return end

        spawnMeatConnection = RunService.Heartbeat:Connect(function()
            if not SpawnMeatActive then return end

            local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            local q3BossExists = workspace:FindFirstChild("Living") 
                                 and workspace.Living:FindFirstChild("Q3Boss")
            if q3BossExists then
                local humanoid = LP.Character:FindFirstChild("Humanoid")
                if humanoid then humanoid:UnequipTools() end
                return
            end

            local backpack = LP:FindFirstChild("Backpack")
            local meat = backpack and backpack:FindFirstChild("Ultra Premium BBQ Meat")
            if not meat then
                SpawnMeatActive = false
                if spawnMeatConnection then spawnMeatConnection:Disconnect() spawnMeatConnection = nil end
                return
            end

            local humanoid = LP.Character:FindFirstChild("Humanoid")
            if humanoid then humanoid:EquipTool(meat) end

            local spawnCFrame = workspace:FindFirstChild("Map") 
                               and workspace.Map:FindFirstChild("RuinedCity") 
                               and workspace.Map.RuinedCity:FindFirstChild("Spawn") 
                               and workspace.Map.RuinedCity.Spawn.CFrame
            if spawnCFrame then hrp.CFrame = spawnCFrame end

            local spawn = workspace.Map.RuinedCity:FindFirstChild("Spawn")
            if spawn then
                for _, prompt in ipairs(spawn:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        activatePrompt(prompt)
                    end
                end
            end
        end)
    end
})

--// AutoFarm Q3Boss
TabEvent:CreateToggle({
    Name = "AutoFarm Q3Boss",
    CurrentValue = false,
    Flag = "AutoFarmQ3Boss",
    Callback = function(state)
        Q3BossFarmEnabled = state
        local RunService = game:GetService("RunService")

        if Q3BossFarmConnection then
            Q3BossFarmConnection:Disconnect()
            Q3BossFarmConnection = nil
        end
        if Q3BossHPressConnection then
            Q3BossHPressConnection:Disconnect()
            Q3BossHPressConnection = nil
        end
        if Q3BossAutokillConnection then
            Q3BossAutokillConnection:Disconnect()
            Q3BossAutokillConnection = nil
        end

        if not Q3BossFarmEnabled then return end

        Q3BossFarmConnection = RunService.Heartbeat:Connect(function()
            if not Q3BossFarmEnabled then return end

            local char = LP.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            local q3Boss = workspace:FindFirstChild("Living") and workspace.Living:FindFirstChild("Q3Boss")
            if not q3Boss or not q3Boss:FindFirstChild("HumanoidRootPart") then return end
            local bossHRP = q3Boss.HumanoidRootPart

            hrp.CFrame = bossHRP.CFrame - bossHRP.CFrame.LookVector * 7.5

            task.wait(20)

            -- Press H constantly
            Q3BossHPressConnection = RunService.Heartbeat:Connect(function()
                if not Q3BossFarmEnabled then return end
                if not q3Boss or not q3Boss.Parent then return end

                local now = os.clock()
                if not Q3BossHPressConnection.lastPress then Q3BossHPressConnection.lastPress = 0 end
                local PRESS_DELAY = 2
                if now - Q3BossHPressConnection.lastPress >= PRESS_DELAY then
                    Q3BossHPressConnection.lastPress = now
                    task.spawn(function()
                        VIM:SendKeyEvent(true, Enum.KeyCode.H, false, game)
                        task.wait(0.1)
                        VIM:SendKeyEvent(false, Enum.KeyCode.H, false, game)
                    end)
                end
            end)

            -- Auto Kill Boss
            Q3BossAutokillConnection = task.spawn(function()
                while Q3BossFarmEnabled and q3Boss and q3Boss.Parent do
                    local humanoid = q3Boss:FindFirstChild("Humanoid")
                    if humanoid then humanoid.Health = 0 end
                    task.wait(0.5)
                end
            end)
        end)
    end
})

--====== (([[{{ INICIALIZATION }}]])) ======--
print("CC Carnation Alpha v0.9 (Halloween) loaded successfully.🎃")
