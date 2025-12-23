---@diagnostic disable: deprecated, undefined-global, lowercase-global

--====== (([[{{ KAVOUI LIB }}]])) ======--
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Y1N-d/OIUOOUI/refs/heads/master/MEDO.lua"))()

--====== (([[{{ KAVOUI APPEARENCE }}]])) ======--

--// CCC UI Color
local colors = {
    SchemeColor = Color3.fromRGB(255, 102, 0),
    Background = Color3.fromRGB(15, 15, 15),
    Header = Color3.fromRGB(25, 25, 25),     
    TextColor = Color3.fromRGB(255, 255, 200),
    ElementColor = Color3.fromRGB(50, 50, 50) 
}

--// CCC HeaderName
local window = Library.CreateLib("CC Carnation OP Alpha OP v0.7", colors)

--====== (([[{{ TABS }}]])) ======--

--// Main
local TabMain = window:NewTab("Main")
local SecAutoFarm = TabMain:NewSection("Auto Farm")
local SecLivingTP = TabMain:NewSection("Living TP / Hit")
local SecGUIOPENER = TabMain:NewSection("Gui Opener")

--// Event
local TabEvent = window:NewTab("Halloween Event")
local SecEvent = TabEvent:NewSection("Bloodstone")

--// Teleports
local TabTeleport = window:NewTab("Teleports")
local SecTeleportNPC = TabTeleport:NewSection("NPCs")
local SecTeleportArea = TabTeleport:NewSection("Areas")
local SecTeleportPLAYER = TabTeleport:NewSection("Players")

--// Auto
local TabAutos = window:NewTab("Autos")
local SecMastery = TabAutos:NewSection("Progression")
local SecQuests = TabAutos:NewSection("Quests")

--// Local Player
local TabLocal = window:NewTab("LocalPlayer")
local SecMovement = TabLocal:NewSection("Movement")

--// EXTRA
local TabMisc = window:NewTab("Extras")
local SecESP = TabMisc:NewSection("ESP")
local SecScripts = TabMisc:NewSection("External Scripts")
local SecLighting = TabMisc:NewSection("Lighting")


--====== (([[{{ TABS }}]])) ======--

--// Essentials
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Camera = workspace.CurrentCamera

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

--// Event
local exchangeRemote = game:GetService("ReplicatedStorage").ABCRemotes.Exchange

local autoPressHEnabled = false
local autoPressHConnection

-- [[ TOGGLES ]] --

--// Main
local autofarmEnabled = false
local autokillEnabled = false
local ignoreChest = false

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

--// Take Damage
local CenterOffset = 6
local UpdateRate = 0.05

--// Sell
local SellEvent = game:GetService("ReplicatedStorage").GlobalUsedRemotes.SellItem
local sellAllEnabled = false
local sellFruitsEnabled = false
local keepBarrel = false

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
local teleportPosition = "Front"
local selectedLivingNPC = nil

-- [[ DROPDOWNS ]] --

--// Auto List
local npcNames = {}
local areaNames = {}
local livingNPCNames = {}
local playerNames = {}


--// Manual List
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

-- [[ THREADS ]] --

--// Otimization
local Threads = {}

local function startThread(name, func)
    if Threads[name] then return end

    Threads[name] = true
    task.spawn(function()
        func()
        Threads[name] = nil
    end)
end

local function stopThread(name)
    Threads[name] = nil
end

local function isThreadRunning(name)
    return Threads[name] ~= nil
end

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
local espConnection

local function isAnyESPEnabled()
    return ESP_BOX or ESP_TRACER or ESP_NAME or ESP_DISTANCE
end

local function startESP()
    if espConnection then return end

    espConnection = RunService.RenderStepped:Connect(function()
        if not ESP_ENABLED then return end
        if not isAnyESPEnabled() then return end
        if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end
        updateESP()
    end)
end

local function stopESP()
    if espConnection then
        espConnection:Disconnect()
        espConnection = nil
    end

    for npc,_ in pairs(NPC_LIST) do
        removeESP(npc)
    end
end

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

-- [[{{ ITEM FARM }}]] --

--// Trigger ItemFarm
local function runItemFarm()
    startThread("ItemFarm", function()
        while autofarmEnabled do
            if not HRP then
                task.wait(0.2)
                continue
            end

            local folders = {
                workspace:FindFirstChild("Item"),
                workspace:FindFirstChild("Item2")
            }

            for _, itemFolder in ipairs(folders) do
                if not autofarmEnabled then break end
                if not itemFolder then continue end

                for _, v in ipairs(itemFolder:GetDescendants()) do
                    if not autofarmEnabled then break end
                    if not v:IsA("BasePart") then continue end

                    local name = v.Name:lower()
                    local parent = v.Parent and v.Parent.Name:lower() or ""
                    local isChest = name:find("chest") or parent:find("chest")

                    if ignoreChest and isChest then continue end

                    HRP.CFrame = CFrame.new(v.Position + Vector3.new(0,4,0))
                    task.wait(teleportDelay)

                    local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                    if prompt then activatePrompt(prompt) end
                end
            end

            task.wait(0.1)
        end
    end)
end

-- [[{{ AUTOKILL }}]] --

--// Trigger AutoKill
local function autokill()
    task.spawn(function()
        while autokillEnabled do
            local entities = workspace:FindFirstChild("Living") and workspace.Living:GetChildren()
            if entities then
                for _, entity in ipairs(entities) do
                    if entity ~= LP.Character and entity:FindFirstChild("Humanoid") then
                        entity.Humanoid.Health = 0
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

-- [[{{ REFRESH }}]] --

--// NPC List
local function refreshNPCList()

    npcNames = {}

    local npcFolder = workspace:FindFirstChild("Map")
        and workspace.Map:FindFirstChild("NPCs")

    if npcFolder then
        for _, npc in ipairs(npcFolder:GetChildren()) do
            if npc:IsA("Model") then
                table.insert(npcNames, npc.Name)
            end
        end
    end

    table.sort(npcNames, function(a, b)
        return a:lower() < b:lower()
    end)

    if npcDropdown then
        npcDropdown:Refresh(npcNames)
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
local function refreshLivingNPCList()
    livingNPCNames = {}
    livingNPCObjects = {}

    local tempList = {}

    local livingFolder = workspace:FindFirstChild("Living")
    if livingFolder then
        for _, obj in ipairs(livingFolder:GetChildren()) do
            if obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) then
                local baseName = obj.Name
                tempList[baseName] = tempList[baseName] or {}
                table.insert(tempList[baseName], obj)
            end
        end
    end

    for baseName, objectList in pairs(tempList) do
        for i = 1, #objectList do
            local displayName = baseName
            if #objectList > 1 and i > 1 then
                displayName = baseName .. " " .. i
            end

            table.insert(livingNPCNames, displayName)

            livingNPCObjects[displayName] = {
                baseName = baseName,
                index = i
            }
        end
    end

    table.sort(livingNPCNames, function(a, b)
        return a:lower() < b:lower()
    end)

    if livingNPCDropdown then
        livingNPCDropdown:Refresh(livingNPCNames)
    end
end

local function getLivingNPC(displayName)
    local data = livingNPCObjects[displayName]
    if not data then return nil end

    local livingFolder = workspace:FindFirstChild("Living")
    if not livingFolder then return nil end

    local count = 0
    for _, obj in ipairs(livingFolder:GetChildren()) do
        if obj:IsA("Model") and obj.Name == data.baseName then
            count += 1
            if count == data.index then
                return obj
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

--====== (([[{{ MAIN }}]])) ======--

-- [[{{ AUTO FARM }}]] --

--// Everything Autofarm
SecAutoFarm:NewToggle("Everything Autofarm", "Farms Chest/Box/Ores/Barrel", function(state)
    autofarmEnabled = state
    if state then
        runItemFarm()
    end
end)

--// Ignore Chest
SecAutoFarm:NewToggle("Ignore Chest", "Farms Box/Ores/Barrel", function(state)
    ignoreChest = state
end)

--// InstantKill Entities
SecAutoFarm:NewToggle("InstantKill Entities (Use TimeStop)", "Kill entities around you", function(state)
    autokillEnabled = state
    if state then autokill() end
end)

-- [[{{ LIVING TELEPORT }}]] --

--// Living Teleport
SecLivingTP:NewToggle("Living TP", "Teleport to selected NPC", function(state)
    LivingTeleportActive = state

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer

    local storedCollisionState = {}
    local lastSafeCFrame = nil

    if state then
        if teleportConnection then
            teleportConnection:Disconnect()
            teleportConnection = nil
        end

        teleportConnection = RunService.Heartbeat:Connect(function()
            if not LivingTeleportActive then return end

            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            local target = getLivingNPC(selectedLivingNPC)
            selectedLivingNPCModel = target

            if not target then
                lastSafeCFrame = nil
                return
            end

            local targetHRP =
                target:FindFirstChild("HumanoidRootPart")
                or target:FindFirstChildWhichIsA("BasePart")

            if not targetHRP then
                lastSafeCFrame = nil
                return
            end

            lastSafeCFrame = targetHRP.CFrame

            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    if storedCollisionState[part] == nil then
                        storedCollisionState[part] = part.CanCollide
                    end
                    part.CanCollide = false
                end
            end

            hrp.AssemblyLinearVelocity = Vector3.zero

            local offset = Vector3.zero
            if teleportPosition == "Back" then
                offset = -targetHRP.CFrame.LookVector * 7.5
            elseif teleportPosition == "Front" then
                offset = targetHRP.CFrame.LookVector * 3
            elseif teleportPosition == "Up" then
                offset = Vector3.new(0, 6.9, 0)
            elseif teleportPosition == "Down" then
                offset = Vector3.new(0, -6.7, 0)
            end

            hrp.CFrame = targetHRP.CFrame + offset
        end)

    else
        if teleportConnection then
            teleportConnection:Disconnect()
            teleportConnection = nil
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
        lastSafeCFrame = nil
    end
end)

--// Teleport Position
SecLivingTP:NewDropdown("TP Position", "Where to stay relative to NPC", positionOptions, function(selected)
    teleportPosition = selected
end)

--// Living List
livingNPCDropdown = SecLivingTP:NewDropdown("Living List", "Choose an NPC", livingNPCNames, function(selected)
    selectedLivingNPC = selected
    selectedLivingNPCModel = livingNPCObjects[selected]
end)

--// Refresh Living List
SecLivingTP:NewButton("Refresh Living List", "Update NPCs", function()
    refreshLivingNPCList()
end)

-- [[{{ AUTO M1 }}]] --

--// Auto M1
SecLivingTP:NewToggle("Auto M1", "Keep M1", function(toggleState)
    AutoM1Active = toggleState
    if AutoM1Active and not AutoM1Thread then
        
        local Event = game:GetService("ReplicatedStorage")["ABC - First Priority"].Utility.Modules.Warp.Index.Event.Reliable
        
        AutoM1Thread = task.spawn(function()
            while AutoM1Active do
                
                Event:FireServer(
                    (function(bytes) --[[Type: buffer]]
                        local b = buffer.create(#bytes)
                        for i = 1, #bytes do
                            buffer.writeu8(b, i - 1, bytes[i])
                        end
                        return b
                    end)({ 22 }),
                    (function(bytes) --[[Type: buffer]]
                        local b = buffer.create(#bytes)
                        for i = 1, #bytes do
                            buffer.writeu8(b, i - 1, bytes[i])
                        end
                        return b
                    end)({ 254, 1, 0, 6, 3, 76, 77, 66 })
                )

                task.wait(0.05)
            end
            
            AutoM1Thread = nil
        end)
    end
end)

SecLivingTP:NewToggle("Press H", "Auto press H when teleporting", function(state)
    autoPressHEnabled = state
    
    if state then
        if autoPressHConnection then autoPressHConnection:Disconnect() end
        
        autoPressHConnection = RunService.Heartbeat:Connect(function()
            if not autoPressHEnabled then return end
            
            if LivingTeleportActive 
            and selectedLivingNPCModel 
            and selectedLivingNPCModel.Parent 
            then
                -- simula o clique da tecla H
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.H, false, game)
                task.wait(0.05)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.H, false, game)
            end
        end)

    else
        if autoPressHConnection then
            autoPressHConnection:Disconnect()
            autoPressHConnection = nil
        end
    end
end)

-- [[{{ GUI OPENER }}]] --

--// Open Stand Storage
SecGUIOPENER:NewButton("Open Stand Storage", "Toggle UI", function()
    PlayerGui.StandStorage.Enabled = not PlayerGui.StandStorage.Enabled
end)

--// Open Shop
SecGUIOPENER:NewButton("Open Shop", "Toggle UI", function()
    local shop = PlayerGui:FindFirstChild("ShopGUI") and PlayerGui.ShopGUI:FindFirstChild("Outer")
    if not shop then return end
    local openPos = UDim2.new(0.5, 0, 0.85, 0)
    local closedPos = UDim2.new(0.5, 0, 1.8, 0)
    if shop.Position == openPos then
        shop.Position = closedPos
    else
        shop.Position = openPos
    end
end)

--// Open Seller
SecGUIOPENER:NewButton("Open Seller", "Toggle UI", function()
    PlayerGui.SellGUI.Enabled = not PlayerGui.SellGUI.Enabled
end)


--====== (([[{{ TELEPORTS }}]])) ======--

-- [[{{ NPCS TP }}]] --

--// Teleport to NPC
local selectedNPC = nil

SecTeleportNPC:NewButton("Teleport To NPC", "Teleport to selected NPC", function()
    if not selectedNPC then return end
    
    local npcFolder = workspace:FindFirstChild("Map")
        and workspace.Map:FindFirstChild("NPCs")

    if not npcFolder then return end

    local npc = npcFolder:FindFirstChild(selectedNPC)
    if not npc or not npc:FindFirstChild("HumanoidRootPart") then return end

    local player = game.Players.LocalPlayer
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = npc.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
end)

--// NPC List
npcDropdown = SecTeleportNPC:NewDropdown("NPC List", "Choose an NPC to teleport", npcNames, function(selected)
    selectedNPC = selected
end)

--// Refresh NPC list
SecTeleportNPC:NewButton("Refresh NPC List", "Reload all NPCs from workspace", function()
    refreshNPCList()
end)

-- [[{{ AREA TP }}]] --

--// Teleport to Area
local selectedArea = nil

SecTeleportArea:NewButton("Teleport To Area", "Teleport to selected area", function()
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

    hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
end)

--// Area List
areaDropdown = SecTeleportArea:NewDropdown("Area List", "Choose an area to teleport", areaNames, function(selected)
    selectedArea = selected
end)

--// Refresh Area List
SecTeleportArea:NewButton("Refresh Area List", "Reload all areas from workspace", function()
    refreshAreaList()
end)


-- [[{{ PLAYER TP }}]] --

--// Player  LoopTP
SecTeleportPLAYER:NewToggle("PlayerLoop TP", "Teleport loop to selected player", function(state)
     PlayerLoopActive = state
    local player = game.Players.LocalPlayer
    local storedCollisionState = {}

    if state and not playerLoopThread then
        playerLoopThread = task.spawn(function()

            while PlayerLoopActive do
                task.wait()

                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                if not hrp then
                    continue
                end

                if not selectedPlayerLoopModel then
                    continue
                end

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
                if not targetHRP then 
                    continue 
                end


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
                    offset = -targetHRP.CFrame.LookVector * 6
                elseif playerLoopPosition == "BackCloser" then 
                    offset = -targetHRP.CFrame.LookVector * 6.6
                elseif playerLoopPosition == "Down" then
                    offset = Vector3.new(0, -6, 0)
                end

                hrp.CFrame = CFrame.new(
                    targetHRP.Position + offset,
                    targetHRP.Position
                )
            end

            -- restaurar colisão
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
end)

--// Teleport to Player
SecTeleportPLAYER:NewButton("Teleport To Player", "Teleport to selected Player", function()
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

    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then return end

    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        hrp.CFrame = targetChar.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    end
end)

local PlayerLoopPosDropdown = SecTeleportPLAYER:NewDropdown("PlayerLoop Position", "Teleport position", LoopPositions, function(pos)
    playerLoopPosition = pos
end)

--// Player List
playerDropdown = SecTeleportPLAYER:NewDropdown("Player List", "Choose a player to teleport", playerNames, function(selected)
    selectedPlayerLoop = selected

    local livingFolder = workspace:FindFirstChild("Living")
    if livingFolder then
        for _, obj in ipairs(livingFolder:GetChildren()) do
            if obj.Name == selectedPlayerLoop then
                selectedPlayerLoopModel = obj
                break
            end
        end
    end
end)
--// Refresh Player List
SecTeleportPLAYER:NewButton("Refresh Player List", "Reload all players from workspace", function()
    refreshPlayerList()
end)

--====== (([[{{ AUTO }}]])) ======--

-- [[{{ REMOTE }}]] --

--// Auto Mastery
SecMastery:NewToggle("Auto Mastery (Max Level)", "Auto mastery upgrade", function(state)
    fireMEnabled = state
    if state and exp.Value >= 30725 then
        upgRemote:FireServer()
    end
end)


--// Auto Breakthrough
SecMastery:NewToggle("Auto Breakthrough (Mastery 15)", "Auto breakthrough", function(state)
    fireBreakthroughEnabled = state
    if state and mastery.Value >= 15 then
        brkRemote:FireServer()
    end
end)


-- EXP LISTENER
exp.Changed:Connect(function(v)
    if fireMEnabled and v >= 30725 then
        upgRemote:FireServer()
    end
end)


-- MASTERY LISTENER
mastery.Changed:Connect(function(v)
    if fireBreakthroughEnabled and v >= 15 then
        brkRemote:FireServer()
    end
end)

-- [[ SEPARATOR ]] --
SecMastery:NewLabel("Auto Sell")

--// SellItems
SecMastery:NewToggle("Sell All", "Sell all items except fruits", function(state)
    sellAllEnabled = state

    task.spawn(function()
        while sellAllEnabled do
            for i = 1, #sellableItems - 3 do
                if not sellAllEnabled then break end
                if sellableItems[i] ~= "Barrel" or not keepBarrel then
                    SellEvent:FireServer(sellableItems[i])
                end
                task.wait(0.1)
            end
            task.wait(0.5)
        end
    end)
end)


SecMastery:NewToggle("Keep Barrel", "Do not sell Barrel while enabled", function(state)
    keepBarrel = state
end)

--// SellFruits
SecMastery:NewToggle("Sell Fruits", "Sell fruits only", function(state)
    sellFruitsEnabled = state

    task.spawn(function()
        while sellFruitsEnabled do
            for i = #sellableItems - 2, #sellableItems do
                if not sellFruitsEnabled then break end
                if sellableItems[i] ~= "Barrel" or not keepBarrel then
                    SellEvent:FireServer(sellableItems[i])
                end
                task.wait(0.1)
            end
            task.wait(1)
        end
    end)
end)

-- [[{{ Quests }}]] --

--/ Take Damage
SecQuests:NewToggle("Take Damage", "Kill entities around you", function(state)

    TakeDamageActive = state

    if TakeDamageActive and not TakeDamageThread then
        TakeDamageThread = task.spawn(function()
            loopTeleportCircle()
            TakeDamageThread = nil
        end)
    end

end)

--====== (([[{{ EXTRAS }}]])) ======--

-- [[{{ ESP }}]] --

--// Box ESP
SecESP:NewToggle("Box", "NPC Box", function(state)
    ESP_BOX = state
    if isAnyESPEnabled() then
        startESP()
    else
        stopESP()
    end
end)

--// Tracer ESP
SecESP:NewToggle("Tracer", "NPC Tracer", function(state)
    ESP_TRACER = state
    if isAnyESPEnabled() then
        startESP()
    else
        stopESP()
    end
end)

--// Name ESP
SecESP:NewToggle("Name", "NPC Name", function(state)
    ESP_NAME = state
    if isAnyESPEnabled() then
        startESP()
    else
        stopESP()
    end
end)

--// Distance ESP
SecESP:NewToggle("Distance", "NPC Distance", function(state)
    ESP_DISTANCE = state
    if isAnyESPEnabled() then
        startESP()
    else
        stopESP()
    end
end)

--// ESP Color
SecESP:NewColorPicker("ESP Color", "Color Info", espColor, function(color)
    espColor = color
end)

-- [[{{ SCRIPTS EXTRAS }}]] --

--// Nameless Admin
SecScripts:NewButton("Nameless Admin", "Load Admin", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-nameless-admin-15646"))()
end)

--// TurtleSpy
SecScripts:NewButton("TurtleSpy", "Loads TurtleSpy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/Turtle%20Spy.lua"))()
end)

--// SimpleSpy
SecScripts:NewButton("RemoteSpy", "Loads RemoteSpy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
end)
--// Dex Explorer Upgraded
SecScripts:NewButton("DEX Explorer Upgraded", "Loads Better DEX", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/DexPlusBackup.luau"))()
end)

-- [[{{ LIGHTING }}]] --

--// Lighting Technology
local techDropdown = SecLighting:NewDropdown("Lighting Technology", "Choose a lighting mode", technologyList, function(selected)

    local lighting = game:GetService("Lighting")
    if not lighting then return end

    pcall(function()
        lighting.Technology = Enum.Technology[selected]
    end)

end)

--// Remove Blur
SecLighting:NewButton("Remover Blur", "Remove todos os efeitos de Blur do jogo", function()
    local blur = game:GetService("Lighting")
    local count = 0
    
    for _, v in ipairs(blur:GetDescendants()) do
        if string.find(string.lower(v.Name), "blur") or v:IsA("BlurEffect") then
            v:Destroy()
            count = count + 1
        end
    end
    
    print("Sucesso: " .. count .. " itens de Blur foram deletados.")
end)

--// Remove Every Effect
SecLighting:NewButton("Remover Every Effect", "Remove todos os efeitos de Blur do jogo", function()
    game.Lighting:ClearAllChildren()
end)

--====== (([[{{ LOCAL PLAYER }}]])) ======--

--// Walkspeed Slider
SecMovement:NewSlider("Walkspeed", "Modifies Player Speed - Set the value to minimum for disabled Modified Speed", 500, 16, function(s)
    defaultWalkSpeed = s 
end)

RunService.Heartbeat:Connect(function()
    local hum = LP.Character and LP.Character:FindFirstChild("Humanoid")
    if not hum then return end

    if defaultWalkSpeed > 16 then
        hum.WalkSpeed = defaultWalkSpeed
    end
end)


--// Jumppower Slider
SecMovement:NewSlider("Jumppower", "Modifies Player Jump - Set the value to minimum for disabled Modified Jump", 500, 50, function(s)
    defaultJumpPower = s 
end)

RunService.Heartbeat:Connect(function()
    local hum = LP.Character and LP.Character:FindFirstChild("Humanoid")
    if not hum then return end

    if defaultJumpPower > 50 then
        hum.JumpPower = defaultJumpPower
    end
end)

--// Anti-AFK
SecMovement:NewButton("Anti-AFK", "Prevents disconnection", function()
    if antiAFKConnection then return end

    local VirtualUser = game:GetService("VirtualUser")

    antiAFKConnection = LP.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

--// Server Hop
SecMovement:NewButton("Server Hop", "Find new server", function()
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
    for _, v in ipairs(servers) do
        if v.playing < v.maxPlayers and v.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
            break
        end
    end
end)

--====== (([[{{ EVENT }}]])) ======--

--// BloodStone Shop
SecEvent:NewButton("Open BloodStone Shop", "Toggle UI", function()
    PlayerGui.OrnamentShop.Enabled = not PlayerGui.OrnamentShop.Enabled
end)

SecEvent:NewButton("Exchange BloodStone", "Exchange Everything", function()
    local args = {
    [1] = true
}

game:GetService("ReplicatedStorage").ABCRemotes.Exchange:FireServer(unpack(args))
end)

SecEvent:NewToggle("Auto Exchange BloodStone", "Automatically exchange BloodStone", function(state)
    autoExchangeEnabled = state

    if state then
        startThread("AutoExchange", function()
            while autoExchangeEnabled do
                pcall(function()
                    exchangeRemote:FireServer(true)
                end)
                task.wait(1)
            end
        end)
    end
end)

--====== (([[{{ WINDOWS TOGGLE }}]])) ======--

--// UI Toggle
TabMisc:NewSection("Credits"):NewKeybind("UI Toggle", "RightShift to Hide/Show", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)

local CAS = game:GetService("ContextActionService")

 CAS:BindAction(
    "ToggleUIBind",
    function(_, state)
        if state == Enum.UserInputState.Begin then
            Library:ToggleUI()
        end
    end,
    true,
    Enum.KeyCode.RightShift)

--====== (([[{{ INICIALIZATION }}]])) ======--
runItemFarm()
refreshNPCList()
refreshAreaList()
refreshLivingNPCList()
refreshPlayerList()
print("CC Carnation OP Alpha v0.7 loaded successfully.✨")
