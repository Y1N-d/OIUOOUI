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
local window = Library.CreateLib("CC Carnation Alpha v0.4", colors)

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

--// Others
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local HRP = nil
local CoreGui = game:GetService("CoreGui")

--// Slider
local defaultWalkSpeed = LP.Character.Humanoid.WalkSpeed
local defaultJumpPower = LP.Character.Humanoid.JumpPower

-- [[ TOGGLES ]] --

--// Main
local autofarmEnabled = false
local autokillEnabled = false
local ignoreChest = false
local autoClickActive = false
local fireMEnabled = false
local fireBreakthroughEnabled = false
local LivingTeleportActive = false
local antiAFKConnection

-- [[ TELEPORTS ]] --

--// TP Delay
local teleportDelay = 0.15
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

-- [[ THREADS ]] --

--// Main
local autoClickThread = nil
local teleportThread = nil

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

-- [[{{ ITEM FARM }}]] --

--// Trigger ItemFarm
local function runItemFarm()
    task.spawn(function()
        while true do
            if autofarmEnabled and HRP then
                local itemFolder = workspace:FindFirstChild("Item")
                if itemFolder then
                    for _, v in ipairs(itemFolder:GetDescendants()) do
                        -- Verifica se ainda deve continuar
                        if not autofarmEnabled or not HRP then break end
                        
                        if v:IsA("BasePart") then
                            -- LÓGICA DE DETECÇÃO MELHORADA:
                            -- Verifica se o nome da parte OU o nome do "Pai" (Model) contém "chest"
                            local partName = v.Name:lower()
                            local parentName = v.Parent and v.Parent.Name:lower() or ""
                            local isChest = partName:find("chest") or parentName:find("chest")

                            -- Só teleporta se: NÃO (queremos ignorar baú E é um baú)
                            if not (ignoreChest and isChest) then
                                HRP.CFrame = CFrame.new(v.Position + Vector3.new(0, 4, 0)) * HRP.CFrame.Rotation
                                task.wait(teleportDelay)
                                
                                local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                                if prompt then activatePrompt(prompt) end
                            end
                        end
                    end
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

                if not tempList[baseName] then
                    tempList[baseName] = {}
                end

                table.insert(tempList[baseName], obj)
            end
        end
    end

    for baseName, objectList in pairs(tempList) do
        for i, obj in ipairs(objectList) do
            local displayName = baseName

            if #objectList > 1 and i > 1 then
                displayName = baseName .. " " .. i
            end

            table.insert(livingNPCNames, displayName)
            livingNPCObjects[displayName] = obj
        end
    end

    table.sort(livingNPCNames, function(a, b)
        return a:lower() < b:lower()
    end)

    if livingNPCDropdown then
        livingNPCDropdown:Refresh(livingNPCNames)
    end
end

--// Player List
local function refreshPlayerList()
    local playerNames = {}

    local livingFolder = workspace:FindFirstChild("Living")
    local playersFolder = livingFolder and livingFolder:FindFirstChild("Players")

    if playersFolder then
        for _, p in ipairs(playersFolder:GetChildren()) do
            if p:FindFirstChild("HumanoidRootPart") then
                table.insert(playerNames, p.Name)
            end
        end
    end
    
    table.sort(playerNames, function(a, b)
        return a:lower() < b:lower()
    end)

    if playerDropdown then
        playerDropdown:Refresh(playerNames)
    end
end

--====== (([[{{ MAIN }}]])) ======--

-- [[{{ AUTO FARM }}]] --

--// Everything Autofarm
SecAutoFarm:NewToggle("Everything Autofarm", "Farms Chest/Box/Ores/Barrel", function(state)
    autofarmEnabled = state
end)

--// Ignore Chest
SecAutoFarm:NewToggle("Ignore Chest", "Farms Box/Ores/Barrel", function(state)
    ignoreChest = state
end)

--// Autokill Entities
SecAutoFarm:NewToggle("AutoKill Entities", "Kill entities around you", function(state)
    autokillEnabled = state
    if state then autokill() end
end)

-- [[{{ LIVING TELEPORT }}]] --

--// Living Teleport
SecLivingTP:NewToggle("Living TP", "Teleport to selected NPC", function(state)
    LivingTeleportActive = state
    local player = game.Players.LocalPlayer
    local storedCollisionState = {}

    if state and not teleportThread then
        
        teleportThread = task.spawn(function()
            while LivingTeleportActive do
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local humanoid = char and char:FindFirstChild("Humanoid")

                if hrp and humanoid and selectedLivingNPC then

                    hrp.AssemblyLinearVelocity = Vector3.zero

                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            if storedCollisionState[part] == nil then
                                storedCollisionState[part] = part.CanCollide
                            end
                            part.CanCollide = false
                        end
                    end

                    local LivingFolder = workspace:FindFirstChild("Living")
                    local target = selectedLivingNPCModel
                    local targetHRP = target and (target:FindFirstChild("HumanoidRootPart") or target:FindFirstChildWhichIsA("BasePart"))

                    if targetHRP then
                        local offset = Vector3.new()
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
                    end
                end

                task.wait()
            end

            local char = player.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")

                for part, oldState in pairs(storedCollisionState) do
                    if part and part:IsDescendantOf(char) then
                        part.CanCollide = oldState
                    end
                end

                storedCollisionState = {}

                if hrp then
                    hrp.CFrame = hrp.CFrame + Vector3.new(0, 5, 0)
                end
            end

            teleportThread = nil
        end)
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

-- [[{{ AUTO HIT }}]] --

--// Auto Hit
SecLivingTP:NewToggle("Auto Hit", "Clicks if NOT hovering a GUI", function(toggleState)
    autoClickActive = toggleState
    if autoClickActive and not autoClickThread then
        autoClickThread = task.spawn(function()
            while autoClickActive do
                local mouseLocation = UIS:GetMouseLocation()
                local guisAtPosition = PlayerGui:GetGuiObjectsAtPosition(mouseLocation.X, mouseLocation.Y)
                
                if #guisAtPosition == 0 then
                    VIM:SendMouseButtonEvent(mouseLocation.X, mouseLocation.Y, 0, true, game, 0)
                    VIM:SendMouseButtonEvent(mouseLocation.X, mouseLocation.Y, 0, false, game, 0)
                end
                task.wait(0.05)
            end
            autoClickThread = nil
        end)
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

--// Teleport to Player
local selectedPLAYER = nil

SecTeleportPLAYER:NewButton("Teleport To Player", "Teleport to selected Player", function()
    if not selectedPLAYER then return end
    
    local livingFolder = workspace:FindFirstChild("Living")
    local playersFolder = livingFolder and livingFolder:FindFirstChild("Players")

    if not playersFolder then return end

    local targetChar = playersFolder:FindFirstChild(selectedPLAYER)
    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then return end

    local localPlayer = game.Players.LocalPlayer
    local char = localPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        hrp.CFrame = targetChar.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    end
end)

--// Player List
playerDropdown = SecTeleportPLAYER:NewDropdown("Player List", "Choose a player to teleport", playerNames, function(selected)
    selectedPLAYER = selected
end)

--// Refresh Player List
SecTeleportPLAYER:NewButton("Refresh Player List", "Reload all players from workspace", function()
    refreshPlayerList()
end)

--====== (([[{{ AUTO }}]])) ======--

-- [[{{ REMOTE }}]] --

local upgRemote = ReplicatedStorage:WaitForChild("GlobalUsedRemotes"):WaitForChild("UpgradeMas")
local brkRemote = ReplicatedStorage:WaitForChild("GlobalUsedRemotes"):WaitForChild("Breakthrough")

--// Auto Mastery
SecMastery:NewToggle("Auto Mastery (Max Level)", "Auto fire mastery upgrade", function(state)
    fireMEnabled = state
end)

--// Auto Breakthrough
SecMastery:NewToggle("Auto Breakthrough (Mastery 15)", "Auto fire breakthrough", function(state)
    fireBreakthroughEnabled = state
end)

-- DATA
task.spawn(function()
    local data = LP:WaitForChild("Data")
    local exp = data:WaitForChild("Exp")
    local mastery = data:WaitForChild("Mastery")
    
    exp.Changed:Connect(function(val)
        if fireMEnabled and val >= 30725 then upgRemote:FireServer() end
    end)
    
    mastery.Changed:Connect(function(val)
        if fireBreakthroughEnabled and val >= 15 then brkRemote:FireServer() end
    end)
end)

--====== (([[{{ EXTRAS }}]])) ======--

-- [[{{ ESP }}]] --

--// Box ESP
SecESP:NewToggle("Box", "Highlight NPC", function(state)
    ESP_BOX = state
end)

--// Tracer ESP
SecESP:NewToggle("Tracer", "Line to NPC", function(state)
    ESP_TRACER = state
end)


--// Name ESP
SecESP:NewToggle("Name", "Show NPC Name", function(state)
    ESP_NAME = state
end)

--// Distance ESP
SecESP:NewToggle("Distance", "Show Distance to NPC", function(state)
    ESP_DISTANCE = state
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

task.spawn(function()
    while true do
        task.wait(0)
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            if defaultWalkSpeed > 16 then
                if LP.Character.Humanoid.WalkSpeed ~= defaultWalkSpeed then
                    LP.Character.Humanoid.WalkSpeed = defaultWalkSpeed
                end
            end
        end
    end
end)

--// Jumppower Slider
SecMovement:NewSlider("Jumppower", "Modifies Player Jump - Set the value to minimum for disabled Modified Jump", 500, 50, function(s)
    defaultJumpPower = s 
end)

task.spawn(function()
    while true do
        task.wait(0)
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            if defaultJumpPower > 50 then
                if LP.Character.Humanoid.JumpPower ~= defaultJumpPower then
                    LP.Character.Humanoid.JumpPower = defaultJumpPower
                end
            end
        end
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
