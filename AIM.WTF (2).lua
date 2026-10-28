-- AIM.WTF v11.8.1 | FREE KEY + COPY / PROFILE UI / UNIVERSAL + MM2 / MOVING CONSTELLATIONS
-- Client visuals and game-specific assist features; not guaranteed server-authoritative.
local diagGui, diagText
local function showDiag(msg, bad)
    pcall(function()
        if not diagGui or not diagGui.Parent then
            local pg = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 10)
            if not pg then return end
            diagGui = Instance.new("ScreenGui")
            diagGui.Name = "AIM_WTF_Diagnostics"
            diagGui.ResetOnSpawn = false
            diagGui.DisplayOrder = 1000
            diagGui.Parent = pg
            diagText = Instance.new("TextLabel")
            diagText.Size = UDim2.new(0, math.max(240, math.min(540, (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X or 720) - 24)), 0, 100)
            diagText.AnchorPoint = Vector2.new(0.5,0)
            diagText.Position = UDim2.new(0.5, 0, 0, 45)
            diagText.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            diagText.BackgroundTransparency = 0.06
            diagText.ZIndex = 5
            diagText.BorderSizePixel = 0
            diagText.TextWrapped = true
            diagText.TextXAlignment = Enum.TextXAlignment.Left
            diagText.TextYAlignment = Enum.TextYAlignment.Top
            diagText.TextSize = 16
            diagText.Font = Enum.Font.Code
            diagText.Parent = diagGui
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(230,230,230)
            stroke.Transparency = 0.58
            stroke.Parent = diagText
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0,8)
            corner.Parent = diagText
        end
        diagText.TextColor3 = bad and Color3.fromRGB(255, 115, 115) or Color3.fromRGB(240, 240, 240)
        diagText.Text = tostring(msg):sub(1, 850)
    end)
end
showDiag("AIM.WTF: Loading the redesigned menu...", false)
local ok, failure = xpcall(function()
local __aimV9 = {} -- Shared references keep this function below Luau local limits.
-- AIM.WTF v9 MONO | PC + MOBILE | client-side Roblox LocalScript
-- Place in StarterPlayer > StarterPlayerScripts
-- 25 demo keys: AIM-XXXX-XXXX-XXXX (edit VALID_KEYS below)
-- PC: Right Shift hides menu. Mobile: AIM.WTF launcher, touch tabs and quick AIM.
-- Visuals are local; shot/hit authorization is owned by each Roblox game.
-- Gameplay changes are client-side unless your own server scripts explicitly support them.
-- Local client-side keys are demo UI access only; they are not secure licensing.
-- Arm/catch hitbox resizing is local; remote games control authoritative catches.
-- Universal client-side overlays work with ordinary Roblox character rigs/Tools.
-- Visual tracers represent ACTIVATION or locally observed projectiles; they do
-- NOT assert that a server accepted any shot. Gun mechanics remain game-specific.
-- Authoritative changes to fire rate, damage, ammo, recoil and wall penetration
-- only work with a compatible server-side gun script in your own experience.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local ContentProvider = game:GetService("ContentProvider")
__aimV9.Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Settings survive unloading/reopening in this client. With an available
-- readfile/writefile API they also survive restarts. Roblox LocalScripts
-- cannot write local files themselves: use a server DataStore in Studio.
local SETTINGS_FILE = "AIM_WTF_Universal_Settings_v3.json"
__aimV9.settingsHost = _G
pcall(function()
    if type(getgenv) == "function" then __aimV9.settingsHost = getgenv() end
end)
__aimV9.restoredSettings = __aimV9.settingsHost.AIM_WTF_Universal_Settings_v3
if type(__aimV9.restoredSettings) ~= "table" and type(readfile) == "function" then
    pcall(function()
        local decoded = HttpService:JSONDecode(readfile(SETTINGS_FILE))
        if type(decoded) == "table" then __aimV9.restoredSettings = decoded end
    end)
end
if type(__aimV9.restoredSettings) ~= "table" then __aimV9.restoredSettings = {} end
-- Never retain access keys from previous AIM.WTF versions.
__aimV9.restoredSettings.key = nil
__aimV9.restoredSettings.rememberMe = nil

-- This shared free key is public; this LocalScript key gate is a convenience UI,
-- not server-backed authentication or secure licensing.
__aimV9.FREE_KEY = "AIM-FREE-2026-OPEN"
__aimV9.VALID_KEYS = {
    [__aimV9.FREE_KEY] = true,
    ["AIM-RQJZ-SJJ3-TBKP"] = true,
    ["AIM-ZV6L-EKRE-HXD3"] = true,
    ["AIM-7KZP-HD75-2R9E"] = true,
    ["AIM-3GWK-4KDH-TVUS"] = true,
    ["AIM-4LUU-KCRU-E99X"] = true,
    ["AIM-573C-EA9K-5T4F"] = true,
    ["AIM-AB9T-7CY8-FH2U"] = true,
    ["AIM-259V-5C2R-Y86W"] = true,
    ["AIM-45TG-F7LZ-ADXN"] = true,
    ["AIM-KAHC-DAU8-8B52"] = true,
    ["AIM-BDX6-9AT6-B2RP"] = true,
    ["AIM-BQW4-79CR-95VE"] = true,
    ["AIM-Q2HN-2Y7R-J8EZ"] = true,
    ["AIM-C7W5-9U9P-ECYS"] = true,
    ["AIM-9C4S-LXYJ-2XTM"] = true,
    ["AIM-EG6C-4CDZ-QT3Q"] = true,
    ["AIM-DD9V-AMJQ-732M"] = true,
    ["AIM-2G92-6FTV-YZUZ"] = true,
    ["AIM-J3NJ-E8PL-W92N"] = true,
    ["AIM-SLZK-D6WX-GHBQ"] = true,
    ["AIM-KVTW-Z5C9-NXEG"] = true,
    ["AIM-D8YW-NXYT-27X6"] = true,
    ["AIM-QT5N-UQQ3-W3ZE"] = true,
    ["AIM-GUAT-PGFD-2YDH"] = true,
    ["AIM-UBHK-HUJU-V72R"] = true,
}

-- Optional background image can be supplied in the Settings tab.
-- Image/sound assets must be accessible to the Roblox experience.
__aimV9.LLORONA_IMAGE_ID = tostring(__aimV9.restoredSettings.imageId or "")
__aimV9.ACCESS_GRANTED_SOUND_ID = tostring(__aimV9.restoredSettings.audioId or "")
__aimV9.imageDisplayMode = __aimV9.restoredSettings.imageMode == "THUMBNAIL" and "THUMBNAIL" or "DIRECT"
-- Keys are required on EVERY execution. Only non-authentication preferences persist.
local alive = true
__aimV9.connections = {}
__aimV9.tweens = {}
__aimV9.trackedHighlights = {}
__aimV9.originalCollisions = {}
__aimV9.originalHumanoid = nil
__aimV9.originalMovement = nil
__aimV9.movingKeys = {}
local state = {ShowSilentFOV = true, SilentAim = false, Tracers = false, BigBullets = false, ContinuousFire = false, NoGunCooldown = false, SeamlessReload = false, NoRecoil = false, WallPenetration = false, GunSeeThrough = false, SkeletonESP = false, ESP = false, Chams = false, Speed = false, Jump = false, Fly = false, Noclip = false, Arms = false, AimAssist = false, StickyAim = false, Triggerbot = false, ShowTriggerFOV = true, Spinbot = false, ChatSpy = false, AdminWatch = false, ThirdPerson = false,
 TeamCheck = true, FacingESP = true, GlossyChams = false, HeadExpander = false, AntiAim = false, GhostDecoy = false, HitSounds = false, TungTung = false, PlayerTrail = false, ActiveHUD = true,
 BloxESP = false, BloxAimbot = false, BloxSilentAim = false, BloxAutoShoot = false, BloxSpinbot = false, Blox3DPreview = true, BloxTeamCheck = true}
-- Game-specific options stay independent of Universal settings.
state.MM2MurdererESP = false
state.MM2SheriffESP = false
state.MM2MurdererChams = false
state.MM2SheriffChams = false
state.MM2Aim = false
state.MM2VisibleOnly = true
__aimV9.selectedGame = __aimV9.restoredSettings.selectedGame == "MM2" and "MM2" or "Universal"
__aimV9.danceAssetId = tostring(__aimV9.restoredSettings.danceAssetId or ""):match("(%d+)") or ""
__aimV9.danceSpeedPercent = math.clamp(tonumber(__aimV9.restoredSettings.danceSpeed) or 100, 50, 200)
__aimV9.MM2 = {
    placeId=142823291, roleRecords={}, visuals={}, target=nil, lastRoleScan=0,
    lastVisualScan=0, lastAimScan=0, aimRoleIndex=1,
    aimRoles={"AUTO", "MURDERER", "SHERIFF / HERO"},
    aimFOV=165, aimSmoothness=70, selectedRole="Unknown",
}
local speedValue, jumpValue, flySpeed = 32, 80, 45
local armSize = 35 -- Requested R6 arm height and catch-part size (studs)
local bulletVisualSize = 0 -- impact bubbles intentionally disabled
local gunFireRate = 8 -- preferred shots/sec for compatible Tools and the demo gun
local gunFireInterval = 1 / gunFireRate -- kept synchronized with the GUI slider
local tracerThickness = 0.035 -- thinner than the old 0.16 stud tracer
local tracerDuration = 1.5 -- seconds before a tracer disappears
local gunOpacityPercent = 65 -- gun becomes 65% transparent when enabled
local gunMaterialIndex = 1 -- 1: original; 8: rainbow; 9: hologram
__aimV9.tracerSourceIndex = 1 -- AUTO / ACTIVATION / PROJECTILE / SHOT SOUND
__aimV9.tracerColors = {"WHITE", "CYAN", "RAINBOW", "PINK"}
__aimV9.tracerColorIndex = 1
__aimV9.tracerSources = {"AUTO", "TOOL EVENTS", "PROJECTILES", "SHOT SOUNDS"}
__aimV9.watchedShotSounds = setmetatable({}, {__mode = "k"})
local aimSmoothness = 8 -- 0 = strongest lock, 30 = gentle assistance
local aimFOV = 145 -- camera assist radius (pixels)
__aimV9.silentAimFOV = 145 -- separate silent-aim target radius (pixels)
local thirdPersonDistance = 10
local cameraFOV = (workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView) or 70
local cameraFovChanged = false
__aimV9.originalCameraFovs = {}
__aimV9.originalCameraSettings = {
    mode = player.CameraMode,
    minZoom = player.CameraMinZoomDistance,
    maxZoom = player.CameraMaxZoomDistance
}
__aimV9.cameraForced = false

local function restoreCameraSettings()
    __aimV9.cameraForced = false
    pcall(function()
        player.CameraMode = __aimV9.originalCameraSettings.mode
        -- Roblox requires MinZoom <= MaxZoom throughout assignments.
        player.CameraMaxZoomDistance = math.max(128, __aimV9.originalCameraSettings.maxZoom)
        player.CameraMinZoomDistance = __aimV9.originalCameraSettings.minZoom
        player.CameraMaxZoomDistance = __aimV9.originalCameraSettings.maxZoom
    end)
    for camera, fov in pairs(__aimV9.originalCameraFovs) do
        if camera and camera.Parent then
            camera.FieldOfView = fov
        end
        __aimV9.originalCameraFovs[camera] = nil
    end
end

local function updateCameraSettings()
    if state.ThirdPerson then
        if player.CameraMode ~= Enum.CameraMode.Classic then
            player.CameraMode = Enum.CameraMode.Classic
        end
        local d = thirdPersonDistance
        if player.CameraMaxZoomDistance ~= d then
            player.CameraMaxZoomDistance = math.max(d,player.CameraMinZoomDistance)
        end
        if player.CameraMinZoomDistance ~= d then
            player.CameraMinZoomDistance = d
        end
        if player.CameraMaxZoomDistance ~= d then
            player.CameraMaxZoomDistance = d
        end
        __aimV9.cameraForced = true
    elseif __aimV9.cameraForced then
        -- Restore when the user switches third person OFF.
        __aimV9.cameraForced = false
        pcall(function()
            player.CameraMode = __aimV9.originalCameraSettings.mode
            player.CameraMaxZoomDistance = math.max(128, __aimV9.originalCameraSettings.maxZoom)
            player.CameraMinZoomDistance = __aimV9.originalCameraSettings.minZoom
            player.CameraMaxZoomDistance = __aimV9.originalCameraSettings.maxZoom
        end)
    end
    local camera = workspace.CurrentCamera
    if camera and cameraFovChanged then
        if __aimV9.originalCameraFovs[camera] == nil then
            __aimV9.originalCameraFovs[camera] = camera.FieldOfView
        end
        if math.abs(camera.FieldOfView - cameraFOV) > 0.01 then
            camera.FieldOfView = cameraFOV
        end
    end
end
__aimV9.espColors = {Color3.fromRGB(255,255,255),Color3.fromRGB(255,65,85),Color3.fromRGB(70,180,255),Color3.fromRGB(70,255,150),Color3.fromRGB(190,100,255), Color3.new(0,0,0), Color3.new(1,1,1)}
local colorIndex = 1
local spinSpeed = 1440
local antiAimDegrees = 145 -- left/right visual facing angle (degrees); no hitbox desync
__aimV9.antiAimJitterSpeed = 45 -- left/right flips per second, limited by frame rate
local ghostDistance = 5
local enemyHeadSize = 3
local menuTransparency = 8
__aimV9.skyboxId = tostring(__aimV9.restoredSettings.skyboxId or ""):match("(%d+)") or ""
__aimV9.clockTimeOverride = tonumber(__aimV9.restoredSettings.clockTimeOverride)
if __aimV9.clockTimeOverride then
    __aimV9.clockTimeOverride = math.clamp(__aimV9.clockTimeOverride, 0, 24)
end
__aimV9.originalClockTime = __aimV9.Lighting.ClockTime
__aimV9.activeSky = nil
__aimV9.createdSky = false
__aimV9.oldSkyFaces = nil
local hitSoundVolume = 50
local hitSoundId = tostring(__aimV9.restoredSettings.hitSoundId or "")
local chamFinishIndex = 1
__aimV9.chamFinishes = {"PLASTIC", "GLOSSY", "GLASS", "NEON"}
__aimV9.lastLocalHitSound = -math.huge
__aimV9.originalHeads = setmetatable({}, {__mode = "k"})
__aimV9.glossyParts = {} -- local, visual-only proxies keyed by remote Player
__aimV9.lastGlossyTick=0
__aimV9.localCostume = nil
__aimV9.savedBodyTransparency = setmetatable({}, {__mode = "k"})
__aimV9.ghostVisuals = nil
local keyMainForTransparency

__aimV9.lockedTarget = nil
__aimV9.lastTriggerAt = -100
__aimV9.triggerTarget = nil
__aimV9.triggerEnteredAt = 0
__aimV9.triggerLastScan = 0
__aimV9.triggerStatus = nil
__aimV9.triggerSmoothness = 75 -- Higher values mean gentler, smoother camera movement.
__aimV9.triggerModeNames = {"AUTO", "MOUSE CLICK", "TOOL", "VIRTUAL INPUT"}
__aimV9.triggerModeIndex = 1
__aimV9.oldAutoRotate = nil
__aimV9.saveQueued = false
__aimV9.MOBILE = {aiming=false, up=false, down=false, menu=nil, quickAim=nil, openButton=nil, controls={}}
-- Performance preferences are captured in named configs and ordinary settings.
-- FPS is always a REQUEST, not a guaranteed rendered frame rate.
__aimV9.perf = {
    lowTexture=false,
    initialLowTexture=__aimV9.restoredSettings.perfLowTexture==true,
    fpsTarget=math.clamp(tonumber(__aimV9.restoredSettings.perfFpsTarget) or 0,0,500),
    fpsStatus="Use Roblox Settings for official FPS caps (up to 240).",
    graphicsStatus="Graphics unchanged.",
    originals=setmetatable({}, {__mode="k"}),
    token=0, fps=0, prevCap=nil, capChanged=false, effectsConnection=nil,
    updateUI=function() end,
}

-- Lightweight player HUD, local walking trail, atmosphere, and rebindable movement.
__aimV9.keybindNames={"Speed","Jump","Fly","Noclip","Arms","Spinbot","AntiAim","GhostDecoy","PlayerTrail"}
__aimV9.keybinds={}
__aimV9.keybindCapture=nil
__aimV9.keybindRefresh=function() end
for _,name in ipairs(__aimV9.keybindNames) do
    local saved=type(__aimV9.restoredSettings.movementKeybinds)=="table"
        and __aimV9.restoredSettings.movementKeybinds[name] or nil
    local key=nil
    if type(saved)=="string" then pcall(function() key=Enum.KeyCode[saved] end) end
    __aimV9.keybinds[name]=(key and key~=Enum.KeyCode.Unknown and
        not table.find({"W","A","S","D","Space","Escape","Return","F2","RightShift"},key.Name))
        and key.Name or "NONE"
end
__aimV9.ambience={
    presets={"ORIGINAL","MIDNIGHT","CYBER PURPLE","BLUE HOUR","WARM SUNSET","FOGGY","CUSTOM RGB"},
    index=math.clamp(math.floor(tonumber(__aimV9.restoredSettings.ambienceIndex) or 1),1,7),
    customR=math.clamp(tonumber(__aimV9.restoredSettings.ambienceCustomR) or 120,0,255),
    customG=math.clamp(tonumber(__aimV9.restoredSettings.ambienceCustomG) or 60,0,255),
    customB=math.clamp(tonumber(__aimV9.restoredSettings.ambienceCustomB) or 210,0,255),
    refresh=function() end,
}
__aimV9.ambience.original={}
for _,prop in ipairs({"Ambient","OutdoorAmbient","FogColor","FogStart","FogEnd",
    "Brightness","ClockTime","ExposureCompensation","ColorShift_Top","ColorShift_Bottom"}) do
    pcall(function() __aimV9.ambience.original[prop]=__aimV9.Lighting[prop] end)
end

local unload -- mobile panel settings calls this after it is assigned

-- Validate loaded values rather than trusting a stale/corrupt settings file.
if type(__aimV9.restoredSettings.state) == "table" then
    for name, value in pairs(__aimV9.restoredSettings.state) do
        if state[name] ~= nil and type(value) == "boolean" then state[name] = value end
    end
end
-- Disable hidden BloxStrike options from old saved profiles.
for feature in pairs(state) do
    if string.sub(feature, 1, 4) == "Blox" then state[feature] = false end
end
local function savedNumber(name, fallback, low, high)
    local number = tonumber(__aimV9.restoredSettings[name])
    return number and math.clamp(number, low, high) or fallback
end
speedValue = savedNumber("speed", speedValue, 8, 120)
jumpValue = savedNumber("jump", jumpValue, 30, 180)
flySpeed = savedNumber("flySpeed", flySpeed, 10, 180)
armSize = savedNumber("armSize", armSize, 2, 40)
aimSmoothness = savedNumber("aimSmoothness", aimSmoothness, 0, 30)
aimFOV = savedNumber("aimFOV", aimFOV, 60, 350)
__aimV9.triggerFOV = math.floor(savedNumber("triggerFOV", 145, 25, 450))
__aimV9.triggerReactionMs = math.floor(savedNumber("triggerReactionMs", 120, 0, 500))
__aimV9.triggerSmoothness = math.floor(savedNumber("triggerSmoothness", __aimV9.triggerSmoothness, 1, 100))
__aimV9.triggerModeIndex = math.floor(savedNumber("triggerModeIndex", 1, 1, #__aimV9.triggerModeNames))
__aimV9.MM2.aimFOV = math.floor(savedNumber("mm2AimFOV", 165, 40, 420))
__aimV9.MM2.aimSmoothness = math.floor(savedNumber("mm2AimSmoothness", 70, 1, 100))
__aimV9.MM2.aimRoleIndex = math.floor(savedNumber("mm2AimRoleIndex", 1, 1, #__aimV9.MM2.aimRoles))
gunFireRate = math.floor(savedNumber("gunFireRate", gunFireRate, 1, 20))
gunMaterialIndex = math.floor(savedNumber("gunMaterialIndex", gunMaterialIndex, 1, 9))
__aimV9.tracerSourceIndex = math.floor(savedNumber("tracerSourceIndex", 1, 1, 4))
__aimV9.tracerColorIndex = math.floor(savedNumber("tracerColorIndex", 1, 1, 4))
gunFireInterval = 1 / math.max(1, gunFireRate)
-- BloxStrike game IDs are used for game-specific feature gating.
-- Character overlays can work on standard Roblox character rigs; custom guns
-- still decide their own hit, ammo and firing behavior.
__aimV9.blox = {
    placeId = 114234929420007, universeId = 7633926880,
    fov = savedNumber("bloxFOV", 160, 35, 500),
    smooth = savedNumber("bloxSmooth", 65, 1, 100),
    fireRadius = savedNumber("bloxFireRadius", 18, 5, 80),
    spin = savedNumber("bloxSpinSpeed", 1440, 180, 7200),
    previews = {}, lastPreview = 0, lastShot = 0,
    shotMethod = "Waiting for target", lastModel = nil,
}
__aimV9.blox.active = function()
    return false -- BloxStrike HVH removed from this edition
end

__aimV9.silentAimFOV = savedNumber("silentAimFOV", __aimV9.silentAimFOV, 25, 500)
spinSpeed = savedNumber("spinSpeed", spinSpeed, 60, 7200)
thirdPersonDistance = savedNumber("cameraDistance", thirdPersonDistance, 3, 24)
cameraFOV = savedNumber("cameraFOV", cameraFOV, 40, 120)
if __aimV9.restoredSettings.cameraFOV then cameraFovChanged = true end
colorIndex = math.floor(savedNumber("chamsColor", colorIndex, 1, 7))
antiAimDegrees = savedNumber("antiAimDegrees", antiAimDegrees, 20, 180)
__aimV9.antiAimJitterSpeed = savedNumber("antiAimJitterSpeed", __aimV9.antiAimJitterSpeed, 6, 60)
ghostDistance = savedNumber("ghostDistance", ghostDistance, 1, 15)
enemyHeadSize = savedNumber("enemyHeadSize", enemyHeadSize, 2, 9)
menuTransparency = savedNumber("menuTransparency", menuTransparency, 0, 70)
hitSoundVolume = savedNumber("hitSoundVolume", hitSoundVolume, 0, 100)
chamFinishIndex = math.floor(savedNumber("chamFinishIndex", chamFinishIndex, 1, #__aimV9.chamFinishes))

local function settingsSnapshot()
    local states = {}
    for name, value in pairs(state) do states[name] = value end
    return {
        state = states,
        selectedGame = __aimV9.selectedGame,
        perfLowTexture = (__aimV9.perf.lowTexture or __aimV9.perf.initialLowTexture),
        perfFpsTarget = __aimV9.perf.fpsTarget,
        movementKeybinds = table.clone(__aimV9.keybinds),
        ambienceIndex = __aimV9.ambience.index,
        ambienceCustomR = __aimV9.ambience.customR,
        ambienceCustomG = __aimV9.ambience.customG,
        ambienceCustomB = __aimV9.ambience.customB,
        danceAssetId = __aimV9.danceAssetId or "",
        danceSpeed = __aimV9.danceSpeedPercent or 100,
        flingStrength = __aimV9.admin and __aimV9.admin.flingStrength or 145,
        mm2AimFOV = __aimV9.MM2.aimFOV,
        mm2AimSmoothness = __aimV9.MM2.aimSmoothness,
        mm2AimRoleIndex = __aimV9.MM2.aimRoleIndex,
        speed = speedValue, jump = jumpValue, flySpeed = flySpeed,
        armSize = armSize, gunFireRate = gunFireRate, gunMaterialIndex = gunMaterialIndex, tracerSourceIndex = __aimV9.tracerSourceIndex, tracerColorIndex = __aimV9.tracerColorIndex, aimSmoothness = aimSmoothness,
        aimFOV = aimFOV, silentAimFOV = __aimV9.silentAimFOV, spinSpeed = spinSpeed,
        triggerFOV = __aimV9.triggerFOV, triggerReactionMs = __aimV9.triggerReactionMs, triggerSmoothness = __aimV9.triggerSmoothness, triggerModeIndex = __aimV9.triggerModeIndex,
        cameraDistance = thirdPersonDistance, cameraFOV = cameraFOV,
        chamsColor = colorIndex,
        antiAimDegrees = antiAimDegrees, antiAimJitterSpeed = __aimV9.antiAimJitterSpeed, ghostDistance = ghostDistance,
        enemyHeadSize = enemyHeadSize, menuTransparency = menuTransparency,
        hitSoundVolume = hitSoundVolume, hitSoundId = hitSoundId,
        chamFinishIndex = chamFinishIndex,
        imageId = __aimV9.LLORONA_IMAGE_ID, audioId = __aimV9.ACCESS_GRANTED_SOUND_ID,
        imageMode = __aimV9.imageDisplayMode,
        skyboxId = __aimV9.skyboxId,
        clockTimeOverride = __aimV9.clockTimeOverride,
        bloxFOV = __aimV9.blox.fov,
        bloxSmooth = __aimV9.blox.smooth,
        bloxFireRadius = __aimV9.blox.fireRadius,
        bloxSpinSpeed = __aimV9.blox.spin
    }
end
local function saveSettingsNow()
    local snapshot = settingsSnapshot()
    pcall(function() __aimV9.settingsHost.AIM_WTF_Universal_Settings_v3 = snapshot end)
    if type(writefile) == "function" then
        pcall(function() writefile(SETTINGS_FILE, HttpService:JSONEncode(snapshot)) end)
    end
end
-- A one-time overwrite removes any legacy stored key from the settings file.
saveSettingsNow()

local function queueSaveSettings()
    if __aimV9.saveQueued then return end
    __aimV9.saveQueued = true
    task.delay(0.45, function()
        __aimV9.saveQueued = false
        saveSettingsNow()
    end)
end

-- Named profile manager. File API availability depends on the runtime.
-- Ordinary Roblox client LocalScripts cannot read or write local files.
-- Saved profiles never contain the access key.
local PROFILE_FILE = "AIM_WTF_Configs_v1.json"
local profileHostKey = "AIM_WTF_Configs_v1"
local profileDB = {Universal={}, MM2={}}
local function copyJSONSafe(value)
    local ok, encoded = pcall(function() return HttpService:JSONEncode(value) end)
    if not ok then return nil end
    local decodedOK, decoded=pcall(function() return HttpService:JSONDecode(encoded) end)
    return decodedOK and type(decoded)=="table" and decoded or nil
end
local function importProfileDB(value)
    if type(value)~="table" then return end
    for _,mode in ipairs({"Universal","MM2"}) do
        if type(value[mode])=="table" then
            for name, snapshot in pairs(value[mode]) do
                if type(name)=="string" and #name>0 and #name<=24
                    and name:match("^[%w_ %-]+$") and type(snapshot)=="table" then
                    local clean=copyJSONSafe(snapshot)
                    if clean then
                        clean.key=nil
                        clean.rememberMe=nil
                        profileDB[mode][name]=clean
                    end
                end
            end
        end
    end
end
if type(__aimV9.settingsHost[profileHostKey])=="table" then
    importProfileDB(__aimV9.settingsHost[profileHostKey])
elseif type(readfile)=="function" then
    pcall(function() importProfileDB(HttpService:JSONDecode(readfile(PROFILE_FILE))) end)
end
local function persistProfiles()
    __aimV9.settingsHost[profileHostKey]=profileDB
    if type(writefile)=="function" then
        local ok=pcall(function() writefile(PROFILE_FILE,HttpService:JSONEncode(profileDB)) end)
        if ok then return "Saved to profile file + session." end
    end
    return "Saved for this client session only; file persistence unavailable."
end
local function cleanProfileName(value)
    local name=tostring(value or ""):match("^%s*(.-)%s*$")
    if #name<1 or #name>24 or not name:match("^[%w_ %-]+$") then
        return nil,"Use 1-24 letters, numbers, spaces, _ or -."
    end
    return name
end
local profileAPI={selected=nil,status="Ready",onRefresh=function() end}
function profileAPI.names()
    local arr={}
    for name in pairs(profileDB[__aimV9.selectedGame]) do table.insert(arr,name) end
    table.sort(arr)
    return arr
end
function profileAPI.save(rawName, overwrite)
    local name,err=cleanProfileName(rawName)
    if not name then profileAPI.status=err return false end
    local bucket=profileDB[__aimV9.selectedGame]
    if bucket[name] and not overwrite then
        profileAPI.status="Already exists. Use OVERWRITE to replace: "..name
        return false
    end
    if not bucket[name] and #profileAPI.names()>=20 then
        profileAPI.status="Limit: 20 configs per game."
        return false
    end
    local snapshot=settingsSnapshot()
    snapshot.key=nil
    snapshot.rememberMe=nil
    bucket[name]=copyJSONSafe(snapshot)
    profileAPI.selected=name
    profileAPI.status="Config '"..name.."': "..persistProfiles()
    profileAPI.onRefresh()
    return true
end
function profileAPI.rename(rawName)
    local old=profileAPI.selected
    local new,err=cleanProfileName(rawName)
    local bucket=profileDB[__aimV9.selectedGame]
    if not old or not bucket[old] then profileAPI.status="Select a saved config first." return false end
    if not new then profileAPI.status=err return false end
    if new~=old and bucket[new] then profileAPI.status="A config with that name already exists." return false end
    bucket[new]=bucket[old]
    if new~=old then bucket[old]=nil end
    profileAPI.selected=new
    profileAPI.status="Renamed to '"..new.."'. "..persistProfiles()
    profileAPI.onRefresh()
    return true
end
function profileAPI.delete()
    local name=profileAPI.selected
    local bucket=profileDB[__aimV9.selectedGame]
    if not name or not bucket[name] then profileAPI.status="Select a saved config first." return false end
    bucket[name]=nil
    profileAPI.selected=nil
    profileAPI.status="Deleted '"..name.."'. "..persistProfiles()
    profileAPI.onRefresh()
    return true
end
function profileAPI.load()
    local name=profileAPI.selected
    local saved=name and profileDB[__aimV9.selectedGame][name]
    if not saved then profileAPI.status="Select a saved config first." return false end
    local copy=copyJSONSafe(saved)
    if not copy then profileAPI.status="Invalid profile data." return false end
    if not profileAPI.apply then profileAPI.status="Config loader is not ready." return false end
    local ok,err=pcall(function() profileAPI.apply(copy) end)
    profileAPI.status=ok and ("Loaded '"..name.."'. Settings are active.") or ("Load error: "..tostring(err))
    profileAPI.onRefresh()
    return ok
end
__aimV9.profileAPI=profileAPI

__aimV9.chamsModes = {"WHITE", "RED", "BLUE", "GREEN", "PURPLE", "BLACK", "RAINBOW"}
local function isEnemy(other)
    if not other or other == player then return false end
    if not state.TeamCheck and not (
        __aimV9.blox and __aimV9.blox.active() and state.BloxTeamCheck and
        (state.BloxESP or state.BloxAimbot or state.BloxAutoShoot or state.BloxSilentAim)
    ) then return true end
    -- Neutral players (without an assigned team) count as potential opponents.
    if player.Neutral or other.Neutral then return true end
    return other.Team ~= player.Team
end
local function chamsColor()
    if colorIndex == 6 then return Color3.new(0, 0, 0) end
    if colorIndex == 7 then return Color3.fromHSV((os.clock() * 0.18) % 1, 1, 1) end
    return __aimV9.espColors[colorIndex]
end
-- Local environment overrides; all six Skybox faces use one user-provided image ID.
-- Roblox games may replace Lighting/Sky at runtime; this does not affect the server.
local function restoreSkybox()
    local sky = __aimV9.activeSky
    if sky and sky.Parent then
        if __aimV9.createdSky then
            sky:Destroy()
        elseif __aimV9.oldSkyFaces then
            for _, face in ipairs({"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}) do
                pcall(function() sky[face] = __aimV9.oldSkyFaces[face] end)
            end
        end
    end
    __aimV9.activeSky = nil
    __aimV9.createdSky = false
    __aimV9.oldSkyFaces = nil
end

local function applySkybox()
    restoreSkybox()
    if __aimV9.skyboxId == "" then return end
    local sky = __aimV9.Lighting:FindFirstChildOfClass("Sky")
    if not sky then
        sky = Instance.new("Sky")
        sky.Name = "AIM_WTF_Local_Skybox"
        sky.Parent = __aimV9.Lighting
        __aimV9.createdSky = true
    else
        local previous = {}
        for _, face in ipairs({"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}) do
            previous[face] = sky[face]
        end
        __aimV9.oldSkyFaces = previous
    end
    __aimV9.activeSky = sky
    local url = "rbxassetid://" .. __aimV9.skyboxId
    for _, face in ipairs({"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}) do
        sky[face] = url
    end
end

local function applyClientTime()
    if __aimV9.clockTimeOverride ~= nil then
        __aimV9.Lighting.ClockTime = __aimV9.clockTimeOverride
    end
end

-- Convert numeric asset IDs or full rbxassetid:// strings to valid content URLs.
-- Decal asset IDs sometimes refer to a decal wrapper, not the underlying image.
local function assetUrl(raw)
    local id = tostring(raw or ""):match("(%d+)")
    return id and ("rbxassetid://" .. id) or ""
end
local function backgroundAssetUrl(raw)
    local id = tostring(raw or ""):match("(%d+)")
    if not id then return "" end
    if __aimV9.imageDisplayMode == "THUMBNAIL" then
        return "rbxthumb://type=Asset&id=" .. id .. "&w=420&h=420"
    end
    return "rbxassetid://" .. id
end

-- Screen-space skeleton renderer (R6 and R15); runs for each camera frame.
-- Only local UI lines: does not change other players or server hitboxes.
__aimV9.skeletons = {}
local skeletonLayer
local gui -- forward declaration for name tags
__aimV9.skeletonR6 = {
    {"Head", "Torso"}, {"Torso", "Left Arm"}, {"Torso", "Right Arm"},
    {"Torso", "Left Leg"}, {"Torso", "Right Leg"}
}
__aimV9.skeletonR15 = {
    {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"},
    {"LeftLowerArm", "LeftHand"}, {"UpperTorso", "RightUpperArm"},
    {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
    {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"}, {"LowerTorso", "RightUpperLeg"},
    {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}
}
local function clearSkeleton(other)
    local cache = __aimV9.skeletons[other]
    if not cache then return end
    for _, line in ipairs(cache.lines) do line:Destroy() end
    __aimV9.skeletons[other] = nil
end
local function clearAllSkeletons()
    for other in pairs(__aimV9.skeletons) do clearSkeleton(other) end
end
local function buildSkeleton(other, character)
    clearSkeleton(other)
    if not skeletonLayer then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local edges = humanoid.RigType == Enum.HumanoidRigType.R15 and __aimV9.skeletonR15 or __aimV9.skeletonR6
    local cache = {character = character, edges = edges, lines = {}}
    __aimV9.skeletons[other] = cache
    for _ = 1, #edges do
        local line = Instance.new("Frame")
        line.Name = "SkeletonLine"
        line.BorderSizePixel = 0
        line.BackgroundColor3 = Color3.fromRGB(245, 30, 30)
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.Visible = false
        line.ZIndex = 20
        line.Parent = skeletonLayer
        table.insert(cache.lines, line)
    end
end
local function renderSkeletons()
    if not skeletonLayer then return end
    if not state.SkeletonESP then
        for _, cache in pairs(__aimV9.skeletons) do
            for _, line in ipairs(cache.lines) do line.Visible = false end
        end
        return
    end
    local camera = workspace.CurrentCamera
    if not camera then return end
    for _, other in ipairs(Players:GetPlayers()) do
        if isEnemy(other) then
            local char = other.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if not hum or hum.Health <= 0 then
                clearSkeleton(other)
            else
                if not __aimV9.skeletons[other] or __aimV9.skeletons[other].character ~= char then
                    buildSkeleton(other, char)
                end
                local cache = __aimV9.skeletons[other]
                if cache then
                    for i, names in ipairs(cache.edges) do
                        local line = cache.lines[i]
                        local partA = char:FindFirstChild(names[1])
                        local partB = char:FindFirstChild(names[2])
                        line.Visible = false
                        if partA and partB then
                            local a, visibleA = camera:WorldToViewportPoint(partA.Position)
                            local b, visibleB = camera:WorldToViewportPoint(partB.Position)
                            if a.Z > 0 and b.Z > 0 and visibleA and visibleB then
                                local delta = Vector2.new(b.X - a.X, b.Y - a.Y)
                                line.Position = UDim2.fromOffset((a.X+b.X)/2, (a.Y+b.Y)/2)
                                line.Size = UDim2.fromOffset(delta.Magnitude, 2)
                                line.Rotation = math.deg(math.atan2(delta.Y, delta.X))
                                line.BackgroundColor3 = chamsColor()
                                line.Visible = true
                            end
                        end
                    end
                end
            end
        end
    end
    for other in pairs(__aimV9.skeletons) do
        if other.Parent ~= Players then clearSkeleton(other) end
    end
end

-- FF3-STYLE LOCAL ARM/CATCH-HITBOX RESIZER.
-- Inspired by the linked Cons1 Hub's Arm Resize behavior, independently implemented.
-- Resizes R6 arms AND existing football catch sensors, if the game creates them.
-- Client-side resizing cannot force the game's server to accept a catch.
local armUnlocked = false
__aimV9.armOriginalParts = {} -- [BasePart] = {size = Vector3, transparency = number}
__aimV9.armOutlines = {}
__aimV9.armLastUpdate = 0
__aimV9.lastHeadTick=0
__aimV9.armCurrentCharacter = nil
__aimV9.armPartNames = {"Left Arm", "Right Arm", "LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand"}
__aimV9.catchPartNames = {"CatchLeft", "CatchRight", "CatchL", "CatchR"}
__aimV9.watchedAdmins = {} -- Configure usernames manually, if desired.
__aimV9.watchMessages = {}

local function saveArmPart(part)
    if not (part and part:IsA("BasePart")) then return nil end
    local original = __aimV9.armOriginalParts[part]
    if not original then
        original = {size = part.Size, transparency = part.Transparency}
        __aimV9.armOriginalParts[part] = original
    end
    return original
end

local function restoreArmExtender()
    for part, original in pairs(__aimV9.armOriginalParts) do
        if part and part.Parent then
            pcall(function()
                part.Size = original.size
                part.Transparency = original.transparency
            end)
        end
        __aimV9.armOriginalParts[part] = nil
    end
    for arm, outline in pairs(__aimV9.armOutlines) do
        if outline and outline.Parent then outline:Destroy() end
        __aimV9.armOutlines[arm] = nil
    end
    __aimV9.armCurrentCharacter = nil
end

local function updateArmExtender()
    if not armUnlocked or not state.Arms then
        restoreArmExtender()
        return
    end
    local character = player.Character
    if not character then return end
    if __aimV9.armCurrentCharacter ~= character then
        restoreArmExtender()
        __aimV9.armCurrentCharacter = character
    end

    -- User-provided R6 resizer (integrated with the Hub toggle).
    -- Preserve native width/depth and set the arm height to armSize.
    for _, name in ipairs({"Left Arm", "Right Arm"}) do
        local arm = character:FindFirstChild(name)
        if arm and arm:IsA("BasePart") then
            saveArmPart(arm)
            arm.Size = Vector3.new(arm.Size.X, armSize, arm.Size.Z)
            arm.Transparency = 0.4

            local outline = arm:FindFirstChild("ArmOutline")
            if not outline then
                outline = Instance.new("Highlight")
                outline.Name = "ArmOutline"
                outline.Adornee = arm
                outline.Parent = arm
            end
            outline.FillTransparency = 1
            outline.OutlineTransparency = 0
            outline.OutlineColor = Color3.fromRGB(0, 153, 255)
            __aimV9.armOutlines[arm] = outline
        end
    end

    for _, name in ipairs({"CatchLeft", "CatchRight", "CatchL", "CatchR"}) do
        local catchPart = character:FindFirstChild(name)
        if catchPart and catchPart:IsA("BasePart") then
            saveArmPart(catchPart)
            catchPart.Size = Vector3.new(armSize, armSize, armSize)
        end
    end
end

-- GUNS: visuals for equipped Tools; real rate, ammo and wall hits require
-- the companion AIM_WTF_GunServer.lua in YOUR Roblox Studio game.
__aimV9.gunRemote = ReplicatedStorage:FindFirstChild("BlackStarGunFire")
__aimV9.gunFXRemote = ReplicatedStorage:FindFirstChild("BlackStarGunFX")
__aimV9.gunFXRemoteBound = nil
__aimV9.watchedTools = setmetatable({}, {__mode = "k"})
__aimV9.gunPartOriginals = setmetatable({}, {__mode = "k"})
__aimV9.firingHeld = false
__aimV9.lastGunShot = -math.huge
__aimV9.lastContinuousShot = -math.huge
__aimV9.lastGunAppearanceUpdate = 0
__aimV9.gunConnections = {}
__aimV9.gunStatusLabel = nil
__aimV9.lastLocalTracer = -math.huge
__aimV9.lastVisualTool = nil
__aimV9.shotEvents = 0
__aimV9.projectileEvents = 0
__aimV9.espBadges = {} -- [Player] = BillboardGui, removed on death/disable
__aimV9.universalTrailObjects = setmetatable({}, {__mode = "k"})
__aimV9.MAX_LOCAL_TRACER_DISTANCE = 450
local main -- forward declaration: the login frame is constructed below

__aimV9.gunMaterials = {
    {label = "ORIGINAL", material = nil},
    {label = "METAL", material = Enum.Material.Metal},
    {label = "NEON", material = Enum.Material.Neon},
    {label = "GLASS", material = Enum.Material.Glass},
    {label = "WOOD", material = Enum.Material.Wood},
    {label = "DIAMOND PLATE", material = Enum.Material.DiamondPlate},
    {label = "PLASTIC", material = Enum.Material.SmoothPlastic},
    {label = "RAINBOW", material = Enum.Material.Neon},
    {label = "HOLOGRAM", material = Enum.Material.ForceField},
}

local function gunStatus(message)
    if __aimV9.gunStatusLabel and __aimV9.gunStatusLabel.Parent then
        __aimV9.gunStatusLabel.Text = message
    end
end

local function activeTool()
    local character = player.Character
    return character and character:FindFirstChildOfClass("Tool")
end

-- Gun finishes are a locally displayed appearance change, never a damage/reload modification.
-- For first-person games, also discover potential VIEWMODEL parts under CurrentCamera.
__aimV9.getGunVisualParts = function()
    local objects, found = {}, {}
    local function addParts(container)
        if not container then return end
        for _, descendant in ipairs(container:GetDescendants()) do
            if descendant:IsA("BasePart") and not found[descendant] then
                found[descendant] = true
                table.insert(objects, descendant)
                if #objects >= 120 then return end
            end
        end
    end
    addParts(activeTool())
    local camera = workspace.CurrentCamera
    if camera then
        for _, child in ipairs(camera:GetChildren()) do
            if child:IsA("Model") or child:IsA("Folder") then
                local title = child.Name:lower()
                if title:find("viewmodel",1,true) or title:find("weapon",1,true)
                    or title:find("gun",1,true) or title:find("arms",1,true)
                    or title:find("fps",1,true) then
                    addParts(child)
                end
            end
        end
    end
    return objects
end

local function restoreGunAppearance()
    for part, old in pairs(__aimV9.gunPartOriginals) do
        if part and part.Parent then
            pcall(function()
                part.Transparency = old.transparency
                part.Material = old.material
                part.Color = old.color
                part.Reflectance = old.reflectance
            end)
        end
        __aimV9.gunPartOriginals[part] = nil
    end
end

local function applyGunAppearance()
    local anyEffect = state.GunSeeThrough or gunMaterialIndex ~= 1
    local active = {}
    if anyEffect then
        for _, part in ipairs(__aimV9.getGunVisualParts()) do active[part] = true end
    end
    for part, old in pairs(__aimV9.gunPartOriginals) do
        if not active[part] then
            if part and part.Parent then
                pcall(function()
                    part.Transparency = old.transparency
                    part.Material = old.material
                    part.Color = old.color
                    part.Reflectance = old.reflectance
                end)
            end
            __aimV9.gunPartOriginals[part] = nil
        end
    end
    if not anyEffect then return end
    local hue = (os.clock() * .23) % 1
    for part in pairs(active) do
        local old = __aimV9.gunPartOriginals[part]
        if not old then
            old = {transparency=part.Transparency,material=part.Material,
                color=part.Color, reflectance=part.Reflectance}
            __aimV9.gunPartOriginals[part] = old
        end
        local chosen = __aimV9.gunMaterials[gunMaterialIndex]
        part.Material = chosen.material or old.material
        if gunMaterialIndex == 8 then
            -- Hue varies slightly across individual gun pieces for a true rainbow look.
            local offset = (part.Name:len() % 9) / 16
            part.Color = Color3.fromHSV((hue+offset)%1,.95,1)
            part.Reflectance = .13
        elseif gunMaterialIndex == 9 then
            part.Color = Color3.fromHSV((hue*.38+.52)%1,.65,1)
            part.Reflectance = .35
        else
            part.Color = old.color
            part.Reflectance = old.reflectance
        end
        local baseTransparency = state.GunSeeThrough
            and math.max(old.transparency, gunOpacityPercent/100) or old.transparency
        part.Transparency = gunMaterialIndex == 9
            and math.max(baseTransparency,.32) or baseTransparency
    end
end

local function localGunDirection()
    local camera = workspace.CurrentCamera
    return camera and camera.CFrame.LookVector.Unit or nil
end

local function localGunOrigin(tool)
    local handle = tool:FindFirstChild("Handle")
    if handle and handle:IsA("BasePart") then
        local muzzle = handle:FindFirstChild("Muzzle")
        if muzzle and muzzle:IsA("Attachment") then return muzzle.WorldPosition end
        return handle.Position
    end
    local character = player.Character
    local head = character and character:FindFirstChild("Head")
    return head and head.Position or (workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position) or Vector3.zero
end

__aimV9.tracerColor = function()
    local mode = __aimV9.tracerColorIndex
    if mode == 2 then return Color3.fromRGB(36,215,255) end
    if mode == 3 then return Color3.fromHSV((os.clock()*.4)%1,1,1) end
    if mode == 4 then return Color3.fromRGB(255,92,205) end
    return Color3.fromRGB(250,250,250)
end

local function showGunVisual(origin, finish)
    local delta = finish - origin
    local distance = delta.Magnitude
    if distance < 0.01 then return end
    if state.Tracers then
        local tracer = Instance.new("Part")
        tracer.Name = "BlackStarVisualTracer"
        tracer.Anchored = true
        tracer.CanCollide = false
        tracer.CanQuery = false
        tracer.CanTouch = false
        tracer.CastShadow = false
        tracer.Material = Enum.Material.Neon
        tracer.Color = __aimV9.tracerColor()
        tracer.Size = Vector3.new(tracerThickness, tracerThickness, distance)
        tracer.CFrame = CFrame.lookAt((origin + finish) * 0.5, finish)
        tracer.Parent = workspace
        -- Fade thin tracer smoothly without a large impact orb.
        TweenService:Create(tracer, TweenInfo.new(math.max(.08,tracerDuration), Enum.EasingStyle.Linear), {Transparency=1}):Play()
        Debris:AddItem(tracer, tracerDuration + .08)
    end
    -- No impact spheres / oversized landing bubbles. Tracer is a thin beam only.
end

-- Visible local projectile tails for ordinary games that spawn physical bullet parts.
-- This does not alter their collision, speed, hitboxes or server damage.
local function isLikelyProjectile(part)
    if not part:IsA("BasePart") then return false end
    local n = part.Name:lower()
    if not (n:find("bullet", 1, true) or n:find("projectile", 1, true)
        or n:find("pellet", 1, true) or n:find("tracer", 1, true)
        or n:find("round", 1, true)) then return false end
    if part.Size.Magnitude > 12 then return false end
    if part:IsDescendantOf(player.Character or workspace.Terrain) then return false end
    return true
end
local function addProjectileTail(part)
    if not alive or not state.Tracers or not isLikelyProjectile(part) then return end
    if __aimV9.tracerSourceIndex ~= 1 and __aimV9.tracerSourceIndex ~= 3 then return end
    if __aimV9.universalTrailObjects[part] then return end
    local tool = activeTool()
    local camera = workspace.CurrentCamera
    local origin = tool and localGunOrigin(tool) or (camera and camera.CFrame.Position)
    if not origin or (part.Position - origin).Magnitude > 34 then return end
    __aimV9.universalTrailObjects[part] = true
    local a0 = Instance.new("Attachment")
    a0.Name = "BlackStarTrailA"
    a0.Position = Vector3.new(0, tracerThickness * 0.5, 0)
    a0.Parent = part
    local a1 = Instance.new("Attachment")
    a1.Name = "BlackStarTrailB"
    a1.Position = Vector3.new(0, -tracerThickness * 0.5, 0)
    a1.Parent = part
    local tail = Instance.new("Trail")
    tail.Name = "BlackStarProjectileTail"
    tail.Attachment0 = a0
    tail.Attachment1 = a1
    tail.FaceCamera = true
    tail.LightEmission = 1
    tail.Lifetime = tracerDuration
    tail.Color = ColorSequence.new(__aimV9.tracerColor())
    tail.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(1, 1)
    })
    tail.Parent = part
    __aimV9.projectileEvents += 1
    Debris:AddItem(tail, math.max(tracerDuration, 0.2) + 1)
    Debris:AddItem(a0, math.max(tracerDuration, 0.2) + 1)
    Debris:AddItem(a1, math.max(tracerDuration, 0.2) + 1)
end

local function watchProjectiles(newObject)
    if not state.Tracers then return end
    if not newObject:IsA("BasePart") then return end
    if isLikelyProjectile(newObject) then
        -- Defer a frame to let the weapon script position its projectile.
        task.defer(function() if newObject.Parent then addProjectileTail(newObject) end end)
    end
end

local function bindGunFX(effectRemote)
    if not effectRemote or not effectRemote:IsA("RemoteEvent") or effectRemote == __aimV9.gunFXRemoteBound then return end
    __aimV9.gunFXRemoteBound = effectRemote
    table.insert(__aimV9.gunConnections, effectRemote.OnClientEvent:Connect(function(origin, finish)
        if not alive or typeof(origin) ~= "Vector3" or typeof(finish) ~= "Vector3" then return end
        if (finish - origin).Magnitude <= 550 then
            showGunVisual(origin, finish)
        end
    end))
end

bindGunFX(__aimV9.gunFXRemote)
table.insert(__aimV9.gunConnections, ReplicatedStorage.ChildAdded:Connect(function(child)
    if child.Name == "BlackStarGunFX" then
        __aimV9.gunFXRemote = child
        bindGunFX(child)
    end
end))

-- Sound-based fallback: games with camera viewmodels may not expose Tool.Activated.
-- Only listen to local equipped Tool / camera gun viewmodel fire sounds.
-- This visual approximation may differ from shots accepted by the server.
__aimV9.watchShotSound = function(sound)
    if not sound or not sound:IsA("Sound") or __aimV9.watchedShotSounds[sound] then return end
    local name = sound.Name:lower()
    if not (name:find("shoot",1,true) or name:find("fire",1,true)
        or name:find("gunshot",1,true) or name:find("revolver",1,true)
        or name:find("muzzle",1,true) or name:find("blast",1,true)) then return end
    __aimV9.watchedShotSounds[sound] = true
    table.insert(__aimV9.gunConnections, sound.Played:Connect(function()
        if not alive or not armUnlocked or not state.Tracers then return end
        if __aimV9.tracerSourceIndex ~= 1 and __aimV9.tracerSourceIndex ~= 4 then return end
        local tool = activeTool()
        local camera = workspace.CurrentCamera
        if not ((tool and sound:IsDescendantOf(tool)) or
            (camera and sound:IsDescendantOf(camera))) then return end
        -- Do not duplicate a tracer already drawn from a Tool.Activated event.
        task.delay(.025, function()
            if not alive or not state.Tracers then return end
            if os.clock() - __aimV9.lastLocalTracer < .065 then return end
            local cam = workspace.CurrentCamera
            if not cam then return end
            local origin = tool and localGunOrigin(tool) or cam.CFrame.Position
            local direction = cam.CFrame.LookVector
            local rayParams = RaycastParams.new()
            rayParams.FilterType = Enum.RaycastFilterType.Exclude
            rayParams.FilterDescendantsInstances = {player.Character}
            local result = workspace:Raycast(origin,direction*550,rayParams)
            showGunVisual(origin,result and result.Position or origin+direction*550)
            __aimV9.lastLocalTracer = os.clock()
            __aimV9.shotEvents += 1
        end)
    end))
end

__aimV9.observeShotSounds = function()
    if not state.Tracers or not alive then return end
    local tool = activeTool()
    local cam = workspace.CurrentCamera
    for _, source in ipairs({tool, cam}) do
        if source then
            for _, obj in ipairs(source:GetDescendants()) do
                if obj:IsA("Sound") then __aimV9.watchShotSound(obj) end
            end
        end
    end
end

-- Optional sound for local visual hit estimates. An actual confirmed hit requires
-- your game's server to fire AIM_WTF_HitConfirm to the local shooter.
local hitSound = Instance.new("Sound")
hitSound.Name = "AIM_WTF_HitSound"
hitSound.SoundId = hitSoundId ~= "" and ("rbxassetid://" .. (hitSoundId:match("%d+") or "")) or "rbxasset://sounds/electronicpingshort.wav"
hitSound.Volume = hitSoundVolume / 100
hitSound.Parent = SoundService
local function playHitSound()
    if not state.HitSounds or os.clock() - __aimV9.lastLocalHitSound < 0.055 then return end
    __aimV9.lastLocalHitSound = os.clock()
    hitSound.Volume = hitSoundVolume / 100
    pcall(function() hitSound.TimePosition = 0 hitSound:Play() end)
end
__aimV9.boundHitConfirm = nil
local function bindHitConfirm(remote)
    if not remote or not remote:IsA("RemoteEvent") or __aimV9.boundHitConfirm == remote then return end
    __aimV9.boundHitConfirm = remote
    table.insert(__aimV9.gunConnections, remote.OnClientEvent:Connect(function()
        if alive and armUnlocked then playHitSound() end
    end))
end
bindHitConfirm(ReplicatedStorage:FindFirstChild("AIM_WTF_HitConfirm"))
table.insert(__aimV9.gunConnections, ReplicatedStorage.ChildAdded:Connect(function(child)
    if child.Name == "AIM_WTF_HitConfirm" then bindHitConfirm(child) end
end))

local function drawGunShot(tool, origin, direction)
    if not state.Tracers and not state.HitSounds then return end
    if not tool or not origin or not direction then return end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {player.Character, tool}
    params.IgnoreWater = true
    local hit = workspace:Raycast(origin, direction * 500, params)
    local finish = hit and hit.Position or (origin + direction * 500)
    if state.Tracers and (__aimV9.tracerSourceIndex == 1 or __aimV9.tracerSourceIndex == 2) then showGunVisual(origin, finish) end
    if hit and state.HitSounds then
        local model = hit.Instance:FindFirstAncestorOfClass("Model")
        local other = model and Players:GetPlayerFromCharacter(model)
        if other and isEnemy(other) then playHitSound() end
    end
    __aimV9.shotEvents += 1
    __aimV9.lastLocalTracer = os.clock()
    __aimV9.lastVisualTool = tool
end

-- Screen-space target center: PC mouse cursor or the viewport crosshair on touch.
-- Reused by the visible FOV ring so the targeting radius matches the display.
local function silentAimScreenPoint()
    local camera = workspace.CurrentCamera
    if not camera then return Vector2.zero end
    if UIS.TouchEnabled and not UIS.MouseEnabled then
        return camera.ViewportSize * 0.5
    end
    return UIS:GetMouseLocation()
end

-- Only works with cooperating weapons / a compatible client Raycast hook.
-- Server hit validation, other APIs and proprietary weapon systems are unaffected.
local function compatibleAimDirection(origin, defaultDirection)
    if not state.SilentAim and not (state.BloxSilentAim and __aimV9.blox.active()) then return defaultDirection end
    local camera = workspace.CurrentCamera
    if not camera then return defaultDirection end
    local screenPoint = silentAimScreenPoint()
    local nearest, bestDistance = nil, (state.BloxSilentAim and __aimV9.blox.active()) and __aimV9.blox.fov or __aimV9.silentAimFOV
    for _, other in ipairs(Players:GetPlayers()) do
        if isEnemy(other) then
            local character = other.Character
            local head = character and character:FindFirstChild("Head")
            local hum = character and character:FindFirstChildOfClass("Humanoid")
            if head and hum and hum.Health > 0 then
                local pos, visible = camera:WorldToViewportPoint(head.Position)
                if visible and pos.Z > 0 then
                    local distance = (Vector2.new(pos.X,pos.Y) - screenPoint).Magnitude
                    if distance < bestDistance then
                        nearest, bestDistance = head, distance
                    end
                end
            end
        end
    end
    return nearest and (nearest.Position - origin).Unit or defaultDirection
end

-- OPTIONAL UNIVERSAL CLIENT-RAYCAST SILENT AIM
-- Works ONLY when an executor provides namecall hooks AND a weapon uses
-- client workspace:Raycast for firing. It does NOT change server-validated hits,
-- remote event direction arguments, or games using custom bullet systems.
-- The AIM.WTF SilentAim toggle controls this hook. It has no effect otherwise.
__aimV9.raycastSilentSupported = false
if type(hookmetamethod) == "function"
    and type(newcclosure) == "function"
    and type(getnamecallmethod) == "function" then
    local oldRaycastNamecall
    local ok = pcall(function()
        oldRaycastNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            if not alive or not armUnlocked or not (state.SilentAim or (state.BloxSilentAim and __aimV9.blox.active()))
                or self ~= workspace or getnamecallmethod() ~= "Raycast"
                or (type(checkcaller) == "function" and checkcaller()) then
                return oldRaycastNamecall(self, ...)
            end
            local origin, direction = ...
            if typeof(origin) ~= "Vector3" or typeof(direction) ~= "Vector3"
                or direction.Magnitude < 35 then
                return oldRaycastNamecall(self, ...)
            end
            local camera = workspace.CurrentCamera
            if not camera or (origin - camera.CFrame.Position).Magnitude > 40
                or camera.CFrame.LookVector:Dot(direction.Unit) < 0.75 then
                return oldRaycastNamecall(self, ...)
            end
            local redirected = compatibleAimDirection(origin, direction.Unit)
            if redirected and redirected:Dot(direction.Unit) > 0 then
                -- Preserve the game's original cast length and filter params.
                return oldRaycastNamecall(self, origin,
                    redirected * direction.Magnitude, select(3, ...))
            end
            return oldRaycastNamecall(self, ...)
        end))
    end)
    __aimV9.raycastSilentSupported = ok
end
print("AIM.WTF | Client raycast aim hook: " ..
    (__aimV9.raycastSilentSupported and "available (weapon dependent)" or "unsupported by this environment"))

-- Optional integration for weapons in experiences that explicitly opt in.
-- An opt-in Tool's LocalScript can read these Attributes each shot.
-- Server-validated delays, magazine state and rate limits remain authoritative.
__aimV9.applyFireControls = function(tool)
    if not tool or not tool:IsA("Tool") then return end
    if tool:GetAttribute("AIM_WTF_AllowFireControls") ~= true then return end
    tool:SetAttribute("AIM_WTF_FireRate", gunFireRate)
    tool:SetAttribute("AIM_WTF_NoCooldown", state.NoGunCooldown)
end

local function onGunActivated(tool)
    if not alive or not armUnlocked then return end
    if tool.Parent ~= player.Character then return end
    local direction = localGunDirection()
    if not direction then return end
    local isDemoGun = tool:GetAttribute("BlackStarGun") == true
    local now = os.clock()
    -- The demo gun always respects the rate slider, for single clicks AND hold-fire.
    -- No cooldown disables only this client's extra delay; the server still
    -- chooses whether to accept a shot. Cap client requests at 60 Hz.
    local clientGap = state.NoGunCooldown and (1 / 60) or gunFireInterval
    if isDemoGun and now - __aimV9.lastGunShot < clientGap - 0.0005 then return end
    if isDemoGun then __aimV9.lastGunShot = now end
    local origin = localGunOrigin(tool)
    if isDemoGun then direction = compatibleAimDirection(origin, direction) end
    -- The demo tool draws actual accepted tracer paths via BlackStarGunFX,
    -- so a server-rejected shot or reload does not create a fake shot.
    if not isDemoGun then
        drawGunShot(tool, origin, direction)
    end

    if isDemoGun then
        __aimV9.gunRemote = ReplicatedStorage:FindFirstChild("BlackStarGunFire")
        if __aimV9.gunRemote and __aimV9.gunRemote:IsA("RemoteEvent") then
            if not __aimV9.gunFXRemoteBound then
                -- Backward compatibility when using an old GunServer script.
                drawGunShot(tool, origin, direction)
            end
            __aimV9.gunRemote:FireServer(direction, {
                seamless = state.SeamlessReload,
                wall = state.WallPenetration,
                rate = gunFireRate,
                noCooldown = state.NoGunCooldown,
            })
            gunStatus("Compatible demo gun: " .. gunFireRate .. " shots/sec requested"
                .. (state.NoGunCooldown and " • local cooldown OFF" or ""))
            if not state.NoRecoil then
                local camera = workspace.CurrentCamera
                if camera then camera.CFrame = camera.CFrame * CFrame.Angles(math.rad(1.2), 0, 0) end
            end
        else
            gunStatus("GunServer.lua missing: only local visuals available")
        end
    else
        gunStatus("Tool activated locally • fire rate / cooldown depends on game")
    end
end

local function watchGunTool(tool)
    if not tool:IsA("Tool") or __aimV9.watchedTools[tool] then return end
    __aimV9.watchedTools[tool] = true
    __aimV9.applyFireControls(tool)
    table.insert(__aimV9.gunConnections, tool.Activated:Connect(function()
        onGunActivated(tool)
    end))
    table.insert(__aimV9.gunConnections, tool.Equipped:Connect(function()
        __aimV9.lastGunShot = -math.huge
        __aimV9.applyFireControls(tool)
        applyGunAppearance()
    end))
    table.insert(__aimV9.gunConnections, tool.Unequipped:Connect(function()
        restoreGunAppearance()
        __aimV9.firingHeld = false
    end))
end

local function observeGunTools(container)
    if not container then return end
    for _, child in ipairs(container:GetChildren()) do watchGunTool(child) end
    table.insert(__aimV9.gunConnections, container.ChildAdded:Connect(watchGunTool))
end

-- Local projectile detection: some games create projectile Parts but never fire Tool.Activated.
table.insert(__aimV9.gunConnections, workspace.DescendantAdded:Connect(watchProjectiles))

observeGunTools(player:WaitForChild("Backpack"))
observeGunTools(player.Character)
table.insert(__aimV9.gunConnections, player.CharacterAdded:Connect(function(character)
    restoreGunAppearance()
    observeGunTools(character)
    __aimV9.firingHeld = false
    __aimV9.lastGunShot = -math.huge
end))

local function connect(signal, fn)
    local c = signal:Connect(fn)
    table.insert(__aimV9.connections, c)
    return c
end
local function corner(parent, pixels)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, pixels)
    c.Parent = parent
end
local function stroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or Color3.fromRGB(67,67,67)
    s.Thickness = thickness or 1
    s.Parent = parent
end
local function label(parent, text, size, pos, fontSize, color, bold)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Size, l.Position = size, pos
    l.Text = text
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextSize = fontSize
    l.TextColor3 = color or Color3.fromRGB(245,245,250)
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = parent
    return l
end
local function button(parent, text, size, pos)
    local b = Instance.new("TextButton")
    b.Size, b.Position = size, pos
    b.BackgroundColor3 = Color3.fromRGB(23,30,47)
    b.BorderSizePixel = 0
    b.Font = Enum.Font.GothamSemibold
    b.TextSize = 14
    b.TextColor3 = Color3.fromRGB(245,245,250)
    b.Text = text
    b.AutoButtonColor = true
    b.Parent = parent
    corner(b, 8)
    return b
end
local function tween(obj, props, seconds)
    if not alive then return end
    local t = TweenService:Create(obj, TweenInfo.new(seconds or .2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
    table.insert(__aimV9.tweens, t)
    t:Play()
    return t
end
-- ESP name tags and 3D highlights are independent of specific game remotes.
local function refreshNameTag(other, character, head)
    if not (state.ESP or (state.BloxESP and __aimV9.blox.active())) or not head or not isEnemy(other) then return end
    local tag = __aimV9.espBadges[other]
    if not tag or not tag.Parent or tag.Adornee ~= head then
        if tag then tag:Destroy() end
        tag = Instance.new("BillboardGui")
        tag.Name = "BlackStarESPLabel"
        tag.Size = UDim2.fromOffset(164, 30)
        tag.StudsOffsetWorldSpace = Vector3.new(0, 2.1, 0)
        tag.MaxDistance = 1500
        tag.AlwaysOnTop = true
        tag.LightInfluence = 0
        tag.Adornee = head
        tag.Parent = playerGui -- BillboardGui is directly in PlayerGui with Adornee=head
        local text = Instance.new("TextLabel")
        text.Name = "Label"
        text.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        text.BackgroundTransparency = 0.35
        text.BorderSizePixel = 0
        text.Size = UDim2.fromScale(1, 1)
        text.Font = Enum.Font.GothamBold
        text.TextScaled = false
        text.TextSize = 13
        text.TextStrokeTransparency = 0.35
        text.TextColor3 = Color3.fromRGB(245, 30, 30)
        text.Parent = tag
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 5)
        corner.Parent = text
        local directionLabel = Instance.new("TextLabel")
        directionLabel.Name = "Direction"
        directionLabel.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
        directionLabel.BackgroundTransparency = 0.24
        directionLabel.Size = UDim2.fromOffset(26, 26)
        directionLabel.Position = UDim2.new(1, 5, 0, 2)
        directionLabel.TextColor3 = Color3.new(1, 1, 1)
        directionLabel.Font = Enum.Font.GothamBlack
        directionLabel.TextSize = 18
        directionLabel.Text = "↑"
        directionLabel.Parent = tag
        __aimV9.espBadges[other] = tag
    end
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    local otherRoot = character:FindFirstChild("HumanoidRootPart")
    local dist = root and otherRoot and math.floor((root.Position - otherRoot.Position).Magnitude) or nil
    local display = other.DisplayName ~= other.Name and (other.DisplayName .. " @" .. other.Name) or other.Name
    local label = tag:FindFirstChild("Label")
    if label then
        label.TextColor3 = chamsColor()
        label.Text = dist and (display .. " | " .. dist .. " studs") or display
    end
    local arrow = tag:FindFirstChild("Direction")
    if arrow then
        arrow.Visible = state.FacingESP
        if arrow.Visible and otherRoot then
            local camera = workspace.CurrentCamera
            if camera then
                local p0 = camera:WorldToViewportPoint(otherRoot.Position)
                local p1 = camera:WorldToViewportPoint(otherRoot.Position + otherRoot.CFrame.LookVector * 4)
                if p0.Z > 0 and p1.Z > 0 then
                    local delta = Vector2.new(p1.X - p0.X, p1.Y - p0.Y)
                    arrow.Rotation = math.deg(math.atan2(delta.Y, delta.X)) + 90
                    arrow.TextColor3 = chamsColor()
                end
            end
        end
    end
end
local function clearNameTags()
    for other,tag in pairs(__aimV9.espBadges) do
        if tag then tag:Destroy() end
        __aimV9.espBadges[other] = nil
    end
end
local function cleanESP()
    clearNameTags()
    for h in pairs(__aimV9.trackedHighlights) do
        if h and h.Parent then h:Destroy() end
        __aimV9.trackedHighlights[h] = nil
    end
end
-- Locally visualized enemy head size. NOT a server-side hitbox change.
local function restoreEnemyHeads()
    for head, old in pairs(__aimV9.originalHeads) do
        if head and head.Parent then pcall(function() head.Size = old end) end
        __aimV9.originalHeads[head] = nil
    end
end
local function updateEnemyHeads()
    if not armUnlocked or not state.HeadExpander then restoreEnemyHeads() return end
    for _, other in ipairs(Players:GetPlayers()) do
        if isEnemy(other) then
            local head = other.Character and other.Character:FindFirstChild("Head")
            if head and head:IsA("BasePart") then
                if not __aimV9.originalHeads[head] then __aimV9.originalHeads[head] = head.Size end
                pcall(function() head.Size = Vector3.new(enemyHeadSize, enemyHeadSize, enemyHeadSize) end)
            end
        end
    end
    for head, old in pairs(__aimV9.originalHeads) do
        local other = head and head.Parent and Players:GetPlayerFromCharacter(head.Parent)
        if not state.HeadExpander or not head.Parent or not isEnemy(other) then
            if head and head.Parent then pcall(function() head.Size = old end) end
            __aimV9.originalHeads[head] = nil
        end
    end
end

-- AIM.WTF MATERIAL CHAMS (LOCAL VISUALS, LOW OVERHEAD)
-- Roblox Highlight has no Material property. Apply the chosen finish to the
-- rendered BaseParts on this client; keep Highlight for through-wall outlines.
-- No proxy parts, no per-frame instance creation, no anchored animation shells.
-- Works with ordinary R6/R15 bodies; games with custom renderers may differ.
local CHAM_MATERIALS = {
    {material=Enum.Material.SmoothPlastic, reflectance=0, transparency=0},  -- PLASTIC
    {material=Enum.Material.Metal, reflectance=.25, transparency=0},         -- GLOSSY
    {material=Enum.Material.Glass, reflectance=.06, transparency=.40},      -- GLASS
    {material=Enum.Material.Neon, reflectance=0, transparency=.04},         -- NEON
}
local function clearGlossyParts(other)
    local group = __aimV9.glossyParts[other]
    if not group then return end
    __aimV9.glossyParts[other] = nil
    for _, entry in ipairs(group.parts) do
        local part, old = entry.part, entry.old
        if part and part.Parent then
            pcall(function()
                part.Material = old.material
                part.Color = old.color
                part.Reflectance = old.reflectance
                part.Transparency = old.transparency
            end)
            if old.variant ~= nil then
                pcall(function() part.MaterialVariant = old.variant end)
            end
            if old.texture ~= nil then
                pcall(function() part.TextureID = old.texture end)
            end
            for _, texture in ipairs(entry.meshes) do
                if texture.mesh and texture.mesh.Parent then
                    pcall(function() texture.mesh.TextureId = texture.value end)
                end
            end
        end
    end
    for _, garment in ipairs(group.garments) do
        if garment.instance and garment.instance.Parent then
            pcall(function() garment.instance[garment.property] = garment.value end)
        end
    end
    for _, surface in ipairs(group.surfaces) do
        if surface.instance and surface.parent and surface.parent.Parent then
            pcall(function() surface.instance.Parent = surface.parent end)
        end
    end
end

local function refreshGlossyParts(other, character)
    if not (state.Chams or state.GlossyChams) or not isEnemy(other) then
        clearGlossyParts(other)
        return
    end
    local group = __aimV9.glossyParts[other]
    if group and group.character ~= character then
        clearGlossyParts(other)
        group = nil
    end
    if not group then
        group = {character=character, parts={}, garments={}, surfaces={}}
        __aimV9.glossyParts[other] = group
        for _, item in ipairs(character:GetDescendants()) do
            if item:IsA("BasePart") and item.Name ~= "HumanoidRootPart"
                and item.Transparency < .96
                and not item:FindFirstAncestorOfClass("Accessory")
                and not item:FindFirstAncestorOfClass("Tool") then
                local partOld = {
                    material=item.Material, color=item.Color,
                    transparency=item.Transparency, reflectance=item.Reflectance,
                }
                pcall(function() partOld.variant = item.MaterialVariant end)
                if item:IsA("MeshPart") then
                    pcall(function() partOld.texture = item.TextureID end)
                end
                local entry = {part=item, old=partOld, meshes={}}
                for _, desc in ipairs(item:GetDescendants()) do
                    if desc:IsA("SpecialMesh") then
                        table.insert(entry.meshes, {mesh=desc, value=desc.TextureId})
                        pcall(function() desc.TextureId = "" end)
                    elseif desc:IsA("SurfaceAppearance") then
                        table.insert(group.surfaces, {instance=desc, parent=desc.Parent})
                        pcall(function() desc.Parent = nil end)
                    end
                end
                if partOld.texture ~= nil then
                    pcall(function() item.TextureID = "" end)
                end
                pcall(function() item.MaterialVariant = "" end)
                table.insert(group.parts, entry)
            elseif item:IsA("Shirt") or item:IsA("Pants") or item:IsA("ShirtGraphic") then
                local property = item:IsA("Shirt") and "ShirtTemplate"
                    or item:IsA("Pants") and "PantsTemplate" or "Graphic"
                local original = item[property]
                table.insert(group.garments, {instance=item, property=property, value=original})
                pcall(function() item[property] = "" end)
            end
        end
    end
    local finish = CHAM_MATERIALS[chamFinishIndex] or CHAM_MATERIALS[1]
    local color = chamsColor()
    for _, entry in ipairs(group.parts) do
        local part = entry.part
        if part and part.Parent then
            -- Write only changed properties; light enough for large servers.
            pcall(function()
                if part.Material ~= finish.material then part.Material = finish.material end
                if part.Color ~= color then part.Color = color end
                if part.Reflectance ~= finish.reflectance then part.Reflectance = finish.reflectance end
                if part.Transparency ~= finish.transparency then part.Transparency = finish.transparency end
            end)
        end
    end
end
local function clearGlossyChams()
    for other in pairs(__aimV9.glossyParts) do clearGlossyParts(other) end
end

-- Local decorative skin; does not change the character others see.
-- Full-body client-only Tung Tung Sahur costume.  Roblox cylinders run on their
-- local X axis, so vertical logs must rotate 90 degrees around local Z.
-- Parts are locally created, invisible to other players, and do not alter hits.
local tungBody, tungCharacter, tungWatcher
local function clearTung()
    if tungWatcher then tungWatcher:Disconnect() tungWatcher=nil end
    if tungBody then tungBody:Destroy() tungBody=nil end
    for part, old in pairs(__aimV9.savedBodyTransparency) do
        if part and part.Parent then pcall(function() part.LocalTransparencyModifier=old end) end
        __aimV9.savedBodyTransparency[part]=nil
    end
    tungCharacter=nil
end
local function updateTung()
    if not state.TungTung or not armUnlocked then clearTung() return end
    local character=player.Character
    local root=character and character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if tungBody and tungBody.Parent and tungCharacter==character then return end
    clearTung()
    tungCharacter=character
    local model=Instance.new("Model")
    model.Name="AIM_WTF_FullBody_TungTung_Local"
    model.Parent=character
    tungBody=model
    local wood=Color3.fromRGB(160,99,52)
    local lightWood=Color3.fromRGB(191,129,68)
    local grain=Color3.fromRGB(110,65,36)
    local black=Color3.fromRGB(27,24,24)
    local eyes=Color3.fromRGB(250,243,219)
    local function piece(name, shape, size, offset, color, material)
        local p=Instance.new("Part")
        p.Name=name
        p.Shape=shape
        p.Size=size
        p.Color=color
        p.Material=material or Enum.Material.Wood
        p.TopSurface=Enum.SurfaceType.Smooth
        p.BottomSurface=Enum.SurfaceType.Smooth
        p.CanCollide=false p.CanTouch=false p.CanQuery=false
        p.CastShadow=false p.Massless=true
        p.CFrame=root.CFrame*offset
        p.Parent=model
        local weld=Instance.new("WeldConstraint")
        weld.Part0=root weld.Part1=p weld.Parent=p
        return p
    end
    local upright=CFrame.Angles(0,0,math.rad(90))
    -- The single thick upright log covers head, torso, and upper legs.
    piece("FullLogBody",Enum.PartType.Cylinder,Vector3.new(5.1,2.04,1.86),CFrame.new(0,.52,0)*upright,wood)
    piece("TopCap",Enum.PartType.Cylinder,Vector3.new(.18,2.05,1.86),CFrame.new(0,3.04,0)*upright,lightWood)
    piece("BottomCap",Enum.PartType.Cylinder,Vector3.new(.16,2.04,1.86),CFrame.new(0,-2.02,0)*upright,grain)
    -- Long, subtle bark grooves make the trunk look rounded rather than flat.
    for i=-2,2 do
        piece("BarkGroove"..tostring(i),Enum.PartType.Block,Vector3.new(.055,4.6,.055),
            CFrame.new(i*.28,.5,-.94+math.abs(i)*.055),grain,Enum.Material.Wood)
    end
    for _,side in ipairs({-1,1}) do
        piece("WoodArm",Enum.PartType.Cylinder,Vector3.new(2.35,.34,.34),
            CFrame.new(side*1.27,.05,-.03)*CFrame.Angles(0,0,math.rad(90-side*24)),wood)
        piece("WoodHand",Enum.PartType.Ball,Vector3.new(.48,.48,.48),
            CFrame.new(side*1.61,-.99,-.03),lightWood,Enum.Material.Wood)
        piece("WoodLeg",Enum.PartType.Cylinder,Vector3.new(1.65,.42,.42),
            CFrame.new(side*.53,-2.45,0)*upright,wood)
        piece("WoodFoot",Enum.PartType.Ball,Vector3.new(.7,.3,.94),
            CFrame.new(side*.57,-3.17,-.2),wood)
        -- Distinctive wide, forward-facing eyes.
        piece("WhiteEye",Enum.PartType.Ball,Vector3.new(.52,.55,.24),
            CFrame.new(side*.36,1.9,-.97),eyes,Enum.Material.SmoothPlastic)
        piece("DarkPupil",Enum.PartType.Ball,Vector3.new(.26,.33,.16),
            CFrame.new(side*.36,1.89,-1.10),black,Enum.Material.SmoothPlastic)
        piece("Eyebrow",Enum.PartType.Block,Vector3.new(.48,.095,.11),
            CFrame.new(side*.36,2.32,-.99),grain,Enum.Material.Wood)
    end
    piece("LongMouth",Enum.PartType.Ball,Vector3.new(.42,.18,.13),
        CFrame.new(0,1.11,-1.01),black,Enum.Material.SmoothPlastic)
    -- Wooden bat in the right hand, angled up and outwards.
    piece("SahurBat",Enum.PartType.Cylinder,Vector3.new(3.2,.33,.33),
        CFrame.new(2.25,-.08,-.26)*CFrame.Angles(0,0,math.rad(112)),lightWood)
    piece("BatTip",Enum.PartType.Ball,Vector3.new(.48,.48,.48),
        CFrame.new(2.91,1.34,-.26),lightWood)
    local function hideAvatarPart(obj)
        if not obj:IsA("BasePart") or obj:IsDescendantOf(model) or obj:IsDescendantOf(character:FindFirstChildOfClass("Tool") or model) then return end
        if __aimV9.savedBodyTransparency[obj]==nil then
            __aimV9.savedBodyTransparency[obj]=obj.LocalTransparencyModifier
        end
        obj.LocalTransparencyModifier=1
    end
    for _,obj in ipairs(character:GetDescendants()) do hideAvatarPart(obj) end
    tungWatcher=character.DescendantAdded:Connect(function(obj)
        if tungBody==model then hideAvatarPart(obj) end
    end)
end
__aimV9.ghostLast=0
local function updateLocalGhost()
    if not state.GhostDecoy or not armUnlocked then
        if __aimV9.ghostVisuals then __aimV9.ghostVisuals:Destroy() __aimV9.ghostVisuals=nil end
        return
    end
    local character=player.Character
    local root=character and character:FindFirstChild("HumanoidRootPart")
    local hum=character and character:FindFirstChildOfClass("Humanoid")
    if not root or not hum or hum.MoveDirection.Magnitude<.15 then return end
    if os.clock()-__aimV9.ghostLast<.13 then return end
    __aimV9.ghostLast=os.clock()
    if not __aimV9.ghostVisuals then
        __aimV9.ghostVisuals=Instance.new("Folder")
        __aimV9.ghostVisuals.Name="AIM_WTF_VisualGhosts_Only"
        __aimV9.ghostVisuals.Parent=workspace.CurrentCamera or workspace
    end
    local ghost=Instance.new("Part")
    ghost.Name="TrailDecoy_NotAHitbox"
    ghost.Anchored=true ghost.CanCollide=false ghost.CanTouch=false ghost.CanQuery=false
    ghost.CastShadow=false
    ghost.Material=Enum.Material.ForceField
    ghost.Transparency=.69
    ghost.Color=Color3.fromRGB(240,240,240)
    ghost.Size=Vector3.new(1.9,3.5,.9)
    ghost.CFrame=CFrame.new(root.Position-hum.MoveDirection.Unit*ghostDistance,root.Position-hum.MoveDirection.Unit*(ghostDistance-1))
    ghost.Parent=__aimV9.ghostVisuals
    Debris:AddItem(ghost,.22)
end

local function restoreCollision()
    for p, wasCollidable in pairs(__aimV9.originalCollisions) do
        if p and p.Parent then p.CanCollide = wasCollidable end
        __aimV9.originalCollisions[p] = nil
    end
end
local function restoreMovement()
    if __aimV9.originalHumanoid and __aimV9.originalHumanoid.Parent and __aimV9.originalMovement then
        __aimV9.originalHumanoid.WalkSpeed = __aimV9.originalMovement.speed
        __aimV9.originalHumanoid.UseJumpPower = __aimV9.originalMovement.useJumpPower
        __aimV9.originalHumanoid.JumpPower = __aimV9.originalMovement.jumpPower
        __aimV9.originalHumanoid.JumpHeight = __aimV9.originalMovement.jumpHeight
    end
end
local previous = playerGui:FindFirstChild("AIM_WTF_Universal")
if previous then previous:Destroy() end

gui = Instance.new("ScreenGui")
gui.Name = "AIM_WTF_Universal"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
skeletonLayer = Instance.new("Frame")
skeletonLayer.Name = "SkeletonOverlay"
skeletonLayer.Size = UDim2.fromScale(1, 1)
skeletonLayer.BackgroundTransparency = 1
skeletonLayer.BorderSizePixel = 0
skeletonLayer.Active = false
skeletonLayer.ZIndex = 18
skeletonLayer.Parent = gui
gui.Parent = playerGui

-- Silent Aim FOV ring: visual aid only, never a hitbox or guaranteed hit.
-- A rounded Frame with UIStroke avoids executor-specific Drawing APIs.
__aimV9.silentAimRing = Instance.new("Frame")
__aimV9.silentAimRing.Name = "AIM_WTF_SilentAim_FOV"
__aimV9.silentAimRing.AnchorPoint = Vector2.new(.5,.5)
__aimV9.silentAimRing.BackgroundTransparency = 1
__aimV9.silentAimRing.BorderSizePixel = 0
__aimV9.silentAimRing.Active = false
__aimV9.silentAimRing.ZIndex = 24
__aimV9.silentAimRing.Visible = false
__aimV9.silentAimRing.Parent = gui
do
    local ringCorner = Instance.new("UICorner")
    ringCorner.CornerRadius = UDim.new(1,0)
    ringCorner.Parent = __aimV9.silentAimRing
    local ringStroke = Instance.new("UIStroke")
    ringStroke.Name = "RingOutline"
    ringStroke.Color = Color3.fromRGB(250,250,250)
    ringStroke.Transparency = .15
    ringStroke.Thickness = 1.5
    ringStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    ringStroke.Parent = __aimV9.silentAimRing
end


-- Independent overlay: remains visible when the large menu is hidden.
__aimV9.activeHudFrame=Instance.new("Frame")
__aimV9.activeHudFrame.Name="AIM_WTF_Active_Features_HUD"
__aimV9.activeHudFrame.AnchorPoint=Vector2.new(1,0)
__aimV9.activeHudFrame.Position=UDim2.new(1,-16,0,78)
__aimV9.activeHudFrame.Size=UDim2.fromOffset(216,90)
__aimV9.activeHudFrame.BackgroundColor3=Color3.fromRGB(10,13,23)
__aimV9.activeHudFrame.BackgroundTransparency=.13
__aimV9.activeHudFrame.BorderSizePixel=0
__aimV9.activeHudFrame.ZIndex=81
__aimV9.activeHudFrame.Visible=false
__aimV9.activeHudFrame.Parent=gui
corner(__aimV9.activeHudFrame,7)
stroke(__aimV9.activeHudFrame,Color3.fromRGB(66,112,176))
__aimV9.activeHudText=label(__aimV9.activeHudFrame,"AIM.WTF / ACTIVE",UDim2.new(1,-16,1,-10),UDim2.fromOffset(8,6),12,Color3.fromRGB(227,234,250),true)
__aimV9.activeHudText.TextXAlignment=Enum.TextXAlignment.Left
__aimV9.activeHudText.TextYAlignment=Enum.TextYAlignment.Top
__aimV9.activeHudText.ZIndex=82
local lastHudRefresh=0
connect(RunService.Heartbeat,function()
    if not alive then return end
    local now=os.clock()
    if now-lastHudRefresh<.5 then return end
    lastHudRefresh=now
    local visible=armUnlocked and state.ActiveHUD
    __aimV9.activeHudFrame.Visible=visible
    if not visible then return end
    local enabled={}
    for name,active in pairs(state) do
        local shared=table.find(__aimV9.keybindNames,name)~=nil
        local gameMatches=__aimV9.selectedGame=="Universal" and not name:match("^MM2")
            or __aimV9.selectedGame=="MM2" and (shared or name:match("^MM2"))
        if active and gameMatches and name~="ActiveHUD" and name~="TeamCheck"
            and name~="ShowSilentFOV" and name~="ShowTriggerFOV"
            and name~="MM2VisibleOnly" and not name:match("^Blox") then
            enabled[#enabled+1]=name
        end
    end
    if __aimV9.perf.lowTexture then enabled[#enabled+1]="POTATO GRAPHICS" end
    local a=__aimV9.ambience
    if a.index>1 then enabled[#enabled+1]="AMBIENCE: "..a.presets[a.index] end
    table.sort(enabled)
    local lines={"AIM.WTF / "..string.upper(__aimV9.selectedGame),"ACTIVE FEATURES"}
    for i=1,math.min(10,#enabled) do lines[#lines+1]="• "..enabled[i] end
    if #enabled>10 then lines[#lines+1]="+"..(#enabled-10).." more" end
    if #enabled==0 then lines[#lines+1]="None" end
    __aimV9.activeHudText.Text=table.concat(lines,"\n")
    __aimV9.activeHudFrame.Size=UDim2.fromOffset(216,math.min(320,20+#lines*17))
end)

-- A separate, simple FOV circle for the triggerbot. No animated geometry.
__aimV9.triggerRing = Instance.new("Frame")
__aimV9.triggerRing.Name = "AIM_WTF_Trigger_FOV"
__aimV9.triggerRing.AnchorPoint = Vector2.new(.5,.5)
__aimV9.triggerRing.BackgroundTransparency = 1
__aimV9.triggerRing.Active = false
__aimV9.triggerRing.ZIndex = 23
__aimV9.triggerRing.Visible = false
__aimV9.triggerRing.Parent = gui
do
    local round = Instance.new("UICorner")
    round.CornerRadius = UDim.new(1,0)
    round.Parent = __aimV9.triggerRing
    local outline = Instance.new("UIStroke")
    outline.Color = Color3.fromRGB(175,220,255)
    outline.Transparency = .22
    outline.Thickness = 1.2
    outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    outline.Parent = __aimV9.triggerRing
end

-- AIM.WTF v11.6: lightweight animated constellation sky.
-- One shared, capped (~20 FPS) update for every starfield: no per-star tweens,
-- no RenderStepped loops, and hidden menus do not consume animation work.
local constellationFields = {}
local function addConstellationStars(parent, z)
    local field = Instance.new("Frame")
    field.Name = "AIM_WTF_MovingConstellationSky"
    field.BackgroundTransparency = 1
    field.BorderSizePixel = 0
    field.Size = UDim2.fromScale(1, 1)
    field.ClipsDescendants = true
    field.Active = false
    field.ZIndex = z
    field.Parent = parent

    local rng = Random.new(61727 + z)
    local starNodes = {}
    local links = {}
    local chains = {
        {{.10,.20},{.19,.11},{.30,.17},{.37,.08},{.45,.20}},
        {{.51,.30},{.58,.17},{.66,.24},{.72,.10},{.82,.20},{.88,.09}},
        {{.12,.72},{.23,.60},{.30,.73},{.40,.57},{.48,.70}},
        {{.55,.76},{.63,.65},{.72,.76},{.79,.62},{.91,.69}},
    }

    local function makeStar(x, y, size, bright)
        local dot = Instance.new("Frame")
        dot.Name = bright and "ConstellationAnchor" or "MovingStar"
        dot.AnchorPoint = Vector2.new(.5, .5)
        dot.Position = UDim2.fromScale(x, y)
        dot.Size = UDim2.fromOffset(size, size)
        dot.BackgroundColor3 = bright and Color3.fromRGB(237,244,255) or Color3.fromRGB(166,190,224)
        dot.BackgroundTransparency = bright and .12 or rng:NextNumber(.24,.60)
        dot.BorderSizePixel = 0
        dot.Active = false
        dot.ZIndex = z + 1
        dot.Parent = field
        local round = Instance.new("UICorner")
        round.CornerRadius = UDim.new(1, 0)
        round.Parent = dot
        local node = {
            gui = dot,
            baseX = x, baseY = y,
            -- Very small drift: no sudden repositioning or fast movement.
            driftX = rng:NextNumber(.004,.012),
            driftY = rng:NextNumber(.004,.014),
            rateX = rng:NextNumber(.35,.75),
            rateY = rng:NextNumber(.28,.65),
            phase = rng:NextNumber(0, math.pi * 2),
            x = x, y = y,
        }
        starNodes[#starNodes + 1] = node
        return node
    end

    local function makeLink(a,b)
        local line = Instance.new("Frame")
        line.Name = "MovingConstellationLink"
        line.AnchorPoint = Vector2.new(.5,.5)
        line.BackgroundColor3 = Color3.fromRGB(139,177,232)
        line.BackgroundTransparency = .63
        line.BorderSizePixel = 0
        line.Active = false
        line.ZIndex = z
        line.Parent = field
        links[#links + 1] = {gui = line, a = a, b = b}
    end

    -- A few wandering background stars, plus the larger connected anchors.
    -- Intentionally fewer objects than the older full-screen effects.
    for _ = 1, 18 do
        makeStar(rng:NextNumber(.035,.965), rng:NextNumber(.04,.96), rng:NextInteger(1,2), false)
    end
    for _,chain in ipairs(chains) do
        local last
        for _,position in ipairs(chain) do
            local current = makeStar(position[1],position[2],3,true)
            if last then makeLink(last,current) end
            last = current
        end
    end
    constellationFields[#constellationFields+1] = {
        field = field, stars = starNodes, links = links,
    }
    return field
end

-- Recalculate links from the same moving star positions, so lines remain
-- attached to star centers even while the panel is resized or dragged.
local constellationTick = 0
connect(RunService.Heartbeat, function(dt)
    if not alive then return end
    constellationTick = constellationTick + math.min(dt, .1)
    if constellationTick < .10 then return end -- 10 updates/sec max; less UI overhead
    constellationTick = 0
    local t = os.clock()
    for i = #constellationFields, 1, -1 do
        local data = constellationFields[i]
        local field = data.field
        if not field or not field.Parent then
            table.remove(constellationFields, i)
        else
            local visible = true
            local ancestor = field
            while ancestor do
                if ancestor:IsA("GuiObject") and not ancestor.Visible then
                    visible = false
                    break
                end
                if ancestor:IsA("ScreenGui") and not ancestor.Enabled then
                    visible = false
                    break
                end
                ancestor = ancestor.Parent
            end
            local w,h = field.AbsoluteSize.X,field.AbsoluteSize.Y
            if visible and w > 48 and h > 48 then
                for _,star in ipairs(data.stars) do
                    local phase = star.phase
                    local x = star.baseX + math.sin(t*star.rateX + phase) * star.driftX
                    local y = star.baseY + math.cos(t*star.rateY + phase) * star.driftY
                    star.x,star.y = x,y
                    star.gui.Position = UDim2.fromOffset(x*w,y*h)
                end
                for _,link in ipairs(data.links) do
                    local a,b = link.a,link.b
                    local dx,dy = (b.x-a.x)*w,(b.y-a.y)*h
                    link.gui.Position = UDim2.fromOffset((a.x+b.x)*w*.5,(a.y+b.y)*h*.5)
                    link.gui.Size = UDim2.fromOffset(math.sqrt(dx*dx+dy*dy),1)
                    link.gui.Rotation = math.deg(math.atan2(dy,dx))
                end
            end
        end
    end
end)

local window
local applyMenuTransparency
__aimV9.baseTransparency=setmetatable({}, {__mode="k"})
applyMenuTransparency=function()
    if not window or not window.Parent then return end
    for _,item in ipairs(window:GetDescendants()) do
        if item:IsA("GuiObject") and (item:IsA("Frame") or item:IsA("TextButton") or item:IsA("ScrollingFrame") or item:IsA("TextBox")) then
            if __aimV9.baseTransparency[item]==nil then __aimV9.baseTransparency[item]=item.BackgroundTransparency end
            local base=__aimV9.baseTransparency[item]
            if base<.9 then
                item.BackgroundTransparency=math.max(base,menuTransparency/100)
            end
        end
    end
end

window = Instance.new("Frame")
window.Name = "Window"
window.Size = UDim2.fromOffset(860, 535)
window.Position = UDim2.new(.5, -430, .5, -267)
window.BackgroundColor3 = Color3.fromRGB(11,16,27)
window.BorderSizePixel = 0
window.Active = true
window.Parent = gui
corner(window, 14)
stroke(window, Color3.fromRGB(66,91,129))

-- Dark/red panel backdrop; users can optionally set a background image in Settings.
__aimV9.bg = Instance.new("ImageLabel")
__aimV9.bg.Name = "AIM_WTF_Backdrop"
__aimV9.bg.Size = UDim2.fromScale(1, 1)
__aimV9.bg.BackgroundColor3 = Color3.fromRGB(9, 16, 29)
__aimV9.bg.BorderSizePixel = 0
__aimV9.bg.ScaleType = Enum.ScaleType.Crop
__aimV9.bg.Image = "" -- Default to the constellation design, regardless of previously saved images
__aimV9.bg.ImageTransparency = .88
__aimV9.bg.ZIndex = 1
__aimV9.bg.Parent = window
corner(__aimV9.bg, 3)
__aimV9.bgDarken = Instance.new("Frame")
__aimV9.bgDarken.Size = UDim2.fromScale(1, 1)
__aimV9.bgDarken.BackgroundColor3 = Color3.fromRGB(10, 17, 32)
__aimV9.bgDarken.BackgroundTransparency = 0.2
__aimV9.bgDarken.BorderSizePixel = 0
__aimV9.bgDarken.ZIndex = 2
__aimV9.bgDarken.Parent = __aimV9.bg
corner(__aimV9.bgDarken, 3)
addConstellationStars(__aimV9.bg,3)
-- Main controls remain above the stars.
-- Thin red accent across the top, matching the supplied AIM.WTF reference.
__aimV9.accentLine = Instance.new("Frame")
__aimV9.accentLine.Position = UDim2.fromOffset(0, 60)
__aimV9.accentLine.Size = UDim2.new(1, 0, 0, 2)
__aimV9.accentLine.BackgroundColor3 = Color3.fromRGB(100, 164, 255)
__aimV9.accentLine.BorderSizePixel = 0
__aimV9.accentLine.ZIndex = 5
__aimV9.accentLine.Parent = window

-- Plays after the key is accepted.
__aimV9.accessGrantedSound = Instance.new("Sound")
__aimV9.accessGrantedSound.Name = "AccessGrantedVoice"
__aimV9.accessGrantedSound.SoundId = assetUrl(__aimV9.ACCESS_GRANTED_SOUND_ID)
__aimV9.accessGrantedSound.Volume = 1
__aimV9.accessGrantedSound.Parent = SoundService -- UI sound should be non-spatial

local title = label(window, "AIM.WTF", UDim2.fromOffset(255,40), UDim2.fromOffset(22,6), 27, Color3.fromRGB(235, 244, 255), true)
title.ZIndex = 8
__aimV9.version = label(window, "CONSTELLATION  /  UNIVERSAL + MM2", UDim2.fromOffset(325,18), UDim2.fromOffset(23,39), 10, Color3.fromRGB(126, 166, 212))
__aimV9.version.ZIndex = 8
-- Monochrome identity chip: Star-inspired categories, a distinct AIM.WTF theme.
__aimV9.monoChip = Instance.new("TextLabel")
__aimV9.monoChip.Name = "MonoIdentity"
__aimV9.monoChip.Size = UDim2.fromOffset(142,25)
__aimV9.monoChip.Position = UDim2.fromOffset(302,18)
__aimV9.monoChip.BackgroundColor3 = Color3.fromRGB(27,48,78)
__aimV9.monoChip.BorderSizePixel = 0
__aimV9.monoChip.Text = "✦  CONSTELLATION"
__aimV9.monoChip.TextColor3 = Color3.fromRGB(168,205,255)
__aimV9.monoChip.TextSize = 11
__aimV9.monoChip.Font = Enum.Font.GothamBold
__aimV9.monoChip.ZIndex = 8
__aimV9.monoChip.Parent = window
corner(__aimV9.monoChip,7)
local close = button(window, "×", UDim2.fromOffset(32,32), UDim2.new(1,-46,0,14))
close.BackgroundColor3 = Color3.fromRGB(27,36,55)
close.TextColor3 = Color3.fromRGB(245,245,245)
close.TextSize = 25
close.ZIndex = 8

-- AIM_WTF_MOUSE_UNLOCK_PATCH: A PC cursor-release button and F2 fallback.
-- Only affects this client's cursor. Some games manage MouseBehavior each frame.
__aimV9.mouseUnlocked = false
__aimV9.savedMouseBehavior = nil
__aimV9.savedMouseIcon = nil
__aimV9.mouseToggle = button(window,"UNLOCK MOUSE  [F2]",UDim2.fromOffset(166,32),UDim2.fromOffset(467,14))
__aimV9.mouseToggle.TextSize = 11
__aimV9.mouseToggle.ZIndex = 9
__aimV9.mouseToggle.BackgroundColor3 = Color3.fromRGB(50,100,169)
__aimV9.mouseToggle.TextColor3 = Color3.fromRGB(248,251,255)

__aimV9.setMouseUnlocked = function(enabled)
    if not UIS.MouseEnabled then return end
    enabled = (enabled == true)
    if enabled == __aimV9.mouseUnlocked then return end
    if enabled then
        __aimV9.savedMouseBehavior = UIS.MouseBehavior
        __aimV9.savedMouseIcon = UIS.MouseIconEnabled
    end
    __aimV9.mouseUnlocked = enabled
    if enabled then
        pcall(function()
            UIS.MouseBehavior = Enum.MouseBehavior.Default
            UIS.MouseIconEnabled = true
        end)
    else
        pcall(function()
            -- Let the game take back cursor control as the menu closes.
            UIS.MouseBehavior = __aimV9.savedMouseBehavior or Enum.MouseBehavior.Default
            UIS.MouseIconEnabled = __aimV9.savedMouseIcon ~= false
        end)
    end
    __aimV9.mouseToggle.Text = enabled and "LOCK MOUSE  [F2]" or "UNLOCK MOUSE  [F2]"
    __aimV9.mouseToggle.BackgroundColor3 = enabled and Color3.fromRGB(53,53,53) or Color3.fromRGB(242,242,242)
    __aimV9.mouseToggle.TextColor3 = enabled and Color3.fromRGB(250,250,250) or Color3.fromRGB(12,12,12)
end
connect(__aimV9.mouseToggle.Activated,function()
    __aimV9.setMouseUnlocked(not __aimV9.mouseUnlocked)
end)
-- Reassert after the normal camera/input update in games that continually lock the cursor.
-- Do not interfere when the entire UI has been hidden.
RunService:BindToRenderStep("AIM_WTF_MouseUnlock",Enum.RenderPriority.Last.Value + 10,function()
    if not alive or not __aimV9.mouseUnlocked then return end
    if window.Visible or playerGui:FindFirstChild("AIM_WTF_KEY") then
        pcall(function()
            UIS.MouseBehavior = Enum.MouseBehavior.Default
            UIS.MouseIconEnabled = true
        end)
    end
end)
__aimV9.topDivider = Instance.new("Frame")
__aimV9.topDivider.Size = UDim2.new(1,-32,0,1)
__aimV9.topDivider.Position = UDim2.fromOffset(16,61)
__aimV9.topDivider.BackgroundColor3 = Color3.fromRGB(44,64,97)
__aimV9.topDivider.BorderSizePixel = 0
__aimV9.topDivider.ZIndex = 3
__aimV9.topDivider.Parent = window

main = Instance.new("Frame")
main.Size = UDim2.new(1,0,1,-82)
main.Position = UDim2.fromOffset(0,62)
main.BackgroundTransparency = 1
main.Visible = false
main.ZIndex = 5
main.Parent = window

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,230,1,0)
sidebar.BackgroundColor3 = Color3.fromRGB(13,20,34)
sidebar.BackgroundTransparency = 0.03
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 5
sidebar.Parent = main
-- The new Performance tab adds a sidebar entry; scrolling prevents overlap.
local tabScroller=Instance.new("ScrollingFrame")
tabScroller.Name="TabScroller"
tabScroller.Size=UDim2.new(1,0,1,-140)
tabScroller.Position=UDim2.fromOffset(0,35)
tabScroller.BackgroundTransparency=1
tabScroller.BorderSizePixel=0
tabScroller.ScrollBarThickness=3
tabScroller.ScrollingDirection=Enum.ScrollingDirection.Y
tabScroller.CanvasSize=UDim2.fromOffset(0,36*14+20)
tabScroller.ZIndex=6
tabScroller.Parent=sidebar
__aimV9.sideDivider = Instance.new("Frame")
__aimV9.sideDivider.Size = UDim2.new(0,1,1,0)
__aimV9.sideDivider.Position = UDim2.fromOffset(230,0)
__aimV9.sideDivider.BackgroundColor3 = Color3.fromRGB(43,68,101)
__aimV9.sideDivider.BorderSizePixel = 0
__aimV9.sideDivider.ZIndex = 4
__aimV9.sideDivider.Parent = main
__aimV9.footer = label(window, "AIM.WTF  •  RIGHT SHIFT: MENU  •  F2: CURSOR  •  UNIVERSAL / MM2", UDim2.new(1,0,0,18), UDim2.new(0,0,1,-18), 10, Color3.fromRGB(105,142,181), true)
__aimV9.footer.TextXAlignment = Enum.TextXAlignment.Center
__aimV9.footer.ZIndex = 6
-- MM2 MODE / OBSERVED ROLES ONLY (no remote inventory inspection or guessing)
-- Character and equipped Tools replicate; another player's unequipped Backpack
-- usually does not. A seen role expires after 20 seconds unless seen again.
__aimV9.MM2.enabled = function()
    return alive and armUnlocked and __aimV9.selectedGame == "MM2"
        and game.PlaceId == __aimV9.MM2.placeId
end
__aimV9.MM2.getRole = function(other)
    if not other or other.Parent ~= Players then return "Unknown" end
    local char=other.Character
    local record=__aimV9.MM2.roleRecords[other]
    if record and record.char ~= char then record=nil __aimV9.MM2.roleRecords[other]=nil end
    local function scan(container)
        if not container then return nil end
        for _,item in ipairs(container:GetChildren()) do
            if item:IsA("Tool") then
                local name=item.Name:lower()
                if name == "knife" then return "Murderer" end
                if name == "gun" then return "Sheriff / Hero" end
            end
        end
        return nil
    end
    local role=scan(char)
    -- Local player's Backpack is available, unlike other players' Backpacks.
    if not role and other == player then role=scan(other:FindFirstChildOfClass("Backpack")) end
    if role then
        __aimV9.MM2.roleRecords[other]={char=char, role=role, seen=os.clock()}
        return role
    end
    if record and os.clock()-record.seen<20 then return record.role end
    return "Unknown"
end
__aimV9.MM2.restoreParts = function(record)
    if not record or not record.parts then return end
    for _,entry in ipairs(record.parts) do
        local part, old=entry.part,entry.old
        if part and part.Parent then
            pcall(function()
                part.Material=old.material
                part.Color=old.color
                part.Transparency=old.transparency
                part.Reflectance=old.reflectance
                if old.variant~=nil then part.MaterialVariant=old.variant end
                if old.texture~=nil then part.TextureID=old.texture end
            end)
            for _,mesh in ipairs(entry.meshes or {}) do
                if mesh.part and mesh.part.Parent then
                    pcall(function() mesh.part.TextureId=mesh.value end)
                end
            end
        end
    end
    for _,garment in ipairs(record.garments or {}) do
        if garment.instance and garment.instance.Parent then
            pcall(function() garment.instance[garment.property]=garment.value end)
        end
    end
    for _,surf in ipairs(record.surfaces or {}) do
        if surf.instance and surf.parent and surf.parent.Parent then
            pcall(function() surf.instance.Parent=surf.parent end)
        end
    end
    record.garments=nil
    record.surfaces=nil
    record.parts=nil
end
__aimV9.MM2.clearVisual = function(other)
    local rec=__aimV9.MM2.visuals[other]
    if not rec then return end
    __aimV9.MM2.restoreParts(rec)
    if rec.highlight then rec.highlight:Destroy() end
    if rec.tag then rec.tag:Destroy() end
    __aimV9.MM2.visuals[other]=nil
end
__aimV9.MM2.clearAll = function()
    for other in pairs(__aimV9.MM2.visuals) do __aimV9.MM2.clearVisual(other) end
    __aimV9.MM2.target=nil
end
__aimV9.MM2.update = function()
    if not __aimV9.MM2.enabled() then
        if next(__aimV9.MM2.visuals) then __aimV9.MM2.clearAll() end
        return
    end
    for _,other in ipairs(Players:GetPlayers()) do
        if other~=player then
            local char=other.Character
            local hum=char and char:FindFirstChildOfClass("Humanoid")
            local aliveChar=hum and hum.Health>0
            local role=aliveChar and __aimV9.MM2.getRole(other) or "Unknown"
            local murderer=role=="Murderer"
            local sheriff=role=="Sheriff / Hero"
            local esp=(murderer and state.MM2MurdererESP) or (sheriff and state.MM2SheriffESP)
            local material=(murderer and state.MM2MurdererChams) or (sheriff and state.MM2SheriffChams)
            local color=murderer and Color3.fromRGB(255,65,85) or Color3.fromRGB(70,170,255)
            local record=__aimV9.MM2.visuals[other]
            if (not esp and not material) or not char then
                if record then __aimV9.MM2.clearVisual(other) end
            else
                if record and (record.char~=char or record.role~=role) then
                    __aimV9.MM2.clearVisual(other)
                    record=nil
                end
                if not record then
                    record={char=char,role=role}
                    __aimV9.MM2.visuals[other]=record
                    local h=Instance.new("Highlight")
                    h.Name="AIMWTF_MM2RoleHighlight"
                    h.Adornee=char
                    h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
                    h.Parent=char
                    record.highlight=h
                    local head=char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
                    if head then
                        local bill=Instance.new("BillboardGui")
                        bill.Name="AIMWTF_MM2RoleLabel"
                        bill.Size=UDim2.fromOffset(180,30)
                        bill.StudsOffsetWorldSpace=Vector3.new(0,2.7,0)
                        bill.AlwaysOnTop=true
                        bill.Adornee=head
                        bill.Parent=char
                        local txt=Instance.new("TextLabel")
                        txt.Size=UDim2.fromScale(1,1)
                        txt.BackgroundTransparency=1
                        txt.TextStrokeTransparency=.4
                        txt.Font=Enum.Font.GothamBold
                        txt.TextSize=13
                        txt.TextColor3=color
                        txt.Text=role:upper().." | "..other.DisplayName
                        txt.Parent=bill
                        record.tag=bill
                    end
                end
                record.highlight.FillColor=color
                record.highlight.OutlineColor=color
                record.highlight.FillTransparency=material and .76 or .96
                record.highlight.OutlineTransparency=esp and 0 or 1
                if record.tag then record.tag.Enabled=esp end
                if material then
                    if not record.parts then
                        record.parts={}
                        record.garments={}
                        record.surfaces={}
                        for _,part in ipairs(char:GetDescendants()) do
                            if part:IsA("BasePart") and part.Name~="HumanoidRootPart"
                                and not part:FindFirstAncestorOfClass("Accessory")
                                and not part:FindFirstAncestorOfClass("Tool")
                                and part.Transparency<.96 then
                                local old={material=part.Material,color=part.Color,transparency=part.Transparency,reflectance=part.Reflectance}
                                pcall(function() old.variant=part.MaterialVariant end)
                                if part:IsA("MeshPart") then
                                    pcall(function() old.texture=part.TextureID part.TextureID="" end)
                                end
                                local entry={part=part,old=old,meshes={}}
                                for _,child in ipairs(part:GetDescendants()) do
                                    if child:IsA("SpecialMesh") then
                                        table.insert(entry.meshes,{part=child,value=child.TextureId})
                                        pcall(function() child.TextureId="" end)
                                    elseif child:IsA("SurfaceAppearance") then
                                        table.insert(record.surfaces,{instance=child,parent=child.Parent})
                                        pcall(function() child.Parent=nil end)
                                    end
                                end
                                pcall(function() part.MaterialVariant="" end)
                                table.insert(record.parts,entry)
                            elseif part:IsA("Shirt") or part:IsA("Pants") or part:IsA("ShirtGraphic") then
                                local field=part:IsA("Shirt") and "ShirtTemplate"
                                    or part:IsA("Pants") and "PantsTemplate" or "Graphic"
                                table.insert(record.garments,{instance=part,property=field,value=part[field]})
                                pcall(function() part[field]="" end)
                            end
                        end
                    end
                    local finish=CHAM_MATERIALS[chamFinishIndex] or CHAM_MATERIALS[1]
                    for _,entry in ipairs(record.parts) do
                        local part=entry.part
                        if part and part.Parent then
                            pcall(function()
                                if part.Material~=finish.material then part.Material=finish.material end
                                if part.Color~=color then part.Color=color end
                                if part.Reflectance~=finish.reflectance then part.Reflectance=finish.reflectance end
                                if part.Transparency~=finish.transparency then part.Transparency=finish.transparency end
                            end)
                        end
                    end
                elseif record.parts then
                    __aimV9.MM2.restoreParts(record)
                end
            end
        end
    end
    for other in pairs(__aimV9.MM2.visuals) do
        if other.Parent~=Players then __aimV9.MM2.clearVisual(other) end
    end
end
__aimV9.MM2.desiredRole = function()
    if __aimV9.MM2.aimRoleIndex==2 then return "Murderer" end
    if __aimV9.MM2.aimRoleIndex==3 then return "Sheriff / Hero" end
    return __aimV9.MM2.getRole(player)=="Murderer" and "Sheriff / Hero" or "Murderer"
end
__aimV9.MM2.aimFrame = function(dt)
    if not __aimV9.MM2.enabled() or not state.MM2Aim or window.Visible
        or (__aimV9.MOBILE.menu and __aimV9.MOBILE.menu.Visible)
        or UIS:GetFocusedTextBox() then
        __aimV9.MM2.target=nil
        return
    end
    local rightClick=UIS.MouseEnabled and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    if not rightClick and not __aimV9.MOBILE.aiming then return end
    local cam=workspace.CurrentCamera
    if not cam then return end
    local desiredRole=__aimV9.MM2.desiredRole()
    local target=__aimV9.MM2.target
    if not target or not target.Parent or os.clock()-__aimV9.MM2.lastAimScan>.08 then
        __aimV9.MM2.lastAimScan=os.clock()
        target=nil
        local center=cam.ViewportSize*.5
        local closest=__aimV9.MM2.aimFOV
        for _,other in ipairs(Players:GetPlayers()) do
            if other~=player and __aimV9.MM2.getRole(other)==desiredRole then
                local char=other.Character
                local hum=char and char:FindFirstChildOfClass("Humanoid")
                local head=char and (char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart"))
                if head and hum and hum.Health>0 then
                    local projection,inView=cam:WorldToViewportPoint(head.Position)
                    local d=(Vector2.new(projection.X,projection.Y)-center).Magnitude
                    if inView and projection.Z>0 and d<closest then
                        local visible=true
                        if state.MM2VisibleOnly then
                            local params=RaycastParams.new()
                            params.FilterType=Enum.RaycastFilterType.Exclude
                            params.FilterDescendantsInstances=player.Character and {player.Character} or {}
                            local hit=workspace:Raycast(cam.CFrame.Position,head.Position-cam.CFrame.Position,params)
                            visible=(not hit) or hit.Instance:IsDescendantOf(char)
                        end
                        if visible then closest=d target=head end
                    end
                end
            end
        end
        __aimV9.MM2.target=target
    end
    if target and target.Parent then
        local speed=2+(100-__aimV9.MM2.aimSmoothness)*.22
        local alpha=1-math.exp(-speed*math.min(dt,.1))
        cam.CFrame=cam.CFrame:Lerp(CFrame.lookAt(cam.CFrame.Position,target.Position),alpha)
    end
end
connect(RunService.Heartbeat,function()
    if not alive or not armUnlocked then return end
    if os.clock()-__aimV9.MM2.lastVisualScan>=.2 then
        __aimV9.MM2.lastVisualScan=os.clock()
        __aimV9.MM2.update()
    end
end)
connect(RunService.RenderStepped,function(dt)
    if alive and armUnlocked then __aimV9.MM2.aimFrame(dt) end
end)

-- DANCE (client plays through the character's server-created Animator).
-- Roblox decides which assets can load and whether they replicate to other clients.
-- No per-frame loop; Action priority is chosen to avoid stopping when walking.
__aimV9.dance = {track=nil, name="None", lastError="Select a dance"}
__aimV9.dance.defaults = {
    ["Dance 1"]="507771019",
    ["Dance 2"]="507776043",
    ["Dance 3"]="507777268",
}
__aimV9.dance.stop=function()
    if __aimV9.dance.track then
        pcall(function() __aimV9.dance.track:Stop(0.17) end)
        __aimV9.dance.track=nil
    end
    __aimV9.dance.name="None"
end
__aimV9.dance.play=function(name)
    __aimV9.dance.stop()
    local id = name=="Take The L" and __aimV9.danceAssetId or __aimV9.dance.defaults[name]
    if type(id)~="string" or not id:match("^%d+$") then
        __aimV9.dance.lastError="Take The L requires an animation ID you can use."
        return false,__aimV9.dance.lastError
    end
    local char=player.Character
    local hum=char and char:FindFirstChildOfClass("Humanoid")
    local animator=hum and hum:FindFirstChildOfClass("Animator")
    if not animator then
        __aimV9.dance.lastError="Server-created Animator not available."
        return false,__aimV9.dance.lastError
    end
    local anim=Instance.new("Animation")
    anim.AnimationId="rbxassetid://"..id
    local success,track=pcall(function() return animator:LoadAnimation(anim) end)
    anim:Destroy()
    if not success or not track then
        __aimV9.dance.lastError="Animation couldn't load (check asset permissions / rig)."
        return false,__aimV9.dance.lastError
    end
    track.Priority=Enum.AnimationPriority.Action
    track.Looped=true
    track:Play(0.2,1,__aimV9.danceSpeedPercent/100)
    __aimV9.dance.track=track
    __aimV9.dance.name=name
    __aimV9.dance.lastError="Playing: "..name..". Moving stays enabled."
    return true,__aimV9.dance.lastError
end
connect(player.CharacterAdded,function()
    __aimV9.dance.stop()
end)

-- OWNER ADMIN: commands can affect other players only if the owner installs
-- AIM_WTF_OWNER_ADMIN_SERVER.lua in ServerScriptService in their own experience.
__aimV9.admin = {touchFling=false,flingStrength=145,lastStatus="Owner server required"}
__aimV9.admin.send=function(command,value)
    local remote=ReplicatedStorage:FindFirstChild("AIM_WTF_OwnerAdminActions")
    if not remote or not remote:IsA("RemoteEvent") then
        __aimV9.admin.lastStatus="No owner server installed; unavailable in public games."
        return false
    end
    remote:FireServer(command,value)
    __aimV9.admin.lastStatus="Requested "..command.." (only if server authorizes you)."
    return true
end
__aimV9.admin.setFling=function(enabled)
    __aimV9.admin.touchFling=enabled and true or false
    __aimV9.admin.send("touch_fling",{enabled=__aimV9.admin.touchFling,strength=__aimV9.admin.flingStrength})
end

-- PERFORMANCE TAB / UNIVERSAL + MM2 --------------------------------------
-- These are visual-only changes. Preserve the original client-side appearance
-- so LOW TEXTURE can be undone and the game doesn't need to be restarted.
local perf=__aimV9.perf
local function perfSetter()
    local setter=nil
    if type(setfpscap)=="function" then setter=setfpscap end
    if not setter then
        pcall(function()
            if type(getgenv)=="function" then
                local env=getgenv()
                if type(env)=="table" and type(env.setfpscap)=="function" then
                    setter=env.setfpscap
                end
            end
        end)
    end
    return setter
end

local function perfApplyProperty(inst, prop, value)
    if not inst then return end
    local records=perf.originals[inst]
    if not records then records={} perf.originals[inst]=records end
    if records[prop]~=nil then return end
    pcall(function()
        local original=inst[prop]
        if original~=value then
            inst[prop]=value
            records[prop]=original
        end
    end)
end

local function perfIsCharacterOrTool(obj)
    local current=obj
    for _=1,9 do
        if not current or current==workspace then return false end
        if current:IsA("Tool") or current==workspace.CurrentCamera then return true end
        if current:IsA("Model") and current:FindFirstChildOfClass("Humanoid") then return true end
        current=current.Parent
    end
    return false
end

local function perfDowngrade(obj)
    if not obj or not obj.Parent or perf.originals[obj] or perfIsCharacterOrTool(obj) then return end
    if obj:IsA("BasePart") then
        perfApplyProperty(obj,"Material",Enum.Material.SmoothPlastic)
        perfApplyProperty(obj,"Reflectance",0)
        perfApplyProperty(obj,"CastShadow",false)
        -- MeshPart texture resolution can dominate the visual appearance.
        if obj:IsA("MeshPart") then
            perfApplyProperty(obj,"TextureID","")
        end
        if obj:IsA("UnionOperation") then
            perfApplyProperty(obj,"UsePartColor",true)
        end
    elseif obj:IsA("Terrain") then
        perfApplyProperty(obj,"WaterWaveSize",0)
        perfApplyProperty(obj,"WaterWaveSpeed",0)
        perfApplyProperty(obj,"WaterReflectance",0)
        perfApplyProperty(obj,"WaterTransparency",1)
    elseif obj:IsA("SurfaceAppearance") then
        for _,texture in ipairs({"ColorMap","MetalnessMap","NormalMap","RoughnessMap"}) do
            perfApplyProperty(obj,texture,"")
        end
    elseif obj:IsA("Decal") or obj:IsA("Texture") then
        perfApplyProperty(obj,"Transparency",1)
    elseif obj:IsA("SpecialMesh") then
        perfApplyProperty(obj,"TextureId","")
    elseif obj:IsA("ParticleEmitter") or obj:IsA("Beam") or obj:IsA("Trail")
        or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles")
        or obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight")
        or obj:IsA("PostEffect") then
        perfApplyProperty(obj,"Enabled",false)
    elseif obj:IsA("Atmosphere") then
        perfApplyProperty(obj,"Density",0)
        perfApplyProperty(obj,"Haze",0)
        perfApplyProperty(obj,"Glare",0)
    elseif obj:IsA("Clouds") then
        perfApplyProperty(obj,"Cover",0)
    end
end

function perf.setLow(enabled,skipSave)
    perf.initialLowTexture=false -- Initial saved preference has been applied.
    enabled=enabled==true
    if perf.lowTexture==enabled then perf.updateUI() return end
    perf.lowTexture=enabled
    perf.token+=1
    local token=perf.token
    if not enabled then
        if perf.effectsConnection then perf.effectsConnection:Disconnect() perf.effectsConnection=nil end
        local restored=0
        for obj,old in pairs(perf.originals) do
            if obj and obj.Parent then
                for property,value in pairs(old) do
                    pcall(function() obj[property]=value end)
                end
                restored+=1
            end
            perf.originals[obj]=nil
        end
        perf.graphicsStatus="Graphics restored on "..restored.." objects."
        perf.updateUI()
        if not skipSave then queueSaveSettings() end
        return
    end
    perf.graphicsStatus="Applying potato graphics in small batches..."
    perfApplyProperty(__aimV9.Lighting,"GlobalShadows",false)
    perfApplyProperty(__aimV9.Lighting,"EnvironmentDiffuseScale",0)
    perfApplyProperty(__aimV9.Lighting,"EnvironmentSpecularScale",0)
    for _,obj in ipairs(__aimV9.Lighting:GetDescendants()) do perfDowngrade(obj) end
    perfDowngrade(workspace.Terrain)
    perf.effectsConnection=connect(workspace.DescendantAdded,function(obj)
        if perf.lowTexture and alive then
            task.defer(function()
                if perf.lowTexture and alive and perf.token==token then perfDowngrade(obj) end
            end)
        end
    end)
    task.spawn(function()
        local objects=workspace:GetDescendants()
        local changed=0
        for index,obj in ipairs(objects) do
            if not alive or not perf.lowTexture or perf.token~=token then return end
            perfDowngrade(obj)
            changed+=1
            if index%125==0 then task.wait() end -- avoid one-frame freezes
        end
        if alive and perf.lowTexture and perf.token==token then
            perf.graphicsStatus="LOW TEXTURE active. Scanned "..changed.." world objects."
            perf.updateUI()
        end
    end)
    perf.updateUI()
    if not skipSave then queueSaveSettings() end
end

function perf.setCap(target)
    target=math.floor(tonumber(target) or 0)
    if target~=0 then target=math.clamp(target,60,500) end
    perf.fpsTarget=target
    local setter=perfSetter()
    if target==0 then
        if setter and perf.capChanged and perf.prevCap then
            local ok=pcall(setter,perf.prevCap)
            perf.fpsStatus=ok and "Previous FPS cap restored." or "Couldn't restore previous FPS cap."
        else
            perf.fpsStatus="Use Roblox Settings > Maximum Frame Rate to change the official cap."
        end
        perf.capChanged=false
        perf.prevCap=nil
    elseif not setter then
        perf.fpsStatus="No FPS cap function in this runtime. Roblox's official max is 240 FPS."
    else
        local ok,previous=pcall(setter,target)
        if ok then
            if not perf.capChanged and type(previous)=="number" and previous>0 then
                perf.prevCap=previous
            end
            perf.capChanged=true
            perf.fpsStatus="Requested "..target.." FPS cap. Actual FPS may remain lower or limited."
        else
            perf.fpsStatus="FPS cap request was rejected by this runtime."
        end
    end
    perf.updateUI()
    queueSaveSettings()
end

function perf.restoreCap()
    local setter=perfSetter()
    if perf.capChanged and perf.prevCap and setter then
        pcall(setter,perf.prevCap)
    end
    perf.capChanged=false
end

local fpsAccumulator, fpsFrames=0,0
connect(RunService.RenderStepped,function(dt)
    if not alive then return end
    fpsFrames+=1
    fpsAccumulator+=dt
    if fpsAccumulator>=1 then
        perf.fps=math.floor(fpsFrames/math.max(fpsAccumulator,.001)+.5)
        fpsAccumulator=0 fpsFrames=0
        if __aimV9.pages and __aimV9.pages.Performance
            and __aimV9.pages.Performance.Visible then
            perf.updateUI()
        end
    end
end)
-- -------------------------------------------------------------------------


-- World ambience is local and is independent of LOW TEXTURE.
local ambience=__aimV9.ambience
local ambiancePresets={
    [2]={Ambient=Color3.fromRGB(37,41,77), OutdoorAmbient=Color3.fromRGB(32,36,70),
        FogColor=Color3.fromRGB(24,27,56), FogStart=20, FogEnd=430,
        ClockTime=0, Brightness=1.15, ExposureCompensation=-.22},
    [3]={Ambient=Color3.fromRGB(112,44,173), OutdoorAmbient=Color3.fromRGB(107,62,166),
        FogColor=Color3.fromRGB(57,20,91), FogStart=30, FogEnd=600,
        ClockTime=19, Brightness=2, ExposureCompensation=.12,
        ColorShift_Top=Color3.fromRGB(116,41,190)},
    [4]={Ambient=Color3.fromRGB(45,109,184), OutdoorAmbient=Color3.fromRGB(57,130,207),
        FogColor=Color3.fromRGB(57,104,156), FogStart=50, FogEnd=770,
        ClockTime=6.5, Brightness=2, ExposureCompensation=.08},
    [5]={Ambient=Color3.fromRGB(184,106,68), OutdoorAmbient=Color3.fromRGB(214,136,76),
        FogColor=Color3.fromRGB(218,146,111), FogStart=95, FogEnd=900,
        ClockTime=17.7, Brightness=2.4, ExposureCompensation=.07},
    [6]={Ambient=Color3.fromRGB(127,138,153), OutdoorAmbient=Color3.fromRGB(150,163,171),
        FogColor=Color3.fromRGB(151,168,182), FogStart=15, FogEnd=165,
        ClockTime=9, Brightness=1.55, ExposureCompensation=-.05},
}
function ambience.apply(index,skipSave)
    index=math.clamp(math.floor(tonumber(index) or 1),1,#ambience.presets)
    ambience.index=index
    -- First restore ALL lighting properties managed by ambience (avoids a
    -- purple color-shift accidentally carrying over into another preset).
    for prop,value in pairs(ambience.original) do pcall(function() __aimV9.Lighting[prop]=value end) end
    if index>1 then
        local selected=ambiancePresets[index]
        if index==7 then
            local tint=Color3.fromRGB(ambience.customR,ambience.customG,ambience.customB)
            selected={Ambient=tint,OutdoorAmbient=tint,
                FogColor=tint, FogStart=45, FogEnd=750,
                ClockTime=14,Brightness=1.9,ExposureCompensation=.05}
        end
        for prop,value in pairs(selected or {}) do
            pcall(function() __aimV9.Lighting[prop]=value end)
        end
    else
        -- Respect a separately selected clock override.
        if __aimV9.clockTimeOverride~=nil then applyClientTime() end
    end
    ambience.refresh()
    if not skipSave then queueSaveSettings() end
end

__aimV9.trail={attachments={},effect=nil,refreshAt=0}
local function clearPlayerTrail()
    if __aimV9.trail.effect then __aimV9.trail.effect:Destroy() __aimV9.trail.effect=nil end
    for _,obj in ipairs(__aimV9.trail.attachments) do if obj then obj:Destroy() end end
    table.clear(__aimV9.trail.attachments)
end
local function refreshPlayerTrail()
    if not alive or not armUnlocked or not state.PlayerTrail then clearPlayerTrail() return end
    local char=player.Character
    local root=char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if __aimV9.trail.effect and __aimV9.trail.effect.Parent==root then return end
    clearPlayerTrail()
    local pair={}
    for _,x in ipairs({-.5,.5}) do
        local att=Instance.new("Attachment")
        att.Name="AIM_WTF_FootprintTrail_Attachment"
        att.Position=Vector3.new(x,-2.55,.15)
        att.Parent=root
        pair[#pair+1]=att
        table.insert(__aimV9.trail.attachments,att)
    end
    local trail=Instance.new("Trail")
    trail.Name="AIM_WTF_Walk_Trail"
    trail.Attachment0=pair[1]
    trail.Attachment1=pair[2]
    trail.Lifetime=.45
    trail.MinLength=.1
    trail.MaxLength=20
    trail.LightEmission=.55
    trail.FaceCamera=true
    trail.Color=ColorSequence.new(Color3.fromRGB(124,199,255), Color3.fromRGB(245,245,255))
    trail.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,.17),NumberSequenceKeypoint.new(1,1)})
    trail.WidthScale=NumberSequence.new({NumberSequenceKeypoint.new(0,.9),NumberSequenceKeypoint.new(1,0)})
    trail.Parent=root
    __aimV9.trail.effect=trail
end
__aimV9.refreshPlayerTrail=refreshPlayerTrail
__aimV9.clearPlayerTrail=clearPlayerTrail
connect(player.CharacterAdded,function()
    task.defer(function()
        if alive and armUnlocked and state.PlayerTrail then refreshPlayerTrail() end
    end)
end)
connect(RunService.Heartbeat,function()
    if not alive or not armUnlocked then return end
    local now=os.clock()
    if now-__aimV9.trail.refreshAt<.14 then return end
    __aimV9.trail.refreshAt=now
    if state.PlayerTrail then
        refreshPlayerTrail()
        local trail=__aimV9.trail.effect
        local hum=player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if trail and hum then trail.Enabled=hum.MoveDirection.Magnitude>.075 end
    end
end)

function __aimV9.keybindSet(feature,keyName)
    if not table.find(__aimV9.keybindNames,feature) then return end
    if keyName~="NONE" then
        local key=nil
        pcall(function() key=Enum.KeyCode[keyName] end)
        if not key or key==Enum.KeyCode.Unknown then return end
        -- Reserved controls and movement keys should not interfere with the game.
        if table.find({"W","A","S","D","Space","Escape","Return","F2","RightShift"},keyName) then return end
        for _,other in ipairs(__aimV9.keybindNames) do
            if other~=feature and __aimV9.keybinds[other]==keyName then
                __aimV9.keybinds[other]="NONE"
            end
        end
    end
    __aimV9.keybinds[feature]=keyName
    __aimV9.keybindRefresh()
    queueSaveSettings()
end

do
local navigationTitle=label(sidebar,"  WORKSPACE  /  NAVIGATION",UDim2.new(1,-18,0,24),UDim2.fromOffset(11,7),10,Color3.fromRGB(100,145,202),true)
navigationTitle.ZIndex=6
end
__aimV9.tabs = {"Games", "MM2", "ESP", "Movement", "Performance", "Ambience", "Keybinds", "Dance", "Admin", "Aim", "Camera", "Chat", "Watch", "Cosmetics", "Configs", "Settings"}
__aimV9.tabButtons = {}
__aimV9.pages = {}
for idx,name in ipairs(__aimV9.tabs) do
    local tb = button(tabScroller, "  " .. name, UDim2.fromOffset(205,31), UDim2.fromOffset(13,10+(idx-1)*36))
    tb.TextXAlignment = Enum.TextXAlignment.Left
    tb.BackgroundColor3=Color3.fromRGB(20,31,49)
    tb.TextColor3=Color3.fromRGB(198,215,239)
    local tabBorder=Instance.new("UIStroke")
    tabBorder.Color=Color3.fromRGB(42,67,98)
    tabBorder.Transparency=.30
    tabBorder.Thickness=1
    tabBorder.Parent=tb
    tb.ZIndex = 5
    __aimV9.tabButtons[name] = tb
    local page = Instance.new("Frame")
    page.Name = name
    page.Size = UDim2.new(1,-260,1,-24)
    page.Position = UDim2.fromOffset(248,13)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ZIndex = 3
    page.Parent = main
    __aimV9.pages[name] = page
end
-- The player profile appears in the bottom-left corner of the sidebar.
-- It displays only the current local player's public Roblox identity.
do
local profileCard=Instance.new("Frame")
profileCard.Name="AccountProfileCard"
profileCard.Size=UDim2.new(1,-16,0,92)
profileCard.Position=UDim2.new(0,8,1,-101)
profileCard.BackgroundColor3=Color3.fromRGB(22,34,55)
profileCard.BorderSizePixel=0
profileCard.ZIndex=7
profileCard.Parent=sidebar
corner(profileCard,10)
stroke(profileCard,Color3.fromRGB(51,81,119))
local profileAvatar=Instance.new("ImageLabel")
profileAvatar.Name="RobloxAvatar"
profileAvatar.Size=UDim2.fromOffset(44,44)
profileAvatar.Position=UDim2.fromOffset(9,10)
profileAvatar.BackgroundColor3=Color3.fromRGB(41,65,96)
profileAvatar.BorderSizePixel=0
profileAvatar.Image=""
profileAvatar.ZIndex=9
profileAvatar.Parent=profileCard
corner(profileAvatar,11)
__aimV9.profileName=label(profileCard,player.DisplayName,UDim2.new(1,-69,0,19),UDim2.fromOffset(62,9),13,Color3.fromRGB(244,248,255),true)
__aimV9.profileName.TextTruncate=Enum.TextTruncate.AtEnd
__aimV9.profileName.ZIndex=9
__aimV9.userLabel=label(profileCard,"@"..player.Name,UDim2.new(1,-69,0,17),UDim2.fromOffset(62,28),11,Color3.fromRGB(148,177,210))
__aimV9.userLabel.TextTruncate=Enum.TextTruncate.AtEnd
__aimV9.userLabel.ZIndex=9
local profileDivider=Instance.new("Frame")
profileDivider.Size=UDim2.new(1,-20,0,1)
profileDivider.Position=UDim2.fromOffset(10,58)
profileDivider.BackgroundColor3=Color3.fromRGB(51,72,100)
profileDivider.BorderSizePixel=0
profileDivider.ZIndex=9
profileDivider.Parent=profileCard
__aimV9.timeLabel=label(profileCard,"LOCAL TIME  •  --:--",UDim2.new(1,-19,0,22),UDim2.fromOffset(10,63),11,Color3.fromRGB(161,198,239),true)
__aimV9.timeLabel.ZIndex=9
__aimV9.lastClockTick=0
task.spawn(function()
    local ok,thumbnail=pcall(function()
        return Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size150x150)
    end)
    if ok and alive and profileAvatar.Parent then profileAvatar.Image=thumbnail end
end)
end
local function selectTab(name)
    for n,page in pairs(__aimV9.pages) do
        page.Visible = (n==name)
        __aimV9.tabButtons[n].BackgroundColor3 = (n==name) and Color3.fromRGB(58,110,182) or Color3.fromRGB(20,31,49)
        __aimV9.tabButtons[n].TextColor3 = (n==name) and Color3.fromRGB(255,255,255) or Color3.fromRGB(196,216,241)
    end
end
-- The Games page is the entry point on PC and mobile. The selected game
-- changes the visible feature tabs; it does not discard stored settings.
__aimV9.gameChanged = function() end
__aimV9.selectGame = function(mode)
    if mode~="Universal" and mode~="MM2" then return end
    __aimV9.selectedGame=mode
    __aimV9.MM2.clearAll()
    __aimV9.MM2.roleRecords={}
    __aimV9.MM2.target=nil
    local index=0
    for _,name in ipairs(__aimV9.tabs) do
        local visible=name=="Games" or name=="Settings" or name=="Configs"
            or (mode=="MM2" and (name=="MM2" or name=="Movement" or name=="Performance" or name=="Ambience" or name=="Keybinds" or name=="Dance" or name=="Admin"))
            or (mode=="Universal" and name~="MM2" and name~="Games")
        local b=__aimV9.tabButtons[name]
        b.Visible=visible
        if visible then
            b.Position=UDim2.fromOffset(13,10+index*36)
            index+=1
        end
    end
    tabScroller.CanvasSize=UDim2.fromOffset(0,10+index*36)
    if __aimV9.gameLabels then
        __aimV9.gameLabels.universal.Text=mode=="Universal" and "1   UNIVERSAL     [SELECTED]" or "1   UNIVERSAL"
        __aimV9.gameLabels.mm2.Text=mode=="MM2" and "2   MM2     [SELECTED]" or "2   MM2"
    end
    selectTab(mode=="MM2" and "MM2" or "ESP")
    __aimV9.gameChanged()
    if __aimV9.onConfigGameChanged then __aimV9.onConfigGameChanged() end
    queueSaveSettings()
end
for _,name in ipairs(__aimV9.tabs) do
    connect(__aimV9.tabButtons[name].MouseButton1Click,function()
        if name=="MM2" and __aimV9.selectedGame~="MM2" then return end
        selectTab(name)
    end)
end

__aimV9.switchButtons = {}
__aimV9.toggleActions = {}
__aimV9.updateESPPreview = function() end
local function makeToggle(page, name, desc, index)
    local y = 56+(index-1)*58
    local base = Instance.new("Frame")
    base.Size = UDim2.new(1,-12,0,50)
    base.Position = UDim2.fromOffset(0,y)
    base.BackgroundColor3 = Color3.fromRGB(19,29,47)
    base.ZIndex = 4
    base.Parent = page
    corner(base,8)
    stroke(base,Color3.fromRGB(46,71,104))
    local t = label(base,name,UDim2.fromOffset(280,23),UDim2.fromOffset(13,5),14,nil,true)
    t.ZIndex=5
    local d = label(base,desc,UDim2.fromOffset(320,18),UDim2.fromOffset(13,28),11,Color3.fromRGB(135,138,154))
    d.ZIndex=5
    local b = button(base,state[name] and "ON" or "OFF",UDim2.fromOffset(66,31),UDim2.new(1,-78,0,10))
    b.TextColor3 = state[name] and Color3.fromRGB(255,255,255) or Color3.fromRGB(206,225,247)
    b.BackgroundColor3 = state[name] and Color3.fromRGB(68,129,212) or Color3.fromRGB(32,46,69)
    b.ZIndex=6
    __aimV9.switchButtons[name] = b
    __aimV9.toggleActions[name] = function()
        state[name] = not state[name]
        b.Text = state[name] and "ON" or "OFF"
        b.TextColor3 = state[name] and Color3.fromRGB(255,255,255) or Color3.fromRGB(206,225,247)
        b.BackgroundColor3 = state[name] and Color3.fromRGB(68,129,212) or Color3.fromRGB(32,46,69)
        if string.sub(name,1,3)=="MM2" then
            __aimV9.MM2.lastVisualScan=-math.huge
            __aimV9.MM2.update()
        end
        if name == "TeamCheck" then
            cleanESP() clearAllSkeletons() clearGlossyChams() restoreEnemyHeads()
        end
        if name == "Chams" or name == "GlossyChams" or name == "TeamCheck" then
            __aimV9.lastGlossyTick = -math.huge
        end
        if (name == "ESP" or name == "BloxESP") and not state.ESP and not state.BloxESP then
            clearNameTags()
            if not state.Chams then cleanESP() end
        end
        if name == "Chams" and not state.Chams and not state.ESP then cleanESP() end
        if name == "AimAssist" or name == "StickyAim" then
            __aimV9.lockedTarget = nil
            if name == "AimAssist" and not state.AimAssist then __aimV9.MOBILE.aiming=false end
        end
        if (name == "Spinbot" or name == "AntiAim" or name == "BloxSpinbot") and not state.Spinbot and not state.AntiAim and not state.BloxSpinbot then
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum and __aimV9.oldAutoRotate ~= nil then hum.AutoRotate = __aimV9.oldAutoRotate end
            __aimV9.oldAutoRotate = nil
        end
        if name == "SkeletonESP" and not state.SkeletonESP then clearAllSkeletons() end
        if name == "HeadExpander" then updateEnemyHeads() end
        if name == "TungTung" then updateTung() end
        if name == "GhostDecoy" and not state.GhostDecoy and __aimV9.ghostVisuals then __aimV9.ghostVisuals:Destroy() __aimV9.ghostVisuals=nil end
        if (name == "GlossyChams" or name == "Chams") and not state.GlossyChams and not state.Chams then
            clearGlossyChams()
        end
        if name == "Arms" then updateArmExtender() end
        if name == "PlayerTrail" then refreshPlayerTrail() end
        if name == "GunSeeThrough" then applyGunAppearance() end
        if name == "NoGunCooldown" then
            __aimV9.applyFireControls(activeTool())
            __aimV9.lastGunShot = -math.huge
        end
        if name == "ThirdPerson" then updateCameraSettings() end
        if name == "Noclip" and not state.Noclip then restoreCollision() end
        if (name == "Speed" or name == "Jump") and not state.Speed and not state.Jump then restoreMovement() end
        if name == "Fly" and not state.Fly then
            local char = player.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then root.AssemblyLinearVelocity = Vector3.zero end
        end
        __aimV9.updateESPPreview()
        queueSaveSettings()
    end
    connect(b.MouseButton1Click,__aimV9.toggleActions[name])
end

__aimV9.espScroll=Instance.new("ScrollingFrame")
__aimV9.espScroll.Name="ESPScroll"
__aimV9.espScroll.Size=UDim2.fromScale(1,1)
__aimV9.espScroll.CanvasSize=UDim2.fromOffset(0,1230)
__aimV9.espScroll.ScrollBarThickness=4
__aimV9.espScroll.BackgroundTransparency=1
__aimV9.espScroll.BorderSizePixel=0
__aimV9.espScroll.ZIndex=4
__aimV9.espScroll.Parent=__aimV9.pages.ESP
label(__aimV9.espScroll,"ESP / CHAMS",UDim2.fromOffset(350,31),UDim2.fromOffset(0,6),18,nil,true).ZIndex=5
makeToggle(__aimV9.espScroll,"ESP","Enemy name, distance, and outline",1)
makeToggle(__aimV9.espScroll,"TeamCheck","Hide teammates from highlights and targeting",2)
makeToggle(__aimV9.espScroll,"Chams","Wall outline + selected material on characters",3)
makeToggle(__aimV9.espScroll,"GlossyChams","Material-only chams (no wall fill needed)",4)
makeToggle(__aimV9.espScroll,"FacingESP","Arrow showing enemy look direction",5)
makeToggle(__aimV9.espScroll,"SkeletonESP","R6/R15 joint lines",6)
makeToggle(__aimV9.espScroll,"HeadExpander","Local head geometry only — server hits unchanged",7)
__aimV9.colorButton=button(__aimV9.espScroll,"CHAMS COLOR: "..__aimV9.chamsModes[colorIndex],UDim2.fromOffset(423,37),UDim2.fromOffset(0,466))
__aimV9.colorButton.ZIndex=5
connect(__aimV9.colorButton.MouseButton1Click,function()
    colorIndex=colorIndex%#__aimV9.chamsModes+1
    __aimV9.colorButton.Text="CHAMS COLOR: "..__aimV9.chamsModes[colorIndex]
    __aimV9.lastGlossyTick = -math.huge
    __aimV9.updateESPPreview()
    queueSaveSettings()
end)
__aimV9.finishButton=button(__aimV9.espScroll,"CHAMS FINISH: "..__aimV9.chamFinishes[chamFinishIndex],UDim2.fromOffset(423,37),UDim2.fromOffset(0,511))
__aimV9.finishButton.ZIndex=5
connect(__aimV9.finishButton.MouseButton1Click,function()
    chamFinishIndex=chamFinishIndex%#__aimV9.chamFinishes+1
    __aimV9.finishButton.Text="CHAMS FINISH: "..__aimV9.chamFinishes[chamFinishIndex]
    __aimV9.lastGlossyTick = -math.huge -- refresh the actual character material immediately
    __aimV9.updateESPPreview()
    queueSaveSettings()
end)
label(__aimV9.espScroll,
    "Material is applied to visible R6/R15 body parts on YOUR screen. CHAMS also adds a wall outline. Texture overrides are restored when disabled.",
    UDim2.fromOffset(423,79),UDim2.fromOffset(0,559),12,Color3.fromRGB(185,185,195)).ZIndex=5
-- makeSlider declared later. Head size slider added below, after declaration.
__aimV9.preview=Instance.new("Frame")
__aimV9.preview.Name="LiveESPPreview"
__aimV9.preview.Size=UDim2.fromOffset(423,420)
__aimV9.preview.Position=UDim2.fromOffset(0,664)
__aimV9.preview.BackgroundColor3=Color3.fromRGB(7,7,7)
__aimV9.preview.BorderSizePixel=0
__aimV9.preview.ZIndex=5
__aimV9.preview.Parent=__aimV9.espScroll
corner(__aimV9.preview,9)
stroke(__aimV9.preview,Color3.fromRGB(95,95,95))
label(__aimV9.preview,"LIVE ESP PREVIEW",UDim2.fromOffset(250,28),UDim2.fromOffset(14,12),15,Color3.new(1,1,1),true).ZIndex=6
__aimV9.detail=label(__aimV9.preview,"LOCAL MOCK TARGET  •  NOT A REAL PLAYER",UDim2.fromOffset(390,18),UDim2.fromOffset(14,40),10,Color3.fromRGB(160,160,160))
__aimV9.detail.ZIndex=6
__aimV9.previewBox=Instance.new("Frame")
__aimV9.previewBox.Name="EnemyOutline"
__aimV9.previewBox.Size=UDim2.fromOffset(152,266)
__aimV9.previewBox.Position=UDim2.fromOffset(135,96)
__aimV9.previewBox.BackgroundTransparency=1
__aimV9.previewBox.ZIndex=6
__aimV9.previewBox.Parent=__aimV9.preview
stroke(__aimV9.previewBox,Color3.fromRGB(255,255,255),2)
__aimV9.previewName=label(__aimV9.preview,"ENEMY  •  24m",UDim2.fromOffset(205,24),UDim2.fromOffset(114,70),13,Color3.new(1,1,1),true)
__aimV9.previewName.TextXAlignment=Enum.TextXAlignment.Center
__aimV9.previewName.ZIndex=7
__aimV9.previewFacing=label(__aimV9.preview,"↑",UDim2.fromOffset(35,38),UDim2.fromOffset(293,100),29,Color3.new(1,1,1),true)
__aimV9.previewFacing.ZIndex=7
__aimV9.previewParts={}
local function figurePart(name,x,y,w,h)
    local part=Instance.new("Frame")
    part.Name=name
    part.Size=UDim2.fromOffset(w,h)
    part.Position=UDim2.fromOffset(x,y)
    part.BackgroundColor3=Color3.fromRGB(226,226,226)
    part.BorderSizePixel=0
    part.ZIndex=7
    part.Parent=__aimV9.preview
    corner(part,5)
    __aimV9.previewParts[#__aimV9.previewParts+1]=part
    return part
end
__aimV9.previewHead=figurePart("Head",187,128,43,46)
figurePart("Torso",166,180,84,95)
figurePart("LeftArm",146,188,17,85)
figurePart("RightArm",253,188,17,85)
figurePart("LeftLeg",169,277,33,68)
figurePart("RightLeg",212,277,33,68)
__aimV9.updateESPPreview=function()
    if not __aimV9.preview.Parent then return end
    local c=chamsColor()
    local outline=__aimV9.previewBox:FindFirstChildOfClass("UIStroke")
    if outline then outline.Enabled=state.ESP or state.Chams end
    __aimV9.previewName.Visible=state.ESP
    __aimV9.previewFacing.Visible=state.FacingESP and state.ESP
    __aimV9.previewFacing.TextColor3=c
    __aimV9.previewName.TextColor3=c
    for _,part in ipairs(__aimV9.previewParts) do
        part.BackgroundColor3=state.Chams and c or Color3.fromRGB(105,105,105)
        part.BackgroundTransparency=state.Chams and .14 or .35
    end
    __aimV9.detail.Text="MOCK TARGET  •  "..__aimV9.chamFinishes[chamFinishIndex].."  •  "..(state.TeamCheck and "ENEMIES ONLY" or "ALL PLAYERS")
end
__aimV9.updateESPPreview()
label(__aimV9.pages.Movement,"MOVEMENT",UDim2.fromOffset(350,31),UDim2.fromOffset(0,6),18,nil,true).ZIndex=5
makeToggle(__aimV9.pages.Movement,"Speed","WalkSpeed: 32",1)
makeToggle(__aimV9.pages.Movement,"Jump","JumpPower: 80",2)
makeToggle(__aimV9.pages.Movement,"Fly","WASD • Space up • Ctrl down",3)
makeToggle(__aimV9.pages.Movement,"Noclip","Disable your character collisions",4)
-- Slider rows use Roblox UI input events; no executor-specific APIs.
__aimV9.sliderSetters={}
local function makeSlider(page, caption, minV, maxV, start, y, update, formatValue)
    local display = formatValue or tostring
    local lbl=label(page,caption..": "..display(start),UDim2.fromOffset(440,18),UDim2.fromOffset(0,y),12,Color3.fromRGB(225,225,240),true)
    lbl.ZIndex=6
    local track=Instance.new("Frame")
    track.Size=UDim2.fromOffset(415,7)
    track.Position=UDim2.fromOffset(2,y+25)
    track.BackgroundColor3=Color3.fromRGB(55,57,70)
    track.ZIndex=5
    track.Parent=page
    corner(track,5)
    local fill=Instance.new("Frame")
    fill.Size=UDim2.fromScale((start-minV)/(maxV-minV),1)
    fill.BackgroundColor3=Color3.fromRGB(236,236,236)
    fill.ZIndex=6
    fill.Parent=track
    corner(fill,5)
    __aimV9.sliderSetters[caption]=function(rawValue)
        local v=math.clamp(tonumber(rawValue) or start,minV,maxV)
        fill.Size=UDim2.fromScale((v-minV)/(maxV-minV),1)
        lbl.Text=caption..": "..display(v)
    end
    local sliding=false
    local activeTouch=nil
    local function setAt(x)
        local pct=math.clamp((x-track.AbsolutePosition.X)/math.max(1,track.AbsoluteSize.X),0,1)
        local v=math.floor(minV+pct*(maxV-minV)+0.5)
        fill.Size=UDim2.fromScale(pct,1)
        lbl.Text=caption..": "..display(v)
        update(v)
        queueSaveSettings()
    end
    connect(track.InputBegan,function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            sliding=true
            activeTouch = i.UserInputType == Enum.UserInputType.Touch and i or nil
            setAt(i.Position.X)
        end
    end)
    connect(UIS.InputChanged,function(i)
        if sliding and ((activeTouch and i == activeTouch) or
            (not activeTouch and i.UserInputType==Enum.UserInputType.MouseMovement)) then
            setAt(i.Position.X)
        end
    end)
    connect(UIS.InputEnded,function(i)
        if sliding and ((activeTouch and i == activeTouch) or
            (not activeTouch and i.UserInputType==Enum.UserInputType.MouseButton1)) then
            sliding=false
            activeTouch=nil
        end
    end)
end
-- GAME SELECTION (restored two-game layout; no BloxStrike HVH)
label(__aimV9.pages.Games,"SELECT YOUR GAME",UDim2.fromOffset(420,30),UDim2.fromOffset(2,12),21,Color3.new(1,1,1),true).ZIndex=6
label(__aimV9.pages.Games,"1. Universal  /  2. Murder Mystery 2",UDim2.fromOffset(440,24),UDim2.fromOffset(2,46),13,Color3.fromRGB(180,180,185)).ZIndex=6
__aimV9.universalButton=button(__aimV9.pages.Games,"1   UNIVERSAL",UDim2.fromOffset(425,65),UDim2.fromOffset(2,100))
__aimV9.mm2Button=button(__aimV9.pages.Games,"2   MM2",UDim2.fromOffset(425,65),UDim2.fromOffset(2,180))
__aimV9.gameLabels={universal=__aimV9.universalButton,mm2=__aimV9.mm2Button}
connect(__aimV9.universalButton.MouseButton1Click,function() __aimV9.selectGame("Universal") end)
connect(__aimV9.mm2Button.MouseButton1Click,function() __aimV9.selectGame("MM2") end)
label(__aimV9.pages.Games,"MM2 roles appear after a player visibly equips their weapon.\nUnknown roles are never guessed. Sheriff and Hero share the gun label.",UDim2.fromOffset(435,85),UDim2.fromOffset(2,275),12,Color3.fromRGB(160,165,180)).ZIndex=6

__aimV9.mm2Scroll=Instance.new("ScrollingFrame")
__aimV9.mm2Scroll.Size=UDim2.fromScale(1,1)
__aimV9.mm2Scroll.BackgroundTransparency=1
__aimV9.mm2Scroll.BorderSizePixel=0
__aimV9.mm2Scroll.ScrollBarThickness=4
__aimV9.mm2Scroll.CanvasSize=UDim2.fromOffset(0,920)
__aimV9.mm2Scroll.Parent=__aimV9.pages.MM2
label(__aimV9.mm2Scroll,"MM2 / ROLE OPTIONS",UDim2.fromOffset(425,32),UDim2.fromOffset(1,6),20,Color3.new(1,1,1),true).ZIndex=6
makeToggle(__aimV9.mm2Scroll,"MM2MurdererESP","RED name + outline (observed role)",1)
makeToggle(__aimV9.mm2Scroll,"MM2SheriffESP","BLUE gun-holder / Sheriff-Hero ESP",2)
makeToggle(__aimV9.mm2Scroll,"MM2MurdererChams","RED local material + glow",3)
makeToggle(__aimV9.mm2Scroll,"MM2SheriffChams","BLUE local material + glow",4)
makeToggle(__aimV9.mm2Scroll,"MM2Aim","Hold RMB / mobile AIM for camera assist",5)
makeToggle(__aimV9.mm2Scroll,"MM2VisibleOnly","Aim only at directly visible targets",6)
__aimV9.MM2.roleButton=button(__aimV9.mm2Scroll,"AIM TARGET: "..__aimV9.MM2.aimRoles[__aimV9.MM2.aimRoleIndex],UDim2.fromOffset(425,40),UDim2.fromOffset(0,424))
connect(__aimV9.MM2.roleButton.MouseButton1Click,function()
    local m=__aimV9.MM2
    m.aimRoleIndex=m.aimRoleIndex%#m.aimRoles+1
    m.roleButton.Text="AIM TARGET: "..m.aimRoles[m.aimRoleIndex]
    m.target=nil
    queueSaveSettings()
end)
__aimV9.MM2.finishButton=button(__aimV9.mm2Scroll,"CHAMS FINISH: "..__aimV9.chamFinishes[chamFinishIndex],UDim2.fromOffset(425,39),UDim2.fromOffset(0,479))
connect(__aimV9.MM2.finishButton.MouseButton1Click,function()
    chamFinishIndex=chamFinishIndex%#__aimV9.chamFinishes+1
    __aimV9.MM2.finishButton.Text="CHAMS FINISH: "..__aimV9.chamFinishes[chamFinishIndex]
    __aimV9.lastGlossyTick=-math.huge
    __aimV9.MM2.lastVisualScan=-math.huge
    queueSaveSettings()
end)
makeSlider(__aimV9.mm2Scroll,"MM2 Aim FOV (pixels)",40,420,__aimV9.MM2.aimFOV,540,function(v)
    __aimV9.MM2.aimFOV=v __aimV9.MM2.target=nil
end)
makeSlider(__aimV9.mm2Scroll,"MM2 Aim Smoothness",1,100,__aimV9.MM2.aimSmoothness,605,function(v)
    __aimV9.MM2.aimSmoothness=v
end)
__aimV9.MM2.status=label(__aimV9.mm2Scroll,"MM2: checking game...",UDim2.fromOffset(420,110),UDim2.fromOffset(0,687),13,Color3.fromRGB(195,200,225))
__aimV9.MM2.status.TextWrapped=true
__aimV9.MM2.status.ZIndex=6
connect(RunService.Heartbeat,function()
    local m=__aimV9.MM2
    if not alive or not armUnlocked or os.clock()-(m.lastStatusTick or 0)<.6 then return end
    m.lastStatusTick=os.clock()
    if m.status and m.status.Parent then
        if game.PlaceId~=m.placeId then
            m.status.Text="MM2 MODE: This mode is designed for Murder Mystery 2 (place "..m.placeId..")."
        else
            local murderer,sheriff=0,0
            for _,other in ipairs(Players:GetPlayers()) do
                if other~=player then
                    local role=m.getRole(other)
                    if role=="Murderer" then murderer+=1 elseif role=="Sheriff / Hero" then sheriff+=1 end
                end
            end
            m.status.Text="OBSERVED: Murderer "..murderer.." | Sheriff/Hero "..sheriff.."\n"..
                "Aim selects "..m.desiredRole()..". Unknown roles remain hidden until observed."
        end
    end
end)
__aimV9.selectGame(__aimV9.selectedGame)
selectTab("Games")

makeSlider(__aimV9.espScroll,"Enemy Head Size (local)",2,9,enemyHeadSize,571,function(v)
    enemyHeadSize=v
    if state.HeadExpander then updateEnemyHeads() end
    __aimV9.updateESPPreview()
end)
-- No Guns tab: gun-specific demo controls are not shown in the universal UI.
-- A compact scrollable movement page accommodates the controls.
__aimV9.pages.Movement.ClipsDescendants=false
__aimV9.movementScroll=Instance.new("ScrollingFrame")
__aimV9.movementScroll.Size=UDim2.new(1,0,1,0)
__aimV9.movementScroll.CanvasSize=UDim2.fromOffset(0,1100)
__aimV9.movementScroll.ScrollBarThickness=3
__aimV9.movementScroll.BackgroundTransparency=1
__aimV9.movementScroll.ZIndex=4
__aimV9.movementScroll.Parent=__aimV9.pages.Movement
for _,child in ipairs(__aimV9.pages.Movement:GetChildren()) do
    if child~=__aimV9.movementScroll then child.Parent=__aimV9.movementScroll end
end
makeSlider(__aimV9.movementScroll,"Walk Speed",8,120,speedValue,560,function(v) speedValue=v end)
makeSlider(__aimV9.movementScroll,"Jump Power",30,180,jumpValue,620,function(v) jumpValue=v end)
makeSlider(__aimV9.movementScroll,"Fly Speed",10,180,flySpeed,680,function(v) flySpeed=v end)
-- FF3-style local arm/catch-hitbox resizer, integrated into your Movement tab.
makeToggle(__aimV9.movementScroll,"Arms","Cons1-style R6 arm and catch-part resize (local)",5)
makeToggle(__aimV9.movementScroll,"Spinbot","Rotate your avatar locally (game may override)",6)
makeSlider(__aimV9.movementScroll,"Arm Length (studs)",2,40,armSize,740,function(v)
    armSize = v
    if state.Arms then updateArmExtender() end
end)
makeSlider(__aimV9.movementScroll,"Spin Speed (degrees/s)",60,7200,spinSpeed,800,function(v)
    spinSpeed = v
end)
makeToggle(__aimV9.movementScroll,"AntiAim","Moving visual facing jitter (not server desync)",7)
makeToggle(__aimV9.movementScroll,"GhostDecoy","Ghost trail behind movement; cosmetic only",8)
-- Trail toggle lives at the bottom of the Movement page so existing sliders stay put.
makeToggle(__aimV9.movementScroll,"PlayerTrail","Blue-white walking trail behind your avatar",22)
makeSlider(__aimV9.movementScroll,"Jitter Angle (degrees)",20,180,antiAimDegrees,867,function(v) antiAimDegrees=v end)
makeSlider(__aimV9.movementScroll,"Jitter Speed (flips/sec)",6,60,__aimV9.antiAimJitterSpeed,921,function(v) __aimV9.antiAimJitterSpeed=v end)
makeSlider(__aimV9.movementScroll,"Ghost Trail Distance",1,15,ghostDistance,985,function(v) ghostDistance=v end)
__aimV9.movementScroll.CanvasSize=UDim2.fromOffset(0,1435)
__aimV9.externalMovementRef="https://pastefy.app/Vf5POrA6/raw"
__aimV9.externalMovementButton=button(__aimV9.movementScroll,"PASTEFY MOVEMENT (UNVERIFIED - NOT RUN)",UDim2.fromOffset(422,36),UDim2.fromOffset(0,1170))
connect(__aimV9.externalMovementButton.Activated,function()
    if __aimV9.externalMovementNotice then
        __aimV9.externalMovementNotice.Text="Not executed. This Pastefy script is obfuscated and downloads further obfuscated code. Provide readable source for review."
    end
end)
__aimV9.externalMovementNotice=label(__aimV9.movementScroll,
    "External movement script is not automatically executed. Link: pastefy.app/Vf5POrA6/raw",
    UDim2.fromOffset(430,75),UDim2.fromOffset(0,1214),12,Color3.fromRGB(195,195,195))
__aimV9.externalMovementNotice.TextWrapped=true
__aimV9.externalMovementNotice.ZIndex=5
__aimV9.armHint = label(
    __aimV9.movementScroll,
    "R6: 35-stud arms and catch parts by default. Server controls catches.",
    UDim2.fromOffset(420, 46),
    UDim2.fromOffset(0, 1090),
    11, Color3.fromRGB(155, 158, 172)
)
__aimV9.armHint.TextWrapped = true
__aimV9.armHint.ZIndex = 5

-- PERFORMANCE controls share the same settings in UNIVERSAL and MM2.
local perfPage=__aimV9.pages.Performance
local perfScroll=Instance.new("ScrollingFrame")
perfScroll.Name="PerformanceScroll"
perfScroll.Size=UDim2.fromScale(1,1)
perfScroll.CanvasSize=UDim2.fromOffset(0,700)
perfScroll.ScrollBarThickness=3
perfScroll.BorderSizePixel=0
perfScroll.BackgroundTransparency=1
perfScroll.ZIndex=4
perfScroll.Parent=perfPage
label(perfScroll,"PERFORMANCE / POTATO MODE",UDim2.fromOffset(440,32),UDim2.fromOffset(0,10),18,nil,true).ZIndex=6
local perfDesc=label(perfScroll,
    "Extra potato: strip supported mesh/part textures, simplify water, shadows and post effects. Local visuals only; can be restored.",
    UDim2.fromOffset(435,68),UDim2.fromOffset(0,47),12,Color3.fromRGB(198,198,208))
perfDesc.TextWrapped=true perfDesc.ZIndex=6
local potatoButton=button(perfScroll,"LOW TEXTURE: OFF",UDim2.fromOffset(420,43),UDim2.fromOffset(0,136))
local restoreButton=button(perfScroll,"RESTORE ORIGINAL GRAPHICS",UDim2.fromOffset(420,38),UDim2.fromOffset(0,187))
local perfGraphicsStatus=label(perfScroll,"Graphics unchanged.",UDim2.fromOffset(420,54),UDim2.fromOffset(0,232),12,Color3.fromRGB(190,195,210))
perfGraphicsStatus.TextWrapped=true perfGraphicsStatus.ZIndex=6
label(perfScroll,"FPS CAP (OPTIONAL)",UDim2.fromOffset(430,27),UDim2.fromOffset(0,306),16,nil,true).ZIndex=6
local fpsCapButton=button(perfScroll,"FPS TARGET: DEFAULT",UDim2.fromOffset(420,41),UDim2.fromOffset(0,348))
local fpsApplyButton=button(perfScroll,"REQUEST SELECTED FPS CAP",UDim2.fromOffset(420,40),UDim2.fromOffset(0,398))
local perfFPSStatus=label(perfScroll,"",UDim2.fromOffset(430,75),UDim2.fromOffset(0,450),12,Color3.fromRGB(190,195,210))
perfFPSStatus.TextWrapped=true perfFPSStatus.ZIndex=6
local perfFootnote=label(perfScroll,
    "Roblox officially supports up to 240 FPS on Windows. Selecting 500 only requests a cap from compatible runtimes; it does not guarantee 500 rendered FPS.",
    UDim2.fromOffset(435,95),UDim2.fromOffset(0,545),12,Color3.fromRGB(176,180,198))
perfFootnote.TextWrapped=true perfFootnote.ZIndex=6
local capPresets={0,60,120,144,240,500}
function perf.updateUI()
    if potatoButton then potatoButton.Text="LOW TEXTURE: "..(perf.lowTexture and "ON" or "OFF") end
    if fpsCapButton then fpsCapButton.Text="FPS TARGET: "..(perf.fpsTarget==0 and "DEFAULT" or tostring(perf.fpsTarget)) end
    if perfGraphicsStatus then perfGraphicsStatus.Text=perf.graphicsStatus end
    if perfFPSStatus then perfFPSStatus.Text="Current FPS: "..perf.fps.."\n"..perf.fpsStatus end
end
connect(potatoButton.Activated,function() perf.setLow(not perf.lowTexture) end)
connect(restoreButton.Activated,function() perf.setLow(false) end)
connect(fpsCapButton.Activated,function()
    local index=1
    for i,v in ipairs(capPresets) do
        if v==perf.fpsTarget then index=i break end
    end
    perf.fpsTarget=capPresets[(index%#capPresets)+1]
    perf.updateUI()
    queueSaveSettings()
end)
connect(fpsApplyButton.Activated,function() perf.setCap(perf.fpsTarget) end)
perf.updateUI()
makeToggle(perfScroll,"ActiveHUD","Show enabled features while playing",11)
perfScroll.CanvasSize=UDim2.fromOffset(0,770)


-- World palette / atmosphere controls for both modes (client-side only).
local ambPage=__aimV9.pages.Ambience
local ambScroll=Instance.new("ScrollingFrame")
ambScroll.Size=UDim2.fromScale(1,1)
ambScroll.CanvasSize=UDim2.fromOffset(0,740)
ambScroll.BorderSizePixel=0 ambScroll.BackgroundTransparency=1 ambScroll.ScrollBarThickness=3
ambScroll.Parent=ambPage
label(ambScroll,"WORLD AMBIENCE",UDim2.fromOffset(440,31),UDim2.fromOffset(0,12),19,nil,true).ZIndex=6
label(ambScroll,"Local world lighting: color, time, brightness and fog. No server changes.",
    UDim2.fromOffset(440,54),UDim2.fromOffset(0,49),12,Color3.fromRGB(191,195,212)).TextWrapped=true
local ambienceModeButton=button(ambScroll,"",UDim2.fromOffset(423,43),UDim2.fromOffset(0,115))
local ambienceApplyButton=button(ambScroll,"APPLY AMBIENCE",UDim2.fromOffset(423,42),UDim2.fromOffset(0,170))
local ambienceResetButton=button(ambScroll,"RESTORE ORIGINAL LIGHTING",UDim2.fromOffset(423,42),UDim2.fromOffset(0,226))
local ambienceHelp=label(ambScroll,"Affects this client only. Potato mode can be on at the same time.",
    UDim2.fromOffset(430,80),UDim2.fromOffset(0,293),12,Color3.fromRGB(192,196,210))
ambienceHelp.TextWrapped=true
function ambience.refresh()
    ambienceModeButton.Text="PALETTE: "..ambience.presets[ambience.index]
end
connect(ambienceModeButton.Activated,function()
    ambience.index=ambience.index%#ambience.presets+1
    ambience.refresh()
    queueSaveSettings()
end)
connect(ambienceApplyButton.Activated,function() ambience.apply(ambience.index) end)
connect(ambienceResetButton.Activated,function() ambience.apply(1) end)
ambience.refresh()
label(ambScroll,"CUSTOM RGB TINT",UDim2.fromOffset(430,25),UDim2.fromOffset(0,384),14,nil,true).ZIndex=6
makeSlider(ambScroll,"Ambience Red",0,255,math.floor(ambience.customR),422,function(v)
    ambience.customR=v
    if ambience.index==7 then ambience.apply(7) end
end)
makeSlider(ambScroll,"Ambience Green",0,255,math.floor(ambience.customG),487,function(v)
    ambience.customG=v
    if ambience.index==7 then ambience.apply(7) end
end)
makeSlider(ambScroll,"Ambience Blue",0,255,math.floor(ambience.customB),552,function(v)
    ambience.customB=v
    if ambience.index==7 then ambience.apply(7) end
end)

-- Desktop / keyboard keybind editor. One feature per key; NONE unbinds.
local kbPage=__aimV9.pages.Keybinds
local kbScroll=Instance.new("ScrollingFrame")
kbScroll.Size=UDim2.fromScale(1,1)
kbScroll.CanvasSize=UDim2.fromOffset(0,820)
kbScroll.BorderSizePixel=0 kbScroll.BackgroundTransparency=1 kbScroll.ScrollBarThickness=3
kbScroll.Parent=kbPage
label(kbScroll,"MOVEMENT KEYBINDS",UDim2.fromOffset(440,30),UDim2.fromOffset(0,10),19,nil,true).ZIndex=6
local kbInfo=label(kbScroll,"Click BIND, then press any available keyboard key. Backspace clears a bind. Keys won't trigger while typing.",
    UDim2.fromOffset(433,63),UDim2.fromOffset(0,45),12,Color3.fromRGB(193,197,214))
kbInfo.TextWrapped=true
local kbButtons={}
for i,feature in ipairs(__aimV9.keybindNames) do
    label(kbScroll,feature,UDim2.fromOffset(200,30),UDim2.fromOffset(0,110+(i-1)*60),14,nil,true).ZIndex=6
    local bind=button(kbScroll,"BIND: NONE",UDim2.fromOffset(202,40),UDim2.fromOffset(211,105+(i-1)*60))
    kbButtons[feature]=bind
    connect(bind.Activated,function()
        __aimV9.keybindCapture=feature
        __aimV9.keybindRefresh()
    end)
end
function __aimV9.keybindRefresh()
    for feature,btn in pairs(kbButtons) do
        if __aimV9.keybindCapture==feature then
            btn.Text="PRESS A KEY..."
        else
            btn.Text="BIND: "..(__aimV9.keybinds[feature] or "NONE")
        end
    end
end
__aimV9.keybindRefresh()

-- A single lightweight Dance page is shared by Universal and MM2.
__aimV9.danceScroll=Instance.new("ScrollingFrame")
__aimV9.danceScroll.Size=UDim2.fromScale(1,1)
__aimV9.danceScroll.CanvasSize=UDim2.fromOffset(0,850)
__aimV9.danceScroll.BackgroundTransparency=1
__aimV9.danceScroll.BorderSizePixel=0
__aimV9.danceScroll.ScrollBarThickness=3
__aimV9.danceScroll.Parent=__aimV9.pages.Dance
label(__aimV9.danceScroll,"DANCE / UNIVERSAL + MM2",UDim2.fromOffset(425,30),UDim2.fromOffset(0,10),18,nil,true).ZIndex=6
__aimV9.danceStatus=label(__aimV9.danceScroll,"Dance controls ready. Animation asset permissions may limit visibility.",UDim2.fromOffset(425,50),UDim2.fromOffset(0,65),12,Color3.fromRGB(190,190,205))
__aimV9.danceStatus.TextWrapped=true
local danceNames={"Take The L","Dance 1","Dance 2","Dance 3"}
for i,name in ipairs(danceNames) do
    local buttonDance=button(__aimV9.danceScroll,name=="Take The L" and "TAKE THE L (CUSTOM ANIMATION ID)" or string.upper(name),UDim2.fromOffset(422,42),UDim2.fromOffset(0,120+(i-1)*54))
    connect(buttonDance.Activated,function()
        local _,status=__aimV9.dance.play(name)
        __aimV9.danceStatus.Text=status
    end)
end
local stopDanceButton=button(__aimV9.danceScroll,"STOP DANCE",UDim2.fromOffset(422,42),UDim2.fromOffset(0,348))
connect(stopDanceButton.Activated,function()
    __aimV9.dance.stop()
    __aimV9.danceStatus.Text="Stopped."
end)
label(__aimV9.danceScroll,"TAKE THE L ANIMATION ID (must be usable in this experience)",UDim2.fromOffset(430,32),UDim2.fromOffset(0,407),12,Color3.fromRGB(205,205,215)).ZIndex=5
local danceIdInput=Instance.new("TextBox")
danceIdInput.Name="TakeTheLAnimationID"
danceIdInput.Size=UDim2.fromOffset(422,39)
danceIdInput.Position=UDim2.fromOffset(0,449)
danceIdInput.BackgroundColor3=Color3.fromRGB(25,25,28)
danceIdInput.TextColor3=Color3.new(1,1,1)
danceIdInput.PlaceholderText="Roblox animation asset ID"
danceIdInput.Text=__aimV9.danceAssetId
danceIdInput.ClearTextOnFocus=false
danceIdInput.Font=Enum.Font.Gotham
danceIdInput.TextSize=14
danceIdInput.Parent=__aimV9.danceScroll
corner(danceIdInput,5)
connect(danceIdInput.FocusLost,function()
    __aimV9.danceAssetId=danceIdInput.Text:match("(%d+)") or ""
    queueSaveSettings()
end)
makeSlider(__aimV9.danceScroll,"Dance speed (%)",50,200,__aimV9.danceSpeedPercent,524,function(v)
    __aimV9.danceSpeedPercent=v
    if __aimV9.dance.track then pcall(function() __aimV9.dance.track:AdjustSpeed(v/100) end) end
end)
label(__aimV9.danceScroll,
    "Walking is not disabled while dancing. Other players only see animations Roblox authorizes and replicates; locally forced animations will not override server policy.",
    UDim2.fromOffset(422,75),UDim2.fromOffset(0,631),12,Color3.fromRGB(178,180,197)).TextWrapped=true

__aimV9.adminScroll=Instance.new("ScrollingFrame")
__aimV9.adminScroll.Size=UDim2.fromScale(1,1)
__aimV9.adminScroll.CanvasSize=UDim2.fromOffset(0,800)
__aimV9.adminScroll.BackgroundTransparency=1
__aimV9.adminScroll.BorderSizePixel=0
__aimV9.adminScroll.ScrollBarThickness=3
__aimV9.adminScroll.Parent=__aimV9.pages.Admin
label(__aimV9.adminScroll,"OWNER ADMIN / UNIVERSAL + MM2",UDim2.fromOffset(430,32),UDim2.fromOffset(0,8),18,nil,true).ZIndex=6
__aimV9.adminStatus=label(__aimV9.adminScroll,"Admin commands require your server-side script and owner authorization.",UDim2.fromOffset(425,74),UDim2.fromOffset(0,49),13,Color3.fromRGB(190,190,203))
__aimV9.adminStatus.TextWrapped=true
local killAllButton=button(__aimV9.adminScroll,"KILL ALL (OWN EXPERIENCE ONLY)",UDim2.fromOffset(420,43),UDim2.fromOffset(0,142))
connect(killAllButton.Activated,function()
    __aimV9.admin.send("kill_all")
    __aimV9.adminStatus.Text=__aimV9.admin.lastStatus
end)
__aimV9.flingButton=button(__aimV9.adminScroll,"TOUCH FLING: OFF",UDim2.fromOffset(420,43),UDim2.fromOffset(0,210))
connect(__aimV9.flingButton.Activated,function()
    __aimV9.admin.setFling(not __aimV9.admin.touchFling)
    __aimV9.flingButton.Text="TOUCH FLING: "..(__aimV9.admin.touchFling and "ON" or "OFF")
    __aimV9.adminStatus.Text=__aimV9.admin.lastStatus
end)
makeSlider(__aimV9.adminScroll,"Touch fling strength",60,190,__aimV9.admin.flingStrength,292,function(v)
    __aimV9.admin.flingStrength=v
    if __aimV9.admin.touchFling then __aimV9.admin.setFling(true) end
end)
label(__aimV9.adminScroll,
    "Commands never grant privileges. Install AIM_WTF_OWNER_ADMIN_SERVER.lua in a game you own, then add your UserId to its allowlist. Not supported in public MM2.",
    UDim2.fromOffset(422,111),UDim2.fromOffset(0,398),12,Color3.fromRGB(185,185,200)).TextWrapped=true

__aimV9.aimScroll=Instance.new("ScrollingFrame")
__aimV9.aimScroll.Name="AimScroll"
__aimV9.aimScroll.Size=UDim2.fromScale(1,1)
__aimV9.aimScroll.CanvasSize=UDim2.fromOffset(0,2130)
__aimV9.aimScroll.BackgroundTransparency=1
 __aimV9.aimScroll.ScrollBarThickness=4
 __aimV9.aimScroll.BorderSizePixel=0
 __aimV9.aimScroll.Parent=__aimV9.pages.Aim
label(__aimV9.aimScroll,"AIM / SHOT VISUALS",UDim2.fromOffset(430,31),UDim2.fromOffset(0,6),18,nil,true).ZIndex=5
makeToggle(__aimV9.aimScroll,"AimAssist","RMB or mobile AIM: camera head assist",1)
makeToggle(__aimV9.aimScroll,"StickyAim","Keep current head target",2)
makeToggle(__aimV9.aimScroll,"Triggerbot","FOV head lock + timed automatic fire input",3)
makeToggle(__aimV9.aimScroll,"SilentAim","Compatible client-raycast or demo guns only",4)
makeToggle(__aimV9.aimScroll,"Tracers","Thin shot paths + observed projectile trails",5)
makeToggle(__aimV9.aimScroll,"HitSounds","Play on estimated hits / confirmed hit event",6)
makeToggle(__aimV9.aimScroll,"ShowSilentFOV","Show a white silent aim radius circle",7)
makeSlider(__aimV9.aimScroll,"Aim Smoothness",0,30,aimSmoothness,488,function(v) aimSmoothness=v end)
makeSlider(__aimV9.aimScroll,"Camera Aim FOV (pixels)",60,350,aimFOV,546,function(v) aimFOV=v end)
makeSlider(__aimV9.aimScroll,"Silent Aim FOV (pixels)",25,500,__aimV9.silentAimFOV,604,function(v) __aimV9.silentAimFOV=v end)
makeSlider(__aimV9.aimScroll,"Hit Volume",0,100,hitSoundVolume,662,function(v)
    hitSoundVolume=v
    hitSound.Volume=v/100
end)
__aimV9.hitSoundCaption=label(__aimV9.aimScroll,"HIT SOUND ASSET ID (OPTIONAL)",UDim2.fromOffset(420,18),UDim2.fromOffset(0,741),12,Color3.fromRGB(180,180,180),true)
__aimV9.hitSoundCaption.ZIndex=5
__aimV9.hitInput=Instance.new("TextBox")
__aimV9.hitInput.Size=UDim2.fromOffset(423,35)
__aimV9.hitInput.Position=UDim2.fromOffset(0,764)
__aimV9.hitInput.BackgroundColor3=Color3.fromRGB(25,25,25)
__aimV9.hitInput.TextColor3=Color3.new(1,1,1)
__aimV9.hitInput.PlaceholderText="Enter a Roblox sound asset ID"
__aimV9.hitInput.Text=tostring(hitSoundId)
__aimV9.hitInput.ClearTextOnFocus=false
__aimV9.hitInput.Font=Enum.Font.Gotham
__aimV9.hitInput.TextSize=13
__aimV9.hitInput.Parent=__aimV9.aimScroll
__aimV9.hitInput.ZIndex=6
corner(__aimV9.hitInput,5)
connect(__aimV9.hitInput.FocusLost,function()
    hitSoundId=__aimV9.hitInput.Text:match("(%d+)") or ""
    hitSound.SoundId=hitSoundId~="" and assetUrl(hitSoundId) or "rbxasset://sounds/electronicpingshort.wav"
    queueSaveSettings()
end)
__aimV9.soundTest=button(__aimV9.aimScroll,"TEST HIT SOUND",UDim2.fromOffset(423,35),UDim2.fromOffset(0,811))
__aimV9.soundTest.ZIndex=6
connect(__aimV9.soundTest.MouseButton1Click,function()
    pcall(function() hitSound:Play() end)
end)
__aimV9.aimInfo=label(__aimV9.aimScroll,"The white ring is the Silent Aim FOV: eligible head targets must appear inside it. Works only when a weapon uses a supported shot API; server-side hit validation and custom gun systems are not bypassed. Tracers follow Tool activation, projectiles or supported shot FX.",UDim2.fromOffset(420,92),UDim2.fromOffset(0,873),11,Color3.fromRGB(178,178,178))
__aimV9.aimInfo.TextWrapped=true __aimV9.aimInfo.ZIndex=5

-- Compatible tool firing controls (no separate Guns tab).
__aimV9.gunHeading=label(__aimV9.aimScroll,"FIRING / COOLDOWN CONTROLS",UDim2.fromOffset(430,25),UDim2.fromOffset(0,986),15,Color3.new(1,1,1),true)
__aimV9.gunHeading.ZIndex=5
makeToggle(__aimV9.aimScroll,"ContinuousFire","Hold mouse to repeat compatible Tool activations",18)
makeToggle(__aimV9.aimScroll,"NoGunCooldown","Remove the script's own extra cooldown only",19)
makeSlider(__aimV9.aimScroll,"Fire Rate (shots/sec)",1,20,gunFireRate,1197,function(v)
    gunFireRate = v
    gunFireInterval = 1 / math.max(1,v)
    __aimV9.applyFireControls(activeTool())
end)
__aimV9.gunStatusLabel=label(__aimV9.aimScroll,
    "Selected rate: "..gunFireRate.." shots/sec.\nCompatible Tools only; game servers can still cap firing.",
    UDim2.fromOffset(420,65),UDim2.fromOffset(0,1255),11,Color3.fromRGB(178,178,178))
__aimV9.gunStatusLabel.TextWrapped=true
__aimV9.gunStatusLabel.ZIndex=5

-- Tracer detection and styling: more than just MouseButton1 click.
__aimV9.tracerSourceButton=button(__aimV9.aimScroll,"TRACER SOURCE: "..__aimV9.tracerSources[__aimV9.tracerSourceIndex],UDim2.fromOffset(423,37),UDim2.fromOffset(0,1350))
__aimV9.tracerSourceButton.ZIndex=6
connect(__aimV9.tracerSourceButton.MouseButton1Click,function()
    __aimV9.tracerSourceIndex=__aimV9.tracerSourceIndex%#__aimV9.tracerSources+1
    __aimV9.tracerSourceButton.Text="TRACER SOURCE: "..__aimV9.tracerSources[__aimV9.tracerSourceIndex]
    queueSaveSettings()
end)
__aimV9.tracerColorButton=button(__aimV9.aimScroll,"TRACER COLOR: "..__aimV9.tracerColors[__aimV9.tracerColorIndex],UDim2.fromOffset(423,37),UDim2.fromOffset(0,1398))
__aimV9.tracerColorButton.ZIndex=6
connect(__aimV9.tracerColorButton.MouseButton1Click,function()
    __aimV9.tracerColorIndex=__aimV9.tracerColorIndex%#__aimV9.tracerColors+1
    __aimV9.tracerColorButton.Text="TRACER COLOR: "..__aimV9.tracerColors[__aimV9.tracerColorIndex]
    queueSaveSettings()
end)
label(__aimV9.aimScroll,"AUTO combines Tool activations, visible physical bullets, and local gunfire sounds. It cannot detect all internal or server-only shots in every experience.",UDim2.fromOffset(423,85),UDim2.fromOffset(0,1450),12,Color3.fromRGB(185,185,185)).TextWrapped=true

local tbTitle = label(__aimV9.aimScroll,"ADVANCED TRIGGERBOT",UDim2.fromOffset(423,26),UDim2.fromOffset(0,1536),16,Color3.fromRGB(235,235,235),true)
tbTitle.ZIndex = 6
makeToggle(__aimV9.aimScroll,"ShowTriggerFOV","Blue FOV circle for head targeting",27)
makeSlider(__aimV9.aimScroll,"Trigger FOV (pixels)",25,450,__aimV9.triggerFOV,1630,function(v)
    __aimV9.triggerFOV = v
end)
makeSlider(__aimV9.aimScroll,"Trigger reaction (ms)",0,500,__aimV9.triggerReactionMs,1695,function(v)
    __aimV9.triggerReactionMs = v
end)
makeSlider(__aimV9.aimScroll,"Trigger lock smoothness",1,100,__aimV9.triggerSmoothness,1755,function(v)
    __aimV9.triggerSmoothness = v
end)
__aimV9.triggerModeButton = button(__aimV9.aimScroll,"FIRE METHOD: "..__aimV9.triggerModeNames[__aimV9.triggerModeIndex],UDim2.fromOffset(423,37),UDim2.fromOffset(0,1824))
__aimV9.triggerModeButton.ZIndex = 6
connect(__aimV9.triggerModeButton.MouseButton1Click,function()
    __aimV9.triggerModeIndex = __aimV9.triggerModeIndex % #__aimV9.triggerModeNames + 1
    __aimV9.triggerModeButton.Text = "FIRE METHOD: "..__aimV9.triggerModeNames[__aimV9.triggerModeIndex]
    queueSaveSettings()
end)
__aimV9.triggerStatus = label(__aimV9.aimScroll,
    "TRIGGER STATUS: Idle. Mouse methods need runtime input support. The game controls whether a gun actually shoots.",
    UDim2.fromOffset(423,90),UDim2.fromOffset(0,1880),12,Color3.fromRGB(190,205,224))
__aimV9.triggerStatus.TextWrapped = true
__aimV9.triggerStatus.ZIndex = 6

-- CAMERA: actual viewpoint controls, distinct from the aim-assist FOV circle.
label(__aimV9.pages.Camera,"CAMERA CONTROLS",UDim2.fromOffset(430,31),UDim2.fromOffset(0,6),18,nil,true).ZIndex=5
makeToggle(__aimV9.pages.Camera,"ThirdPerson","Force a third-person view at chosen distance",1)
makeSlider(__aimV9.pages.Camera,"Camera Distance",3,24,thirdPersonDistance,143,function(v)
    thirdPersonDistance = v
end)
makeSlider(__aimV9.pages.Camera,"Camera FOV (degrees)",40,120,math.floor(cameraFOV+0.5),214,function(v)
    cameraFOV = v
    cameraFovChanged = true
end)
__aimV9.cameraHint = label(
    __aimV9.pages.Camera,
    "FOV controls how wide the world looks.\nCamera settings may be limited by the game.",
    UDim2.fromOffset(436,53),UDim2.fromOffset(0,284),12,
    Color3.fromRGB(155,158,172)
)
__aimV9.cameraHint.TextWrapped = true
__aimV9.cameraHint.ZIndex = 5
__aimV9.cosmeticsScroll=Instance.new("ScrollingFrame")
__aimV9.cosmeticsScroll.Name="CosmeticsScroll"
__aimV9.cosmeticsScroll.Size=UDim2.fromScale(1,1)
__aimV9.cosmeticsScroll.CanvasSize=UDim2.fromOffset(0,550)
__aimV9.cosmeticsScroll.ScrollBarThickness=4
__aimV9.cosmeticsScroll.BackgroundTransparency=1
__aimV9.cosmeticsScroll.BorderSizePixel=0
__aimV9.cosmeticsScroll.Parent=__aimV9.pages.Cosmetics
label(__aimV9.cosmeticsScroll,"FULL-BODY CHARACTER COSMETICS",UDim2.fromOffset(438,31),UDim2.fromOffset(0,6),18,nil,true).ZIndex=5
makeToggle(__aimV9.cosmeticsScroll,"TungTung","Hide normal body locally; show full Sahur log + bat",1)
__aimV9.skinInfo=label(__aimV9.cosmeticsScroll,"Tung Tung Sahur: full-height wooden body, large eyes, arms, legs, and bat. Only YOU see the costume. Your server avatar stays unchanged.",UDim2.fromOffset(425,60),UDim2.fromOffset(0,120),12,Color3.fromRGB(191,191,191))
__aimV9.skinInfo.TextWrapped=true __aimV9.skinInfo.ZIndex=5
label(__aimV9.cosmeticsScroll,"GUN FINISHES — LOCAL ONLY",UDim2.fromOffset(425,28),UDim2.fromOffset(0,210),16,nil,true).ZIndex=5
__aimV9.gunFinishButton=button(__aimV9.cosmeticsScroll,"GUN FINISH: "..__aimV9.gunMaterials[gunMaterialIndex].label,UDim2.fromOffset(423,42),UDim2.fromOffset(0,250))
__aimV9.gunFinishButton.ZIndex=6
connect(__aimV9.gunFinishButton.MouseButton1Click,function()
    gunMaterialIndex=gunMaterialIndex%#__aimV9.gunMaterials+1
    __aimV9.gunFinishButton.Text="GUN FINISH: "..__aimV9.gunMaterials[gunMaterialIndex].label
    applyGunAppearance()
    queueSaveSettings()
end)
__aimV9.gunFinishInfo=label(__aimV9.cosmeticsScroll,"RAINBOW cycles colors. HOLOGRAM uses a glowing, semi-transparent ForceField surface. Supports visible Tool guns and some first-person camera viewmodels; other games may use custom rendering.",UDim2.fromOffset(425,100),UDim2.fromOffset(0,307),12,Color3.fromRGB(190,190,190))
__aimV9.gunFinishInfo.TextWrapped=true __aimV9.gunFinishInfo.ZIndex=5
__aimV9.gunFinishReset=button(__aimV9.cosmeticsScroll,"RESET ORIGINAL GUN MATERIAL",UDim2.fromOffset(423,37),UDim2.fromOffset(0,420))
__aimV9.gunFinishReset.ZIndex=6
connect(__aimV9.gunFinishReset.MouseButton1Click,function()
    gunMaterialIndex=1
    __aimV9.gunFinishButton.Text="GUN FINISH: ORIGINAL"
    applyGunAppearance()
    queueSaveSettings()
end)
label(__aimV9.pages.Chat,"QUICK CHAT",UDim2.fromOffset(350,31),UDim2.fromOffset(0,6),18,nil,true).ZIndex=5
label(__aimV9.pages.Chat,"Chat filtering stays enabled.",UDim2.fromOffset(400,24),UDim2.fromOffset(0,37),13,Color3.fromRGB(155,158,170)).ZIndex=5
__aimV9.messages = {"gg", "Nice play!", "Good luck, have fun!", "Well played!"}
__aimV9.chatInfo = label(__aimV9.pages.Chat,"Select a message to send through normal Roblox chat.",UDim2.fromOffset(430,34),UDim2.fromOffset(0,290),11,Color3.fromRGB(155,158,170))
__aimV9.chatInfo.TextWrapped=true
__aimV9.chatInfo.ZIndex=5
for i,msg in ipairs(__aimV9.messages) do
    local b = button(__aimV9.pages.Chat,msg,UDim2.fromOffset(350,43),UDim2.fromOffset(0,70+(i-1)*52))
    b.ZIndex=5
    connect(b.MouseButton1Click,function()
        local success,err = pcall(function()
            local channels = TextChatService:FindFirstChild("TextChannels")
            local channel = channels and channels:FindFirstChild("RBXGeneral")
            if not channel then error("Default text channel not available") end
            channel:SendAsync(msg)
        end)
        __aimV9.chatInfo.Text= success and ("Sent: "..msg) or ("Chat unavailable: "..tostring(err))
    end)
end
label(__aimV9.pages.Watch,"PUBLIC CHAT + WATCH",UDim2.fromOffset(440,31),UDim2.fromOffset(0,6),18,nil,true).ZIndex=5
makeToggle(__aimV9.pages.Watch,"ChatSpy","Show public messages received by your client",1)
makeToggle(__aimV9.pages.Watch,"AdminWatch","Alert for usernames on your own watchlist",2)
__aimV9.watchInfo=label(__aimV9.pages.Watch,"Public chat only. Private/filtered chats cannot be read.",UDim2.fromOffset(435,30),UDim2.fromOffset(0,180),12,Color3.fromRGB(165,165,180))
__aimV9.watchInfo.TextWrapped=true
__aimV9.watchInfo.ZIndex=5
__aimV9.watchLog=label(__aimV9.pages.Watch,"No recent public messages.",UDim2.fromOffset(440,117),UDim2.fromOffset(0,219),11,Color3.fromRGB(210,210,225))
__aimV9.watchLog.TextWrapped=true
__aimV9.watchLog.TextYAlignment=Enum.TextYAlignment.Top
__aimV9.watchLog.ZIndex=5
local function pushWatch(msg)
    table.insert(__aimV9.watchMessages,1,msg)
    while #__aimV9.watchMessages>5 do table.remove(__aimV9.watchMessages) end
    __aimV9.watchLog.Text=table.concat(__aimV9.watchMessages,"\n")
end
connect(TextChatService.MessageReceived,function(message)
    if not state.ChatSpy then return end
    local speaker=message.TextSource and Players:GetPlayerByUserId(message.TextSource.UserId)
    local name=speaker and speaker.Name or "System"
    local channel=message.TextChannel and message.TextChannel.Name or ""
    if channel=="RBXGeneral" then pushWatch(name..": "..message.Text) end
end)
connect(Players.PlayerAdded,function(plr)
    if state.AdminWatch and __aimV9.watchedAdmins[plr.Name:lower()] then
        pushWatch("WATCHLIST JOINED: "..plr.Name)
    end
end)
label(__aimV9.pages.Settings,"SETTINGS",UDim2.fromOffset(350,31),UDim2.fromOffset(0,6),18,nil,true).ZIndex=5
label(__aimV9.pages.Settings,"Right Shift: hide/show  •  X: save and unload",UDim2.fromOffset(460,24),UDim2.fromOffset(0,42),12,Color3.fromRGB(210,212,223)).ZIndex=5
label(__aimV9.pages.Settings,"Settings save on change and unload.",UDim2.fromOffset(460,22),UDim2.fromOffset(0,67),12,Color3.fromRGB(195,198,214)).ZIndex=5
__aimV9.saveStatus = label(__aimV9.pages.Settings,
    (type(writefile) == "function" and type(readfile) == "function") and "Save mode: session + file API (if permitted)" or "Save mode: this session only (no file read/write API)",
    UDim2.fromOffset(468,22),UDim2.fromOffset(0,88),11,Color3.fromRGB(150,157,175))
__aimV9.saveStatus.ZIndex = 5
local function settingsInput(titleText, y, initial, parent)
    parent = parent or __aimV9.pages.Settings
    label(parent, titleText, UDim2.fromOffset(440,20), UDim2.fromOffset(0,y),12,Color3.fromRGB(190,195,210)).ZIndex = 5
    local input = Instance.new("TextBox")
    input.Size = UDim2.fromOffset(300,30)
    input.Position = UDim2.fromOffset(0,y+20)
    input.BackgroundColor3 = Color3.fromRGB(23,25,34)
    input.TextColor3 = Color3.new(1,1,1)
    input.Font = Enum.Font.Gotham
    input.TextSize = 12
    input.ClearTextOnFocus = false
    input.Text = tostring(initial)
    input.ZIndex = 6
    input.Parent = parent
    corner(input,5)
    return input
end
__aimV9.bgIdBox = settingsInput("BACKGROUND IMAGE / DECAL ASSET ID",112,__aimV9.LLORONA_IMAGE_ID)
__aimV9.soundIdBox = settingsInput("ACCESS GRANTED SOUND ID (OPTIONAL)",205,__aimV9.ACCESS_GRANTED_SOUND_ID)
__aimV9.modeButton = button(__aimV9.pages.Settings, "IMAGE MODE: " .. __aimV9.imageDisplayMode, UDim2.fromOffset(220,28), UDim2.fromOffset(0,169))
__aimV9.modeButton.ZIndex = 6
__aimV9.mediaInfo = label(__aimV9.pages.Settings,"Enter an accessible Image ID and press APPLY BACKGROUND.",UDim2.fromOffset(455,45),UDim2.fromOffset(0,310),11,Color3.fromRGB(175,185,198))
__aimV9.mediaInfo.TextWrapped = true
__aimV9.mediaInfo.ZIndex = 6
__aimV9.applyBackground = button(__aimV9.pages.Settings,"APPLY BACKGROUND",UDim2.fromOffset(207,31),UDim2.fromOffset(0,266))
__aimV9.applyBackground.ZIndex = 6
__aimV9.applyAudio = button(__aimV9.pages.Settings,"APPLY AUDIO",UDim2.fromOffset(197,31),UDim2.fromOffset(218,266))
__aimV9.applyAudio.ZIndex = 6
__aimV9.imagePreview = Instance.new("ImageLabel")
__aimV9.imagePreview.Name = "BackgroundPreview"
__aimV9.imagePreview.Position = UDim2.fromOffset(344,116)
__aimV9.imagePreview.Size = UDim2.fromOffset(95,89)
__aimV9.imagePreview.BackgroundColor3 = Color3.fromRGB(16,16,16)
__aimV9.imagePreview.BorderSizePixel = 0
__aimV9.imagePreview.Image = __aimV9.bg.Image
__aimV9.imagePreview.ScaleType = Enum.ScaleType.Fit
__aimV9.imagePreview.ZIndex = 6
__aimV9.imagePreview.Parent = __aimV9.pages.Settings
corner(__aimV9.imagePreview,5)
local function showBackground()
    __aimV9.LLORONA_IMAGE_ID = tostring(__aimV9.bgIdBox.Text):match("(%d+)") or ""
    local url = backgroundAssetUrl(__aimV9.LLORONA_IMAGE_ID)
    __aimV9.bg.Image = url
    __aimV9.imagePreview.Image = url
    __aimV9.mediaInfo.Text = url ~= "" and "Loading image..." or "Background cleared (dark theme enabled)."
    queueSaveSettings()
    if url == "" then return end
    task.spawn(function()
        local success, result = pcall(function()
            local fetch = "Unknown"
            ContentProvider:PreloadAsync({__aimV9.imagePreview}, function(_, status)
                fetch = tostring(status)
            end)
            return fetch
        end)
        if not alive or __aimV9.bg.Image ~= url then return end
        if success and __aimV9.imagePreview.IsLoaded then
            __aimV9.mediaInfo.Text = "Background loaded. Mode: " .. __aimV9.imageDisplayMode
        elseif not success then
            __aimV9.mediaInfo.Text = "Background load error; see Roblox Output."
            warn("[AIM.WTF] Background loading:", result)
        else
            __aimV9.mediaInfo.Text = "Could not load. Check asset access or try THUMBNAIL mode."
            warn("[AIM.WTF] Image not loaded:", url, result)
        end
    end)
end
connect(__aimV9.modeButton.MouseButton1Click,function()
    __aimV9.imageDisplayMode = __aimV9.imageDisplayMode == "DIRECT" and "THUMBNAIL" or "DIRECT"
    __aimV9.modeButton.Text = "IMAGE MODE: " .. __aimV9.imageDisplayMode
    showBackground()
end)
connect(__aimV9.applyBackground.MouseButton1Click,showBackground)
connect(__aimV9.bgIdBox.FocusLost,function(enterPressed)
    if enterPressed then showBackground() end
end)
connect(__aimV9.applyAudio.MouseButton1Click,function()
    __aimV9.ACCESS_GRANTED_SOUND_ID = tostring(__aimV9.soundIdBox.Text):match("(%d+)") or ""
    __aimV9.accessGrantedSound.SoundId = assetUrl(__aimV9.ACCESS_GRANTED_SOUND_ID)
    queueSaveSettings()
    if __aimV9.accessGrantedSound.SoundId == "" then
        __aimV9.mediaInfo.Text = "Audio cleared. Background stays unchanged."
        return
    end
    __aimV9.mediaInfo.Text = "Testing audio..."
    local ok, err = pcall(function() __aimV9.accessGrantedSound:Play() end)
    if not ok then warn("[AIM.WTF] Audio error:", err) end
    task.delay(1,function()
        if alive then __aimV9.mediaInfo.Text = __aimV9.accessGrantedSound.IsLoaded and "Audio loaded." or "Audio inaccessible or still loading; check permissions." end
    end)
end)
__aimV9.saveNow = button(__aimV9.pages.Settings,"SAVE MY SETTINGS",UDim2.fromOffset(215,31),UDim2.fromOffset(0,365))
__aimV9.saveNow.ZIndex = 6
connect(__aimV9.saveNow.MouseButton1Click,function()
    saveSettingsNow()
    __aimV9.saveStatus.Text = "Save requested (" .. ((type(writefile) == "function" and type(readfile) == "function") and "file API + session" or "session only") .. ")"
end)
makeSlider(__aimV9.pages.Settings,"Menu Transparency (%)",0,70,menuTransparency,424,function(v)
    menuTransparency=v
    if applyMenuTransparency then applyMenuTransparency() end
end)
__aimV9.settingsScroll=Instance.new("ScrollingFrame")
__aimV9.settingsScroll.Name="SettingsScroll"
__aimV9.settingsScroll.Size=UDim2.fromScale(1,1)
__aimV9.settingsScroll.BackgroundTransparency=1
__aimV9.settingsScroll.BorderSizePixel=0
__aimV9.settingsScroll.ScrollBarThickness=4
__aimV9.settingsScroll.CanvasSize=UDim2.fromOffset(0,555)
__aimV9.settingsScroll.ZIndex=4
__aimV9.settingsScroll.Parent=__aimV9.pages.Settings
for _,item in ipairs(__aimV9.pages.Settings:GetChildren()) do
    if item~=__aimV9.settingsScroll then item.Parent=__aimV9.settingsScroll end
end
-- Environment controls are in the same scrollable Settings tab on desktop.
__aimV9.settingsScroll.CanvasSize = UDim2.fromOffset(0, 895)
label(__aimV9.settingsScroll,"ENVIRONMENT  /  SKYBOX & TIME",UDim2.fromOffset(440,28),UDim2.fromOffset(0,493),16,Color3.new(1,1,1),true).ZIndex=6
__aimV9.skyboxIdBox = settingsInput("SKYBOX IMAGE ASSET ID (ALL SIX FACES)",531,__aimV9.skyboxId,__aimV9.settingsScroll)
__aimV9.applySkyButton=button(__aimV9.settingsScroll,"APPLY SKYBOX",UDim2.fromOffset(200,32),UDim2.fromOffset(0,594))
__aimV9.applySkyButton.ZIndex=6
__aimV9.resetSkyButton=button(__aimV9.settingsScroll,"RESET GAME SKY",UDim2.fromOffset(202,32),UDim2.fromOffset(213,594))
__aimV9.resetSkyButton.ZIndex=6
__aimV9.skyStatus=label(__aimV9.settingsScroll,"Local skybox only • accessible image asset required.",UDim2.fromOffset(443,41),UDim2.fromOffset(0,634),11,Color3.fromRGB(179,190,201))
__aimV9.skyStatus.TextWrapped=true
__aimV9.skyStatus.ZIndex=6
local function setSkyboxFromInput()
    local raw = __aimV9.skyboxIdBox.Text
    local id = tostring(raw):match("(%d+)")
    if not id then
        __aimV9.skyStatus.Text="Enter a valid Roblox IMAGE ID, or press RESET GAME SKY."
        return
    end
    __aimV9.skyboxId=id
    applySkybox()
    queueSaveSettings()
    __aimV9.skyStatus.Text="Applied rbxassetid://" .. id .. " to six sky faces (local only)."
end
connect(__aimV9.applySkyButton.MouseButton1Click,setSkyboxFromInput)
connect(__aimV9.skyboxIdBox.FocusLost,function(enterPressed)
    if enterPressed then setSkyboxFromInput() end
end)
connect(__aimV9.resetSkyButton.MouseButton1Click,function()
    __aimV9.skyboxId=""
    __aimV9.skyboxIdBox.Text=""
    restoreSkybox()
    queueSaveSettings()
    __aimV9.skyStatus.Text="Restored the original game skybox."
end)
makeSlider(__aimV9.settingsScroll,"Local time of day (hour)",0,24,
    math.floor((__aimV9.clockTimeOverride or __aimV9.Lighting.ClockTime) + .5),688,
    function(v)
        __aimV9.clockTimeOverride = v
        applyClientTime()
        __aimV9.skyStatus.Text="Local time changed to " .. string.format("%02d:00",v%24) .. "."
    end,
    function(v) return string.format("%02d:00",v%24) end)
__aimV9.resetTimeButton=button(__aimV9.settingsScroll,"RESET GAME TIME",UDim2.fromOffset(200,32),UDim2.fromOffset(0,765))
__aimV9.resetTimeButton.ZIndex=6
connect(__aimV9.resetTimeButton.MouseButton1Click,function()
    __aimV9.clockTimeOverride=nil
    __aimV9.Lighting.ClockTime=__aimV9.originalClockTime
    queueSaveSettings()
    __aimV9.skyStatus.Text="Restored the original time. Move the slider to set it again."
end)
label(__aimV9.settingsScroll,"Settings save automatically. Access keys are NEVER stored.",UDim2.fromOffset(446,45),UDim2.fromOffset(0,823),12,Color3.fromRGB(225,225,225)).ZIndex=6
-- CONFIGS / named profiles: the ordinary autosave is still independent.
-- Use the selected game as a namespace, so Universal and MM2 have separate lists.
local configPage=__aimV9.pages.Configs
local configScroll=Instance.new("ScrollingFrame")
configScroll.Name="ConfigsScroll"
configScroll.Size=UDim2.fromScale(1,1)
configScroll.BackgroundTransparency=1
configScroll.BorderSizePixel=0
configScroll.ScrollBarThickness=4
configScroll.CanvasSize=UDim2.fromOffset(0,920)
configScroll.ZIndex=4
configScroll.Parent=configPage
label(configScroll,"CONFIGS / SAVED PROFILES",UDim2.fromOffset(440,30),UDim2.fromOffset(0,7),18,nil,true).ZIndex=6
local configGameLabel=label(configScroll,"GAME: Universal",UDim2.fromOffset(430,24),UDim2.fromOffset(0,44),12,Color3.fromRGB(190,190,215))
configGameLabel.ZIndex=6
local configNameBox=Instance.new("TextBox")
configNameBox.Size=UDim2.fromOffset(424,38)
configNameBox.Position=UDim2.fromOffset(0,75)
configNameBox.PlaceholderText="Config name (e.g. My Setup)"
configNameBox.Text=""
configNameBox.TextColor3=Color3.fromRGB(250,250,250)
configNameBox.BackgroundColor3=Color3.fromRGB(30,30,40)
configNameBox.TextSize=14
configNameBox.Font=Enum.Font.Gotham
configNameBox.ClearTextOnFocus=false
configNameBox.ZIndex=6
configNameBox.Parent=configScroll
corner(configNameBox,6)
local configSave=button(configScroll,"SAVE NEW",UDim2.fromOffset(200,37),UDim2.fromOffset(0,129))
local configOverwrite=button(configScroll,"OVERWRITE",UDim2.fromOffset(200,37),UDim2.fromOffset(215,129))
local configLoad=button(configScroll,"LOAD SELECTED",UDim2.fromOffset(200,37),UDim2.fromOffset(0,177))
local configRename=button(configScroll,"RENAME SELECTED",UDim2.fromOffset(200,37),UDim2.fromOffset(215,177))
local configDelete=button(configScroll,"DELETE SELECTED",UDim2.fromOffset(200,37),UDim2.fromOffset(0,225))
local configStatus=label(configScroll,"",UDim2.fromOffset(423,55),UDim2.fromOffset(0,275),12,Color3.fromRGB(200,210,235))
configStatus.TextWrapped=true
configStatus.ZIndex=6
local configRows={}
local function redrawConfigs()
    configGameLabel.Text="GAME: "..__aimV9.selectedGame.." • maximum 20 profiles per game"
    for _,item in ipairs(configRows) do item:Destroy() end
    table.clear(configRows)
    local names=profileAPI.names()
    for index,name in ipairs(names) do
        local chosen=profileAPI.selected==name
        local b=button(configScroll,(chosen and "●  " or "○  ")..name,UDim2.fromOffset(420,35),UDim2.fromOffset(0,355+(index-1)*40))
        b.TextXAlignment=Enum.TextXAlignment.Left
        b.ZIndex=6
        b.BackgroundColor3=chosen and Color3.fromRGB(69,82,111) or Color3.fromRGB(21,23,31)
        table.insert(configRows,b)
        connect(b.Activated,function()
            profileAPI.selected=name
            configNameBox.Text=name
            redrawConfigs()
        end)
    end
    configScroll.CanvasSize=UDim2.fromOffset(0,math.max(650,365+#names*40))
    configStatus.Text=profileAPI.status.."\n"..((type(readfile)=="function" and type(writefile)=="function")
        and "Profiles can persist via file API (if writes are allowed)."
        or "Session-only profiles. Roblox LocalScripts have no local file access.")
end
profileAPI.onRefresh=redrawConfigs
__aimV9.onConfigGameChanged=function()
    profileAPI.selected=nil
    __aimV9.MOBILE.configName=nil
    configNameBox.Text=""
    redrawConfigs()
end
connect(configSave.Activated,function() profileAPI.save(configNameBox.Text,false) redrawConfigs() end)
connect(configOverwrite.Activated,function() profileAPI.save(configNameBox.Text,true) redrawConfigs() end)
connect(configLoad.Activated,function() profileAPI.load() redrawConfigs() end)
connect(configRename.Activated,function() profileAPI.rename(configNameBox.Text) redrawConfigs() end)
local lastDeleteTap=0
connect(configDelete.Activated,function()
    if os.clock()-lastDeleteTap>3 then
        lastDeleteTap=os.clock()
        profileAPI.status="Press DELETE again within 3 seconds to confirm."
    else
        lastDeleteTap=0
        profileAPI.delete()
    end
    redrawConfigs()
end)

-- Apply validated profile values to active variables AND displayed desktop controls.
-- UI toggles use their existing callbacks for cleanup / camera / material side effects.
profileAPI.apply=function(snap)
    if type(snap)~="table" then error("Invalid saved config") end
    local function v(key,fallback,lo,hi)
        local num=tonumber(snap[key])
        return num and math.clamp(num,lo,hi) or fallback
    end
    speedValue=v("speed",speedValue,8,120)
    jumpValue=v("jump",jumpValue,30,180)
    flySpeed=v("flySpeed",flySpeed,10,180)
    armSize=v("armSize",armSize,2,40)
    gunFireRate=v("gunFireRate",gunFireRate,1,20)
    gunFireInterval=1/math.max(1,gunFireRate)
    gunMaterialIndex=math.floor(v("gunMaterialIndex",gunMaterialIndex,1,9))
    __aimV9.tracerSourceIndex=math.floor(v("tracerSourceIndex",__aimV9.tracerSourceIndex,1,4))
    __aimV9.tracerColorIndex=math.floor(v("tracerColorIndex",__aimV9.tracerColorIndex,1,4))
    aimSmoothness=v("aimSmoothness",aimSmoothness,0,30)
    aimFOV=v("aimFOV",aimFOV,60,350)
    __aimV9.silentAimFOV=v("silentAimFOV",__aimV9.silentAimFOV,25,500)
    spinSpeed=v("spinSpeed",spinSpeed,60,7200)
    __aimV9.triggerFOV=math.floor(v("triggerFOV",__aimV9.triggerFOV,25,450))
    __aimV9.triggerReactionMs=math.floor(v("triggerReactionMs",__aimV9.triggerReactionMs,0,500))
    __aimV9.triggerSmoothness=math.floor(v("triggerSmoothness",__aimV9.triggerSmoothness,1,100))
    __aimV9.triggerModeIndex=math.floor(v("triggerModeIndex",__aimV9.triggerModeIndex,1,#__aimV9.triggerModeNames))
    thirdPersonDistance=v("cameraDistance",thirdPersonDistance,3,24)
    cameraFOV=v("cameraFOV",cameraFOV,40,120)
    cameraFovChanged=true
    colorIndex=math.floor(v("chamsColor",colorIndex,1,7))
    antiAimDegrees=v("antiAimDegrees",antiAimDegrees,20,180)
    __aimV9.antiAimJitterSpeed=v("antiAimJitterSpeed",__aimV9.antiAimJitterSpeed,6,60)
    ghostDistance=v("ghostDistance",ghostDistance,1,15)
    enemyHeadSize=v("enemyHeadSize",enemyHeadSize,2,9)
    menuTransparency=v("menuTransparency",menuTransparency,0,70)
    hitSoundVolume=v("hitSoundVolume",hitSoundVolume,0,100)
    chamFinishIndex=math.floor(v("chamFinishIndex",chamFinishIndex,1,#__aimV9.chamFinishes))
    __aimV9.MM2.aimFOV=math.floor(v("mm2AimFOV",__aimV9.MM2.aimFOV,40,420))
    __aimV9.MM2.aimSmoothness=math.floor(v("mm2AimSmoothness",__aimV9.MM2.aimSmoothness,1,100))
    __aimV9.MM2.aimRoleIndex=math.floor(v("mm2AimRoleIndex",__aimV9.MM2.aimRoleIndex,1,#__aimV9.MM2.aimRoles))
    __aimV9.danceSpeedPercent=v("danceSpeed",__aimV9.danceSpeedPercent,50,200)
    if __aimV9.admin then __aimV9.admin.flingStrength=v("flingStrength",__aimV9.admin.flingStrength,60,190) end
    if type(snap.movementKeybinds)=="table" then
        for _,feature in ipairs(__aimV9.keybindNames) do
            local keyName=snap.movementKeybinds[feature]
            if type(keyName)=="string" then
                __aimV9.keybindSet(feature,keyName)
            end
        end
    end
    ambience.customR=v("ambienceCustomR",ambience.customR,0,255)
    ambience.customG=v("ambienceCustomG",ambience.customG,0,255)
    ambience.customB=v("ambienceCustomB",ambience.customB,0,255)
    ambience.apply(v("ambienceIndex",ambience.index,1,#ambience.presets),true)
    if snap.perfLowTexture~=nil then perf.setLow(snap.perfLowTexture==true) end
    if snap.perfFpsTarget~=nil then perf.setCap(v("perfFpsTarget",0,0,500)) end
    if type(snap.danceAssetId)=="string" then __aimV9.danceAssetId=snap.danceAssetId:match("(%d+)") or "" end
    hitSoundId=tostring(snap.hitSoundId or hitSoundId):match("(%d+)") or ""
    __aimV9.LLORONA_IMAGE_ID=tostring(snap.imageId or ""):match("(%d+)") or ""
    __aimV9.ACCESS_GRANTED_SOUND_ID=tostring(snap.audioId or ""):match("(%d+)") or ""
    __aimV9.imageDisplayMode=snap.imageMode=="THUMBNAIL" and "THUMBNAIL" or "DIRECT"
    __aimV9.skyboxId=tostring(snap.skyboxId or ""):match("(%d+)") or ""
    __aimV9.clockTimeOverride=snap.clockTimeOverride and v("clockTimeOverride",__aimV9.Lighting.ClockTime,0,24) or nil
    if __aimV9.bgIdBox then __aimV9.bgIdBox.Text=__aimV9.LLORONA_IMAGE_ID end
    if __aimV9.soundIdBox then __aimV9.soundIdBox.Text=__aimV9.ACCESS_GRANTED_SOUND_ID end
    if __aimV9.skyboxIdBox then __aimV9.skyboxIdBox.Text=__aimV9.skyboxId end
    if __aimV9.modeButton then __aimV9.modeButton.Text="IMAGE MODE: "..__aimV9.imageDisplayMode end
    local bg=backgroundAssetUrl(__aimV9.LLORONA_IMAGE_ID)
    if __aimV9.bg then __aimV9.bg.Image=bg end
    if __aimV9.imagePreview then __aimV9.imagePreview.Image=bg end
    if __aimV9.accessGrantedSound then __aimV9.accessGrantedSound.SoundId=assetUrl(__aimV9.ACCESS_GRANTED_SOUND_ID) end
    if hitSound then hitSound.SoundId=hitSoundId~="" and assetUrl(hitSoundId) or "rbxasset://sounds/electronicpingshort.wav" hitSound.Volume=hitSoundVolume/100 end
    if __aimV9.skyboxId~="" then applySkybox() else restoreSkybox() end
    if __aimV9.clockTimeOverride~=nil then applyClientTime() else __aimV9.Lighting.ClockTime=__aimV9.originalClockTime end
    if applyMenuTransparency then applyMenuTransparency() end
    if __aimV9.triggerModeButton then __aimV9.triggerModeButton.Text="FIRE METHOD: "..__aimV9.triggerModeNames[__aimV9.triggerModeIndex] end
    if __aimV9.tracerSourceButton then __aimV9.tracerSourceButton.Text="TRACER SOURCE: "..__aimV9.tracerSources[__aimV9.tracerSourceIndex] end
    if __aimV9.tracerColorButton then __aimV9.tracerColorButton.Text="TRACER COLOR: "..__aimV9.tracerColors[__aimV9.tracerColorIndex] end
    if __aimV9.MM2.roleButton then __aimV9.MM2.roleButton.Text="AIM TARGET: "..__aimV9.MM2.aimRoles[__aimV9.MM2.aimRoleIndex] end
    if __aimV9.MM2.finishButton then __aimV9.MM2.finishButton.Text="CHAMS FINISH: "..__aimV9.chamFinishes[chamFinishIndex] end
    if __aimV9.gunStatusLabel then __aimV9.gunStatusLabel.Text="Selected rate: "..math.floor(gunFireRate).." shots/sec.\nCompatible Tools only; game servers can still cap firing." end
    if __aimV9.gunFinishButton and __aimV9.gunMaterials then __aimV9.gunFinishButton.Text="GUN FINISH: "..__aimV9.gunMaterials[gunMaterialIndex].label end
    if __aimV9.colorButton then __aimV9.colorButton.Text="CHAMS COLOR: "..__aimV9.chamsModes[colorIndex] end
    if type(snap.state)=="table" then
        for key,desired in pairs(snap.state) do
            if type(desired)=="boolean" and state[key]~=nil and not key:match("^Blox")
                and state[key]~=desired then
                if __aimV9.toggleActions[key] then
                    __aimV9.toggleActions[key]()
                else
                    state[key]=desired
                end
            end
        end
    end
    for caption,value in pairs({
        ["Walk Speed"]=speedValue,["Jump Power"]=jumpValue,["Fly Speed"]=flySpeed,
        ["Arm Length (studs)"]=armSize,["Spin Speed (degrees/s)"]=spinSpeed,
        ["Jitter Angle (degrees)"]=antiAimDegrees,["Jitter Speed (flips/sec)"]=__aimV9.antiAimJitterSpeed,
        ["Ghost Trail Distance"]=ghostDistance,["Enemy Head Size (local)"]=enemyHeadSize,
        ["MM2 Aim FOV (pixels)"]=__aimV9.MM2.aimFOV,["MM2 Aim Smoothness"]=__aimV9.MM2.aimSmoothness,
        ["Dance speed (%)"]=__aimV9.danceSpeedPercent,["Touch fling strength"]=__aimV9.admin.flingStrength,
        ["Aim Smoothness"]=aimSmoothness,["Camera Aim FOV (pixels)"]=aimFOV,
        ["Silent Aim FOV (pixels)"]=__aimV9.silentAimFOV,["Hit Volume"]=hitSoundVolume,
        ["Fire Rate (shots/sec)"]=gunFireRate,["Trigger FOV (pixels)"]=__aimV9.triggerFOV,
        ["Trigger reaction (ms)"]=__aimV9.triggerReactionMs,["Trigger lock smoothness"]=__aimV9.triggerSmoothness,
        ["Camera Distance"]=thirdPersonDistance,["Camera FOV (degrees)"]=cameraFOV,
        ["Menu Transparency (%)"]=menuTransparency,
        ["Ambience Red"]=ambience.customR,
        ["Ambience Green"]=ambience.customG,
        ["Ambience Blue"]=ambience.customB,
        ["Local time of day (hour)"]=math.floor((__aimV9.clockTimeOverride or __aimV9.Lighting.ClockTime)+.5),
    }) do
        if __aimV9.sliderSetters[caption] then __aimV9.sliderSetters[caption](value) end
    end
    __aimV9.MM2.target=nil
    __aimV9.MM2.lastVisualScan=-math.huge
    __aimV9.MM2.update()
    __aimV9.lastGlossyTick=-math.huge
    applyGunAppearance()
    updateArmExtender()
    updateCameraSettings()
    __aimV9.applyFireControls(activeTool())
    __aimV9.updateESPPreview()
    if __aimV9.dance.track then pcall(function() __aimV9.dance.track:AdjustSpeed(__aimV9.danceSpeedPercent/100) end) end
    saveSettingsNow()
end
redrawConfigs()
selectTab("Games")

-- Touch UI is separate from the desktop 860px layout so buttons stay tappable.
-- All actions share the existing state, key validation, and saved settings.
function __aimV9.MOBILE.build()
    if not UIS.TouchEnabled then return end

    local win = Instance.new("Frame")
    win.Name = "AIMWTF_MobileHub"
    win.AnchorPoint = Vector2.new(.5,.5)
    win.Position = UDim2.fromScale(.5,.5)
    win.Size = UDim2.new(1,-16,1,-110)
    win.BackgroundColor3 = Color3.fromRGB(11,18,30)
    win.BorderSizePixel = 0
    win.Visible = false
    win.ZIndex = 40
    win.Parent = gui
    corner(win,8)
    stroke(win,Color3.fromRGB(60,100,157))
    __aimV9.MOBILE.menu = win
    addConstellationStars(win,41)

    local h = label(win,"AIM.WTF   /   MOBILE",UDim2.new(1,-110,0,46),UDim2.fromOffset(14,5),21,Color3.fromRGB(224,239,255),true)
    h.ZIndex = 45
    local hide = button(win,"HIDE",UDim2.fromOffset(70,36),UDim2.new(1,-78,0,10))
    hide.ZIndex=43
    hide.BackgroundColor3=Color3.fromRGB(50,96,155)
    hide.Activated:Connect(function()
        win.Visible=false
        if __aimV9.MOBILE.refreshVisibility then __aimV9.MOBILE.refreshVisibility() end
    end)

    local tabsFrame = Instance.new("ScrollingFrame")
    tabsFrame.Size = UDim2.new(1,-12,0,51)
    tabsFrame.Position = UDim2.fromOffset(6,55)
    tabsFrame.BackgroundTransparency=1
    tabsFrame.BorderSizePixel=0
    tabsFrame.ScrollBarThickness=2
    tabsFrame.ScrollingDirection=Enum.ScrollingDirection.X
    tabsFrame.CanvasSize=UDim2.fromOffset(#__aimV9.tabs * 110,0)
    tabsFrame.ZIndex=41
    tabsFrame.Parent=win

    local area = Instance.new("ScrollingFrame")
    area.Name="Controls"
    area.Size=UDim2.new(1,-16,1,-170)
    area.Position=UDim2.fromOffset(8,111)
    area.CanvasSize=UDim2.fromOffset(0,0)
    area.BackgroundTransparency=1
    area.BorderSizePixel=0
    area.ScrollBarThickness=4
    area.ZIndex=41
    area.Parent=win
    -- Compact profile strip stays in the bottom corner of the mobile panel.
    local mobileProfile=Instance.new("Frame")
    mobileProfile.Name="MobileProfile"
    mobileProfile.Size=UDim2.new(1,-16,0,39)
    mobileProfile.Position=UDim2.new(0,8,1,-46)
    mobileProfile.BackgroundColor3=Color3.fromRGB(24,38,61)
    mobileProfile.BorderSizePixel=0
    mobileProfile.ZIndex=48
    mobileProfile.Parent=win
    corner(mobileProfile,8)
    local mobileAvatar=Instance.new("ImageLabel")
    mobileAvatar.Size=UDim2.fromOffset(30,30)
    mobileAvatar.Position=UDim2.fromOffset(5,4)
    mobileAvatar.BackgroundColor3=Color3.fromRGB(35,60,91)
    mobileAvatar.BorderSizePixel=0
    mobileAvatar.ZIndex=49
    mobileAvatar.Parent=mobileProfile
    corner(mobileAvatar,7)
    __aimV9.mobileTimeLabel=label(mobileProfile,"@"..player.Name.."  •  --:--",UDim2.new(1,-47,1,0),UDim2.fromOffset(43,0),12,Color3.fromRGB(194,219,249),true)
    __aimV9.mobileTimeLabel.TextTruncate=Enum.TextTruncate.AtEnd
    __aimV9.mobileTimeLabel.ZIndex=49
    task.spawn(function()
        local ok,thumb=pcall(function()
            return Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size150x150)
        end)
        if ok and alive and mobileAvatar.Parent then mobileAvatar.Image=thumb end
    end)

    local layout=Instance.new("UIListLayout")
    layout.Padding=UDim.new(0,8)
    layout.SortOrder=Enum.SortOrder.LayoutOrder
    layout.Parent=area
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        area.CanvasSize=UDim2.fromOffset(0,layout.AbsoluteContentSize.Y+20)
    end)

    local currentTab="Games"
    local refresh
    local sliderConnections={}
    local function clearRows()
        for _,c in ipairs(sliderConnections) do c:Disconnect() end
        table.clear(sliderConnections)
        for _,child in ipairs(area:GetChildren()) do
            if child ~= layout then child:Destroy() end
        end
    end
    local function addButton(text, handler)
        local b = button(area,text,UDim2.new(1,-10,0,49),UDim2.new())
        b.TextSize=15
        b.ZIndex=43
        b.LayoutOrder=#area:GetChildren()
        b.Activated:Connect(handler)
        return b
    end
    local function addToggle(name, display)
        local b
        local function update()
            b.Text = (state[name] and "●  " or "○  ")..display..(state[name] and "   ON" or "   OFF")
            b.BackgroundColor3=state[name] and Color3.fromRGB(237,237,237) or Color3.fromRGB(29,29,33)
            b.TextColor3=state[name] and Color3.fromRGB(10,10,10) or Color3.fromRGB(242,242,242)
        end
        b=addButton(display,function()
            local action = __aimV9.toggleActions[name]
            if action then action() else
                state[name]=not state[name]
                queueSaveSettings()
            end
            update()
        end)
        update()
    end
    local function addSlider(text, low, high, start, onChange)
        local row=Instance.new("Frame")
        row.Size=UDim2.new(1,-10,0,73)
        row.BackgroundColor3=Color3.fromRGB(27,27,30)
        row.BorderSizePixel=0
        row.LayoutOrder=#area:GetChildren()
        row.ZIndex=42
        row.Parent=area
        corner(row,4)
        local lbl=label(row,"",UDim2.new(1,-16,0,24),UDim2.fromOffset(8,3),14,Color3.fromRGB(235,235,240),true)
        lbl.ZIndex=43
        local bar=Instance.new("Frame")
        bar.Size=UDim2.new(1,-24,0,13)
        bar.Position=UDim2.fromOffset(12,43)
        bar.BackgroundColor3=Color3.fromRGB(64,64,70)
        bar.ZIndex=43
        bar.Parent=row
        corner(bar,7)
        local fill=Instance.new("Frame")
        fill.Size=UDim2.fromScale(0,1)
        fill.BackgroundColor3=Color3.fromRGB(245,245,245)
        fill.BorderSizePixel=0
        fill.ZIndex=44
        fill.Parent=bar
        corner(fill,7)
        local hit=Instance.new("TextButton")
        hit.Text=""
        hit.BackgroundTransparency=1
        hit.Size=UDim2.new(1,12,0,40)
        hit.Position=UDim2.fromOffset(-6,-12)
        hit.ZIndex=45
        hit.Parent=bar
        local finger=nil
        local mouseDown=false
        local function update(v)
            local p=math.clamp((v-low)/(high-low),0,1)
            fill.Size=UDim2.fromScale(p,1)
            lbl.Text=text..": "..tostring(v)
        end
        local function move(x)
            local p=math.clamp((x-bar.AbsolutePosition.X)/math.max(1,bar.AbsoluteSize.X),0,1)
            local v=math.floor(low + p*(high-low)+.5)
            update(v)
            onChange(v)
            queueSaveSettings()
        end
        update(start)
        hit.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.Touch then
                finger=i move(i.Position.X)
            elseif i.UserInputType == Enum.UserInputType.MouseButton1 then
                mouseDown=true move(i.Position.X)
            end
        end)
        table.insert(sliderConnections,UIS.InputChanged:Connect(function(i)
            if i == finger or (mouseDown and i.UserInputType==Enum.UserInputType.MouseMovement) then
                move(i.Position.X)
            end
        end))
        table.insert(sliderConnections,UIS.InputEnded:Connect(function(i)
            if i == finger then finger=nil end
            if i.UserInputType == Enum.UserInputType.MouseButton1 then mouseDown=false end
        end))
    end
    local function mobileField(heading,value,action)
        local frame=Instance.new("Frame")
        frame.BackgroundTransparency=1
        frame.Size=UDim2.new(1,-10,0,92)
        frame.LayoutOrder=#area:GetChildren()
        frame.ZIndex=42
        frame.Parent=area
        local lbl=label(frame,heading,UDim2.new(1,0,0,22),UDim2.fromOffset(3,0),13,Color3.fromRGB(210,210,220),true)
        lbl.ZIndex=43
        local entry=Instance.new("TextBox")
        entry.PlaceholderText="Roblox asset ID"
        entry.Text=tostring(value)
        entry.TextColor3=Color3.new(1,1,1)
        entry.BackgroundColor3=Color3.fromRGB(37,37,42)
        entry.ClearTextOnFocus=false
        entry.Size=UDim2.new(1,-108,0,47)
        entry.Position=UDim2.fromOffset(3,27)
        entry.Font=Enum.Font.Gotham
        entry.TextSize=15
        entry.ZIndex=44
        entry.Parent=frame
        corner(entry,5)
        local b=button(frame,"APPLY",UDim2.fromOffset(94,47),UDim2.new(1,-96,0,27))
        b.ZIndex=44
        b.Activated:Connect(function() action(entry.Text) end)
        return entry
    end
    function refresh()
        clearRows()
        if currentTab=="Games" then
            addButton("1  UNIVERSAL"..(__aimV9.selectedGame=="Universal" and "  [SELECTED]" or ""),function()
                __aimV9.selectGame("Universal")
                currentTab="ESP"
                refresh()
            end)
            addButton("2  MM2"..(__aimV9.selectedGame=="MM2" and "  [SELECTED]" or ""),function()
                __aimV9.selectGame("MM2")
                currentTab="MM2"
                refresh()
            end)
        elseif currentTab=="MM2" then
            addToggle("MM2MurdererESP","RED murderer ESP (observed role)")
            addToggle("MM2SheriffESP","BLUE Sheriff/Hero ESP")
            addToggle("MM2MurdererChams","Red murderer material")
            addToggle("MM2SheriffChams","Blue Sheriff/Hero material")
            addToggle("MM2Aim","Hold mobile AIM for camera assist")
            addToggle("MM2VisibleOnly","Visibility check")
            addButton("AIM TARGET: "..__aimV9.MM2.aimRoles[__aimV9.MM2.aimRoleIndex],function()
                local m=__aimV9.MM2
                m.aimRoleIndex=m.aimRoleIndex%#m.aimRoles+1
                if m.roleButton then m.roleButton.Text="AIM TARGET: "..m.aimRoles[m.aimRoleIndex] end
                m.target=nil
                queueSaveSettings() refresh()
            end)
            addButton("CHAMS FINISH: "..__aimV9.chamFinishes[chamFinishIndex],function()
                chamFinishIndex=chamFinishIndex%#__aimV9.chamFinishes+1
                if __aimV9.MM2.finishButton then __aimV9.MM2.finishButton.Text="CHAMS FINISH: "..__aimV9.chamFinishes[chamFinishIndex] end
                __aimV9.MM2.lastVisualScan=-math.huge
                queueSaveSettings() refresh()
            end)
            addSlider("MM2 Aim FOV",40,420,__aimV9.MM2.aimFOV,function(v) __aimV9.MM2.aimFOV=v __aimV9.MM2.target=nil end)
            addSlider("MM2 Aim Smoothness",1,100,__aimV9.MM2.aimSmoothness,function(v) __aimV9.MM2.aimSmoothness=v end)
        elseif currentTab=="ESP" then
            addToggle("ESP","Player ESP")
            addToggle("TeamCheck","Enemy-only team check")
            addToggle("Chams","Outline + selected material")
            addToggle("GlossyChams","Material-only character finish")
            addToggle("FacingESP","Facing direction arrows")
            addToggle("SkeletonESP","Skeleton")
            addToggle("HeadExpander","Local head expander")
            addSlider("Head size",2,9,enemyHeadSize,function(v) enemyHeadSize=v updateEnemyHeads() end)
            addButton("CHAMS FINISH: "..__aimV9.chamFinishes[chamFinishIndex],function()
                chamFinishIndex=chamFinishIndex%#__aimV9.chamFinishes+1
                __aimV9.lastGlossyTick = -math.huge
                queueSaveSettings() refresh()
            end)
            local prev=Instance.new("Frame")
            prev.Size=UDim2.new(1,-10,0,270)
            prev.BackgroundColor3=Color3.fromRGB(6,6,6)
            prev.BorderSizePixel=0
            prev.ZIndex=42
            prev.LayoutOrder=#area:GetChildren()
            prev.Parent=area
            corner(prev,8)
            stroke(prev,Color3.fromRGB(122,122,122))
            local tit=label(prev,"ESP LIVE PREVIEW",UDim2.new(1,-20,0,26),UDim2.fromOffset(14,12),15,Color3.new(1,1,1),true)
            tit.ZIndex=43
            local live=label(prev,state.TeamCheck and "ENEMIES ONLY" or "ALL TEAMS",UDim2.new(1,-20,0,19),UDim2.fromOffset(14,39),11,Color3.fromRGB(182,182,182))
            live.ZIndex=43
            local fig=Instance.new("Frame")
            fig.Name="ESPTarget"
            fig.Size=UDim2.fromOffset(100,164)
            fig.Position=UDim2.new(.5,-50,0,76)
            fig.BackgroundTransparency=1
            fig.Parent=prev
            fig.ZIndex=43
            stroke(fig,chamsColor(),2)
            local head=Instance.new("Frame")
            head.Size=UDim2.fromOffset(31,34)
            head.Position=UDim2.fromOffset(34,12)
            head.BackgroundColor3=state.Chams and chamsColor() or Color3.fromRGB(110,110,110)
            head.ZIndex=44 head.Parent=fig
            corner(head,6)
            local body=Instance.new("Frame")
            body.Size=UDim2.fromOffset(55,76)
            body.Position=UDim2.fromOffset(23,51)
            body.BackgroundColor3=state.Chams and chamsColor() or Color3.fromRGB(110,110,110)
            body.ZIndex=44 body.Parent=fig
            corner(body,6)
            local name=label(prev,"ENEMY  |  24m",UDim2.new(1,-20,0,21),UDim2.fromOffset(14,240),13,chamsColor(),true)
            name.TextXAlignment=Enum.TextXAlignment.Center
            name.ZIndex=44
            name.Visible=state.ESP
            local arrow=label(prev,"↗",UDim2.fromOffset(35,40),UDim2.new(.5,60,0,70),26,chamsColor(),true)
            arrow.ZIndex=44
            arrow.Visible=state.FacingESP and state.ESP
            addButton("CHAMS COLOR: "..__aimV9.chamsModes[colorIndex],function()
                colorIndex=colorIndex%#__aimV9.chamsModes+1
                __aimV9.colorButton.Text="CHAMS COLOR: "..__aimV9.chamsModes[colorIndex]
                __aimV9.lastGlossyTick = -math.huge
                queueSaveSettings()
                refresh()
            end)
        elseif currentTab=="Movement" then
            for _,entry in ipairs({{"Speed","Speed"},{"Jump","Jump"},{"Fly","Fly (joystick + UP/DOWN)"},{"Noclip","Noclip"},{"Arms","Arm resizer"},{"Spinbot","Spinbot"},{"AntiAim","Facing jitter"},{"GhostDecoy","Trailing visual decoy"},{"PlayerTrail","Walking trail"}}) do
                addToggle(entry[1],entry[2])
            end
            addSlider("Speed",8,120,speedValue,function(v) speedValue=v end)
            addSlider("Jump",30,180,jumpValue,function(v) jumpValue=v end)
            addSlider("Fly speed",10,180,flySpeed,function(v) flySpeed=v end)
            addSlider("Arm length",2,40,armSize,function(v) armSize=v if state.Arms then updateArmExtender() end end)
            addSlider("Spin speed (deg/s)",60,7200,spinSpeed,function(v) spinSpeed=v end)
            addSlider("Jitter angle (degrees)",20,180,antiAimDegrees,function(v) antiAimDegrees=v end)
            addSlider("Jitter speed (flips/sec)",6,60,__aimV9.antiAimJitterSpeed,function(v) __aimV9.antiAimJitterSpeed=v end)
            addSlider("Ghost trail distance",1,15,ghostDistance,function(v) ghostDistance=v end)
            addButton("PASTEFY MOVEMENT - UNVERIFIED",function()
                if __aimV9.externalMovementNotice then
                    __aimV9.externalMovementNotice.Text="Pastefy source contains obfuscated remote code. Not executed."
                end
            end)
        elseif currentTab=="Performance" then
            addToggle("ActiveHUD","Active Features HUD")
            addButton("LOW TEXTURE: "..(perf.lowTexture and "ON" or "OFF"),function()
                perf.setLow(not perf.lowTexture)
                refresh()
            end)
            addButton("RESTORE ORIGINAL GRAPHICS",function()
                perf.setLow(false)
                refresh()
            end)
            addButton("FPS TARGET: "..(perf.fpsTarget==0 and "DEFAULT" or tostring(perf.fpsTarget)),function()
                local opts={0,60,120,144,240,500}
                local index=1
                for i,val in ipairs(opts) do if val==perf.fpsTarget then index=i break end end
                perf.fpsTarget=opts[(index%#opts)+1]
                perf.updateUI()
                queueSaveSettings()
                refresh()
            end)
            addButton("REQUEST FPS CAP",function()
                perf.setCap(perf.fpsTarget)
                refresh()
            end)
            local info=label(area,"Current FPS: "..perf.fps.."\n"..perf.graphicsStatus.."\n"..perf.fpsStatus.."\n500 FPS isn't guaranteed; official maximum is 240.",
                UDim2.new(1,-10,0,145),UDim2.new(),13,Color3.fromRGB(215,220,235))
            info.TextWrapped=true info.LayoutOrder=#area:GetChildren() info.ZIndex=43
        elseif currentTab=="Ambience" then
            addButton("PALETTE: "..ambience.presets[ambience.index],function()
                ambience.index=ambience.index%#ambience.presets+1
                ambience.refresh() queueSaveSettings() refresh()
            end)
            addButton("APPLY WORLD AMBIENCE",function() ambience.apply(ambience.index) refresh() end)
            addButton("RESTORE ORIGINAL LIGHTING",function() ambience.apply(1) refresh() end)
            addSlider("Custom Red",0,255,ambience.customR,function(v)
                ambience.customR=v
                if ambience.index==7 then ambience.apply(7) end
            end)
            addSlider("Custom Green",0,255,ambience.customG,function(v)
                ambience.customG=v
                if ambience.index==7 then ambience.apply(7) end
            end)
            addSlider("Custom Blue",0,255,ambience.customB,function(v)
                ambience.customB=v
                if ambience.index==7 then ambience.apply(7) end
            end)
        elseif currentTab=="Keybinds" then
            for _,feature in ipairs(__aimV9.keybindNames) do
                addButton(feature.."  ["..(__aimV9.keybinds[feature] or "NONE").."]",function()
                    __aimV9.keybindCapture=feature
                    __aimV9.keybindRefresh()
                    refresh()
                end)
            end
            addButton("CLEAR PENDING KEY",function() __aimV9.keybindCapture=nil refresh() end)
        elseif currentTab=="Dance" then
            addButton("TAKE THE L (CUSTOM ANIMATION ID)",function()
                local _,message=__aimV9.dance.play("Take The L")
                if __aimV9.danceStatus then __aimV9.danceStatus.Text=message end
            end)
            for _,name in ipairs({"Dance 1","Dance 2","Dance 3"}) do
                addButton(string.upper(name),function()
                    local _,message=__aimV9.dance.play(name)
                    if __aimV9.danceStatus then __aimV9.danceStatus.Text=message end
                end)
            end
            addButton("STOP DANCE",function()
                __aimV9.dance.stop()
                if __aimV9.danceStatus then __aimV9.danceStatus.Text="Stopped." end
            end)
            mobileField("Take The L animation ID",__aimV9.danceAssetId,function(value)
                __aimV9.danceAssetId=tostring(value):match("(%d+)") or ""
                danceIdInput.Text=__aimV9.danceAssetId
                queueSaveSettings()
            end)
            addSlider("Dance speed (%)",50,200,__aimV9.danceSpeedPercent,function(v)
                __aimV9.danceSpeedPercent=v
                if __aimV9.dance.track then pcall(function() __aimV9.dance.track:AdjustSpeed(v/100) end) end
            end)
        elseif currentTab=="Admin" then
            addButton("KILL ALL - OWNER SERVER ONLY",function()
                __aimV9.admin.send("kill_all")
                if __aimV9.adminStatus then __aimV9.adminStatus.Text=__aimV9.admin.lastStatus end
            end)
            addButton("TOUCH FLING: "..(__aimV9.admin.touchFling and "ON" or "OFF"),function()
                __aimV9.admin.setFling(not __aimV9.admin.touchFling)
                __aimV9.flingButton.Text="TOUCH FLING: "..(__aimV9.admin.touchFling and "ON" or "OFF")
                if __aimV9.adminStatus then __aimV9.adminStatus.Text=__aimV9.admin.lastStatus end
                refresh()
            end)
            addSlider("Touch fling strength",60,190,__aimV9.admin.flingStrength,function(v)
                __aimV9.admin.flingStrength=v
                if __aimV9.admin.touchFling then __aimV9.admin.setFling(true) end
            end)
        elseif currentTab=="Aim" then
            addToggle("AimAssist","Camera aim assist")
            addToggle("StickyAim","Sticky camera target")
            addToggle("Triggerbot","FOV head lock + automatic fire")
            addToggle("ShowTriggerFOV","Trigger FOV circle")
            addSlider("Trigger FOV (pixels)",25,450,__aimV9.triggerFOV,function(v) __aimV9.triggerFOV=v end)
            addSlider("Reaction time (ms)",0,500,__aimV9.triggerReactionMs,function(v) __aimV9.triggerReactionMs=v end)
            addSlider("Headlock smoothness",1,100,__aimV9.triggerSmoothness,function(v) __aimV9.triggerSmoothness=v end)
            addButton("TRIGGER FIRE METHOD: "..__aimV9.triggerModeNames[__aimV9.triggerModeIndex],function()
                __aimV9.triggerModeIndex=__aimV9.triggerModeIndex%#__aimV9.triggerModeNames+1
                if __aimV9.triggerModeButton then
                    __aimV9.triggerModeButton.Text="FIRE METHOD: "..__aimV9.triggerModeNames[__aimV9.triggerModeIndex]
                end
                queueSaveSettings() refresh()
            end)
            addToggle("SilentAim","Compatible gun APIs only")
            addToggle("ShowSilentFOV","Show white silent aim circle")
            addToggle("Tracers","Tool, physical projectiles, and sound-based fallback")
            addButton("TRACER SOURCE: "..__aimV9.tracerSources[__aimV9.tracerSourceIndex],function()
                __aimV9.tracerSourceIndex=__aimV9.tracerSourceIndex%#__aimV9.tracerSources+1
                queueSaveSettings() refresh()
            end)
            addButton("TRACER COLOR: "..__aimV9.tracerColors[__aimV9.tracerColorIndex],function()
                __aimV9.tracerColorIndex=__aimV9.tracerColorIndex%#__aimV9.tracerColors+1
                queueSaveSettings() refresh()
            end)
            addToggle("HitSounds","Local hit sound")
            addToggle("ContinuousFire","Repeat Tool activations while firing")
            addToggle("NoGunCooldown","Remove client extra delay (compatible Tools)")
            addSlider("Fire Rate (shots/sec)",1,20,gunFireRate,function(v)
                gunFireRate=v
                gunFireInterval=1/math.max(1,v)
                __aimV9.applyFireControls(activeTool())
            end)
            addSlider("Hit volume",0,100,hitSoundVolume,function(v) hitSoundVolume=v hitSound.Volume=v/100 end)
            addSlider("Aim smoothness",0,30,aimSmoothness,function(v) aimSmoothness=v end)
            addSlider("Camera aim FOV",60,350,aimFOV,function(v) aimFOV=v end)
            addSlider("Silent aim FOV",25,500,__aimV9.silentAimFOV,function(v) __aimV9.silentAimFOV=v end)
            addButton("TOGGLE AIM WHILE PLAYING",function()
                if __aimV9.MOBILE.quickAim then
                    __aimV9.MOBILE.aiming=not __aimV9.MOBILE.aiming
                    __aimV9.MOBILE.quickAim.Text=__aimV9.MOBILE.aiming and "AIM ON" or "AIM"
                end
            end)
        elseif currentTab=="Camera" then
            addToggle("ThirdPerson","Third-person camera")
            addSlider("Camera distance",3,24,thirdPersonDistance,function(v) thirdPersonDistance=v end)
            addSlider("Camera FOV",40,120,cameraFOV,function(v) cameraFOV=v cameraFovChanged=true end)
        elseif currentTab=="Chat" then
            for _,msg in ipairs({"gg","Nice play!","Well played!","Good luck, have fun!"}) do
                addButton("SEND: "..msg,function()
                    pcall(function()
                        local channels=TextChatService:FindFirstChild("TextChannels")
                        local general=channels and channels:FindFirstChild("RBXGeneral")
                        if general then general:SendAsync(msg) end
                    end)
                end)
            end
        elseif currentTab=="Watch" then
            addToggle("ChatSpy","Public chat watcher")
            addToggle("AdminWatch","Username watchlist")
        elseif currentTab=="Cosmetics" then
            addToggle("TungTung","Full-body Tung Tung Sahur (local)")
            addButton("GUN FINISH: "..__aimV9.gunMaterials[gunMaterialIndex].label,function()
                gunMaterialIndex=gunMaterialIndex%#__aimV9.gunMaterials+1
                applyGunAppearance()
                queueSaveSettings() refresh()
            end)
            addButton("RESET ORIGINAL GUN",function()
                gunMaterialIndex=1
                applyGunAppearance()
                queueSaveSettings() refresh()
            end)
        elseif currentTab=="Configs" then
            local configNameEntry=mobileField("Config name (1-24 characters)",__aimV9.MOBILE.configName or profileAPI.selected or "",function(value)
                __aimV9.MOBILE.configName=value
                profileAPI.status="Name entered: "..value
            end)
            for _,name in ipairs(profileAPI.names()) do
                addButton((profileAPI.selected==name and "●  " or "○  ")..name,function()
                    profileAPI.selected=name
                    __aimV9.MOBILE.configName=name
                    refresh()
                end)
            end
            addButton("SAVE NEW CONFIG",function()
                __aimV9.MOBILE.configName=configNameEntry.Text
                profileAPI.save(configNameEntry.Text,false)
                refresh()
            end)
            addButton("OVERWRITE CONFIG",function()
                __aimV9.MOBILE.configName=configNameEntry.Text
                profileAPI.save(configNameEntry.Text,true)
                refresh()
            end)
            addButton("LOAD SELECTED CONFIG",function() profileAPI.load() refresh() end)
            addButton("RENAME SELECTED CONFIG",function()
                __aimV9.MOBILE.configName=configNameEntry.Text
                profileAPI.rename(configNameEntry.Text) refresh()
            end)
            addButton("DELETE SELECTED CONFIG (TAP TWICE)",function()
                local now=os.clock()
                if now-(__aimV9.MOBILE.configDeleteAt or 0)<3 then
                    profileAPI.delete()
                    __aimV9.MOBILE.configDeleteAt=0
                else
                    __aimV9.MOBILE.configDeleteAt=now
                    profileAPI.status="Tap delete again within 3 seconds."
                end
                refresh()
            end)
            local feedback=label(area,profileAPI.status.."\n"..((type(readfile)=="function" and type(writefile)=="function")
                and "File saves supported (if writes are permitted)" or "Session-only saves in this runtime"),
                UDim2.new(1,-10,0,85),UDim2.new(),13,Color3.fromRGB(215,220,235))
            feedback.TextWrapped=true
            feedback.LayoutOrder=#area:GetChildren()
            feedback.ZIndex=43
        elseif currentTab=="Settings" then
            mobileField("Background asset ID",__aimV9.LLORONA_IMAGE_ID,function(value)
                __aimV9.bgIdBox.Text=value
                showBackground()
            end)
            mobileField("Access-granted audio ID",__aimV9.ACCESS_GRANTED_SOUND_ID,function(value)
                __aimV9.soundIdBox.Text=value
                __aimV9.ACCESS_GRANTED_SOUND_ID=tostring(value):match("(%d+)") or ""
                __aimV9.accessGrantedSound.SoundId=assetUrl(__aimV9.ACCESS_GRANTED_SOUND_ID)
                queueSaveSettings()
            end)
            addButton("IMAGE MODE: "..__aimV9.imageDisplayMode,function()
                __aimV9.imageDisplayMode=__aimV9.imageDisplayMode=="DIRECT" and "THUMBNAIL" or "DIRECT"
                __aimV9.modeButton.Text="IMAGE MODE: "..__aimV9.imageDisplayMode
                showBackground()
                refresh()
            end)
            addSlider("Menu transparency",0,70,menuTransparency,function(v) menuTransparency=v applyMenuTransparency() end)
            mobileField("Skybox image asset ID",__aimV9.skyboxId,function(v)
                local id=tostring(v):match("(%d+)")
                if id then
                    __aimV9.skyboxId=id
                    __aimV9.skyboxIdBox.Text=id
                    applySkybox()
                    queueSaveSettings()
                end
            end)
            addButton("RESET GAME SKY",function()
                __aimV9.skyboxId=""
                __aimV9.skyboxIdBox.Text=""
                restoreSkybox()
                queueSaveSettings()
                refresh()
            end)
            addSlider("Local time of day",0,24,math.floor((__aimV9.clockTimeOverride or __aimV9.Lighting.ClockTime)+.5),function(v)
                __aimV9.clockTimeOverride=v
                applyClientTime()
            end)
            addButton("RESET GAME TIME",function()
                __aimV9.clockTimeOverride=nil
                __aimV9.Lighting.ClockTime=__aimV9.originalClockTime
                queueSaveSettings()
                refresh()
            end)
            mobileField("Hit sound asset ID",hitSoundId,function(v)
                hitSoundId=tostring(v):match("(%d+)") or ""
                hitSound.SoundId=hitSoundId~="" and assetUrl(hitSoundId) or "rbxasset://sounds/electronicpingshort.wav"
                queueSaveSettings()
            end)
            addButton("SAVE SETTINGS",function() saveSettingsNow() end)
            addButton("UNLOAD AIM.WTF",function() unload() end)
        end
    end
    local mobileTabButtons={}
    for idx,name in ipairs(__aimV9.tabs) do
        local tb=button(tabsFrame,name,UDim2.fromOffset(102,40),UDim2.fromOffset(5+(idx-1)*110,5))
        mobileTabButtons[name]=tb
        tb.TextSize=13
        tb.ZIndex=43
        tb.Activated:Connect(function()
            currentTab=name
            refresh()
            for _,control in ipairs(tabsFrame:GetChildren()) do
                if control:IsA("TextButton") then
                    control.BackgroundColor3=control.Text==name and Color3.fromRGB(237,237,237) or Color3.fromRGB(25,25,25)
                    control.TextColor3=control.Text==name and Color3.fromRGB(10,10,10) or Color3.fromRGB(237,237,237)
                end
            end
        end)
    end
    __aimV9.gameChanged = function()
        local position=0
        for _,name in ipairs(__aimV9.tabs) do
            local show=name=="Games" or name=="Settings" or name=="Configs"
                or (name=="MM2" and __aimV9.selectedGame=="MM2")
                or (name=="Movement" or name=="Performance" or name=="Ambience" or name=="Keybinds" or name=="Dance" or name=="Admin")
                or (name~="MM2" and name~="Games" and __aimV9.selectedGame=="Universal")
            local b=mobileTabButtons[name]
            b.Visible=show
            if show then b.Position=UDim2.fromOffset(5+position*110,5) position+=1 end
        end
        tabsFrame.CanvasSize=UDim2.fromOffset(position*110,0)
        if currentTab~="Games" and currentTab~="Settings" and currentTab~="Configs" and currentTab~="Performance" then
            currentTab=__aimV9.selectedGame=="MM2" and "MM2" or "ESP"
        end
        refresh()
    end
    __aimV9.gameChanged()

    -- A visible launcher allows users to reopen the hidden hub on a phone.
    local open = button(gui,"AIM.WTF",UDim2.fromOffset(90,42),UDim2.new(1,-101,0,100))
    open.ZIndex=70
    open.BackgroundColor3=Color3.fromRGB(139,20,20)
    open.Visible=false
    __aimV9.MOBILE.openButton=open
    open.Activated:Connect(function()
        win.Visible=not win.Visible
        if __aimV9.MOBILE.refreshVisibility then __aimV9.MOBILE.refreshVisibility() end
    end)

    local quickAim=button(gui,"AIM",UDim2.fromOffset(86,45),UDim2.new(1,-99,0,151))
    quickAim.ZIndex=70
    quickAim.BackgroundColor3=Color3.fromRGB(99,23,23)
    quickAim.Visible=false
    __aimV9.MOBILE.quickAim=quickAim
    quickAim.Activated:Connect(function()
        __aimV9.MOBILE.aiming=not __aimV9.MOBILE.aiming
        quickAim.Text=__aimV9.MOBILE.aiming and "AIM ON" or "AIM"
        quickAim.BackgroundColor3=__aimV9.MOBILE.aiming and Color3.fromRGB(245,245,245) or Color3.fromRGB(99,23,23)
        if not __aimV9.MOBILE.aiming then __aimV9.lockedTarget=nil end
    end)

    for _,info in ipairs({{"UP",-255,"up"},{"DOWN",-195,"down"}}) do
        local b=button(gui,info[1],UDim2.fromOffset(77,52),UDim2.new(1,-89,1,info[2]))
        b.ZIndex=70
        b.BackgroundColor3=Color3.fromRGB(60,33,33)
        b.Visible=false
        __aimV9.MOBILE.controls[info[3]]=b
        b.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
                __aimV9.MOBILE[info[3]]=true
            end
        end)
        b.InputEnded:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
                __aimV9.MOBILE[info[3]]=false
            end
        end)
    end
    __aimV9.MOBILE.refreshVisibility=function()
        if not alive or not armUnlocked then return end
        local playing = not win.Visible
        open.Visible=playing
        quickAim.Visible=playing
        for _,b in pairs(__aimV9.MOBILE.controls) do b.Visible=playing end
    end
    __aimV9.MOBILE.setUnlocked = function()
        win.Visible=true
        window.Visible=false
        __aimV9.MOBILE.refreshVisibility()
    end
    -- Prevent stale UI after unload; all elements are parented under gui.
    return win
end
__aimV9.MOBILE.build()
applyMenuTransparency()

-- Drag the title bar (uses input events rather than deprecated Frame.Draggable).
local dragging, dragStart, startPosition = false, nil, nil
connect(window.InputBegan,function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local p=input.Position
        local withinHeader=p.Y>=window.AbsolutePosition.Y and p.Y<window.AbsolutePosition.Y+75
        local withinClose=p.X>=close.AbsolutePosition.X and p.X<=close.AbsolutePosition.X+close.AbsoluteSize.X
        local cursorButton=__aimV9.mouseToggle
        local withinMouse=p.X>=cursorButton.AbsolutePosition.X and p.X<=cursorButton.AbsolutePosition.X+cursorButton.AbsoluteSize.X
            and p.Y>=cursorButton.AbsolutePosition.Y and p.Y<=cursorButton.AbsolutePosition.Y+cursorButton.AbsoluteSize.Y
        if withinHeader and not withinClose and not withinMouse then
            dragging=true
            dragStart=p
            startPosition=window.Position
        end
    end
end)
connect(UIS.InputChanged,function(input)
    if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        local delta=input.Position-dragStart
        window.Position=UDim2.new(startPosition.X.Scale,startPosition.X.Offset+delta.X,startPosition.Y.Scale,startPosition.Y.Offset+delta.Y)
    end
end)
connect(UIS.InputEnded,function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end
end)

unload = function()
    __aimV9.MOBILE.aiming=false
    __aimV9.MOBILE.up=false
    __aimV9.MOBILE.down=false
    if not alive then return end
    saveSettingsNow()
    __aimV9.dance.stop()
    perf.setLow(false,true)
    ambience.apply(1,true)
    clearPlayerTrail()
    perf.restoreCap()
    if __aimV9.admin.touchFling then __aimV9.admin.setFling(false) end
    pcall(function() RunService:UnbindFromRenderStep("AIM_WTF_MouseUnlock") end)
    if __aimV9.mouseUnlocked then __aimV9.setMouseUnlocked(false) end
    if __aimV9.oldAutoRotate ~= nil then
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.AutoRotate = __aimV9.oldAutoRotate end
    end
    restoreEnemyHeads()
    restoreSkybox()
    if __aimV9.clockTimeOverride ~= nil then
        __aimV9.Lighting.ClockTime = __aimV9.originalClockTime
    end
    __aimV9.MM2.clearAll()
    clearGlossyChams()
    clearTung()
    if __aimV9.ghostVisuals then __aimV9.ghostVisuals:Destroy() __aimV9.ghostVisuals=nil end
    for part, old in pairs(__aimV9.savedBodyTransparency) do
        if part and part.Parent then part.LocalTransparencyModifier = old end
        __aimV9.savedBodyTransparency[part] = nil
    end
    if hitSound then hitSound:Destroy() end
    restoreArmExtender() -- restore arms and catch sensors on unload
    restoreGunAppearance() -- restore original gun materials and transparency
    alive = false
    restoreMovement()
    restoreCollision()
    cleanESP()
    clearAllSkeletons()
    if __aimV9.accessGrantedSound then __aimV9.accessGrantedSound:Destroy() end
    restoreCameraSettings()
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root and state.Fly then root.AssemblyLinearVelocity = Vector3.zero end
    for _,c in ipairs(__aimV9.connections) do c:Disconnect() end
    for _,c in ipairs(__aimV9.gunConnections) do c:Disconnect() end
    for _,t in ipairs(__aimV9.tweens) do t:Cancel() end
    gui:Destroy()
end
connect(close.MouseButton1Click,unload)

connect(UIS.InputBegan,function(input,processed)
    if __aimV9.keybindCapture and armUnlocked then
        local pending=__aimV9.keybindCapture
        local key=input.KeyCode
        __aimV9.keybindCapture=nil
        if key==Enum.KeyCode.Backspace or key==Enum.KeyCode.Delete then
            __aimV9.keybindSet(pending,"NONE")
        elseif key~=Enum.KeyCode.Unknown then
            __aimV9.keybindSet(pending,key.Name)
        end
        __aimV9.keybindRefresh()
        return
    end
    if armUnlocked and not processed and not UIS:GetFocusedTextBox()
        and not window.Visible and not (__aimV9.MOBILE.menu and __aimV9.MOBILE.menu.Visible)
        and input.KeyCode~=Enum.KeyCode.Unknown then
        local keyName=input.KeyCode.Name
        for _,feature in ipairs(__aimV9.keybindNames) do
            if __aimV9.keybinds[feature]==keyName and __aimV9.toggleActions[feature] then
                __aimV9.toggleActions[feature]()
                break
            end
        end
    end
    if input.KeyCode == Enum.KeyCode.F2 and UIS.MouseEnabled and not UIS:GetFocusedTextBox() then
        if not window.Visible and armUnlocked then window.Visible = true end
        __aimV9.setMouseUnlocked(not __aimV9.mouseUnlocked)
        return
    end
    if armUnlocked and input.KeyCode == Enum.KeyCode.RightShift and not UIS:GetFocusedTextBox() then
        window.Visible = not window.Visible
        if not window.Visible and __aimV9.mouseUnlocked then __aimV9.setMouseUnlocked(false) end
    end
    if processed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and not UIS:GetFocusedTextBox() then
        __aimV9.firingHeld = true
        -- Never generate a fake shot from MouseButton1 alone.
        -- Tracers bind to Tool.Activated, observed projectile parts, or game shot FX.

    end
    __aimV9.movingKeys[input.KeyCode] = true
end)
connect(UIS.InputEnded,function(input)
    __aimV9.movingKeys[input.KeyCode] = nil
    if input.UserInputType == Enum.UserInputType.MouseButton1 then __aimV9.firingHeld = false end
end)

connect(RunService.Heartbeat,function(dt)
    if not armUnlocked then return end
    -- BloxStrike-specific per-frame behavior removed.
    if os.clock() - __aimV9.lastGunAppearanceUpdate >= .10 then
        __aimV9.lastGunAppearanceUpdate = os.clock()
        if state.GunSeeThrough or gunMaterialIndex ~= 1 then
            applyGunAppearance()
        end
        if state.Tracers then __aimV9.observeShotSounds() end
    end
    if state.ContinuousFire and __aimV9.firingHeld and os.clock() - __aimV9.lastContinuousShot >= gunFireInterval then
        local equipped = activeTool()
        if equipped and equipped.Enabled then
            __aimV9.lastContinuousShot = os.clock()
            if equipped:GetAttribute("BlackStarGun") == true then
                -- Call the demo gun firing handler directly on each interval:
                -- Tool:Activate() alone may fire only once per mouse hold.
                onGunActivated(equipped)
            else
                -- For third-party Tools we can request activation, but the
                -- experience itself owns its actual fire-rate and ammo rules.
                pcall(function() equipped:Activate() end)
            end
        end
    end
    -- Reapply approximately 10 times per second as animations or game scripts
    -- may recreate their catch sensors. Also supports respawning while enabled.
    if state.HeadExpander and os.clock()-__aimV9.lastHeadTick>=.14 then __aimV9.lastHeadTick=os.clock() updateEnemyHeads() end
    if state.TungTung then updateTung() end
    if state.GhostDecoy then updateLocalGhost() end
    if state.Arms and os.clock() - __aimV9.armLastUpdate >= 0.1 then
        __aimV9.armLastUpdate = os.clock()
        updateArmExtender()
    end
    if os.clock()-__aimV9.lastClockTick>=1 then
        __aimV9.lastClockTick=os.clock()
        local clock=os.date("%I:%M %p")
        __aimV9.timeLabel.Text="◷  LOCAL TIME  •  "..clock
        if __aimV9.mobileTimeLabel and __aimV9.mobileTimeLabel.Parent then
            __aimV9.mobileTimeLabel.Text="@"..player.Name.."  •  "..clock
        end
    end
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return end
    if hum ~= __aimV9.originalHumanoid then
        restoreCollision()
        -- The local arm resizer updates itself after respawn.
        __aimV9.originalHumanoid = hum
        __aimV9.originalMovement = {speed=hum.WalkSpeed,useJumpPower=hum.UseJumpPower,jumpPower=hum.JumpPower,jumpHeight=hum.JumpHeight}
    end
    if state.Spinbot or state.AntiAim or (state.BloxSpinbot and __aimV9.blox.active()) then
        if __aimV9.oldAutoRotate == nil then __aimV9.oldAutoRotate = hum.AutoRotate end
        hum.AutoRotate = false
        if state.Spinbot or (state.BloxSpinbot and __aimV9.blox.active()) then
            local activeSpin = (state.BloxSpinbot and __aimV9.blox.active()) and __aimV9.blox.spin or spinSpeed
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad((activeSpin * math.min(dt, .08)) % 360), 0)
        elseif state.AntiAim and hum.MoveDirection.Magnitude > .15 then
            -- Rapid left/right yaw jitter while moving, limited by your client FPS.
            -- This changes local facing only: it does NOT move the server hitbox.
            local phase = math.floor(os.clock() * __aimV9.antiAimJitterSpeed) % 2 == 0 and 1 or -1
            local forward = hum.MoveDirection
            root.CFrame = CFrame.lookAt(root.Position, root.Position + forward) * CFrame.Angles(0, math.rad(phase * antiAimDegrees), 0)
        end
    elseif __aimV9.oldAutoRotate ~= nil then
        hum.AutoRotate = __aimV9.oldAutoRotate
        __aimV9.oldAutoRotate = nil
    end
    if state.Speed then hum.WalkSpeed = speedValue
    elseif __aimV9.originalMovement then hum.WalkSpeed = __aimV9.originalMovement.speed end
    if state.Jump then hum.UseJumpPower = true hum.JumpPower = jumpValue
    elseif __aimV9.originalMovement then
        hum.UseJumpPower=__aimV9.originalMovement.useJumpPower
        hum.JumpPower=__aimV9.originalMovement.jumpPower
        hum.JumpHeight=__aimV9.originalMovement.jumpHeight
    end
    if state.Noclip then
        for _,p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                if __aimV9.originalCollisions[p]==nil then __aimV9.originalCollisions[p]=p.CanCollide end
                p.CanCollide=false
            end
        end
    end
    if state.Fly then
        local cam=workspace.CurrentCamera
        if cam then
            local v=Vector3.zero
            if __aimV9.movingKeys[Enum.KeyCode.W] then v+=cam.CFrame.LookVector end
            if __aimV9.movingKeys[Enum.KeyCode.S] then v-=cam.CFrame.LookVector end
            if __aimV9.movingKeys[Enum.KeyCode.A] then v-=cam.CFrame.RightVector end
            if __aimV9.movingKeys[Enum.KeyCode.D] then v+=cam.CFrame.RightVector end
            if __aimV9.movingKeys[Enum.KeyCode.Space] then v+=Vector3.yAxis end
            if __aimV9.movingKeys[Enum.KeyCode.LeftControl] then v-=Vector3.yAxis end
            root.AssemblyLinearVelocity=(v.Magnitude>0 and v.Unit or Vector3.zero)*flySpeed
            hum:ChangeState(Enum.HumanoidStateType.Freefall)
        end
    end
    -- Previously lastGlossyTick reset every Heartbeat, so .08s never elapsed.
    -- Throttle material refresh to 10 Hz, not every rendered frame.
    local now = os.clock()
    local materialTick = __aimV9.selectedGame=="Universal"
        and (state.Chams or state.GlossyChams)
        and now - __aimV9.lastGlossyTick >= .10
    if materialTick then __aimV9.lastGlossyTick = now end
    if __aimV9.selectedGame=="Universal" and
        (state.ESP or (state.BloxESP and __aimV9.blox.active()) or state.Chams or state.GlossyChams) then
        for h in pairs(__aimV9.trackedHighlights) do
            if not h.Parent then __aimV9.trackedHighlights[h]=nil end
        end
        for _,other in ipairs(Players:GetPlayers()) do
            local model=other.Character
            local hum=model and model:FindFirstChildOfClass("Humanoid")
            if isEnemy(other) and model and hum and hum.Health>0 then
                local h=model:FindFirstChild("BlackStarHighlight")
                if not h then
                    h=Instance.new("Highlight")
                    h.Name="BlackStarHighlight"
                    h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
                    h.Parent=model
                end
                h.Adornee=model
                h.Enabled=true
                h.FillColor=chamsColor()
                h.OutlineColor=chamsColor()
                -- Keep the material visible in front; the outline still renders through walls.
                h.FillTransparency=state.Chams and .84 or 1
                h.OutlineTransparency=(state.ESP or state.Chams or (state.BloxESP and __aimV9.blox.active())) and 0 or 1
                __aimV9.trackedHighlights[h]=true
                if state.ESP or (state.BloxESP and __aimV9.blox.active()) then refreshNameTag(other, model, model:FindFirstChild("Head")) end
                if materialTick then refreshGlossyParts(other, model) end
            else
                clearGlossyParts(other)
                if model then
                    local oldHighlight = model:FindFirstChild("BlackStarHighlight")
                    if oldHighlight and __aimV9.trackedHighlights[oldHighlight] then
                        oldHighlight:Destroy() __aimV9.trackedHighlights[oldHighlight] = nil
                    end
                end
                local tag = __aimV9.espBadges[other]
                if tag then tag:Destroy() __aimV9.espBadges[other] = nil end
            end
        end
        for other, tag in pairs(__aimV9.espBadges) do
            if other.Parent ~= Players or not other.Character or not tag.Adornee
                or not tag.Adornee:IsDescendantOf(other.Character) then
                if tag then tag:Destroy() end
                __aimV9.espBadges[other] = nil
            end
        end
    else
        clearGlossyChams()
        if next(__aimV9.trackedHighlights) then cleanESP() end
    end
end)

-- Apply camera settings and align silent-aim FOV ring with the target origin.
connect(RunService.RenderStepped,function()
    if not alive then return end
    local ring = __aimV9.silentAimRing
    if ring and ring.Parent then
        ring.Visible = armUnlocked and __aimV9.selectedGame=="Universal"
            and (state.SilentAim or (state.BloxSilentAim and __aimV9.blox.active())) and state.ShowSilentFOV
        if ring.Visible then
            local radius = (state.BloxSilentAim and __aimV9.blox.active()) and __aimV9.blox.fov or __aimV9.silentAimFOV
            local targetPoint = silentAimScreenPoint()
            ring.Size = UDim2.fromOffset(radius*2, radius*2)
            ring.Position = UDim2.fromOffset(targetPoint.X, targetPoint.Y)
        end
    end
    local triggerRing = __aimV9.triggerRing
    if triggerRing and triggerRing.Parent then
        local mm2Ring = __aimV9.selectedGame=="MM2" and state.MM2Aim
            and game.PlaceId==__aimV9.MM2.placeId
        triggerRing.Visible = alive and armUnlocked and (
            (__aimV9.selectedGame=="Universal" and state.Triggerbot and state.ShowTriggerFOV)
            or mm2Ring)
        if triggerRing.Visible then
            local position = silentAimScreenPoint()
            local radius = mm2Ring and __aimV9.MM2.aimFOV or __aimV9.triggerFOV
            triggerRing.Size = UDim2.fromOffset(radius*2,radius*2)
            triggerRing.Position = UDim2.fromOffset(position.X,position.Y)
        end
    end
    if not armUnlocked then return end
    updateCameraSettings()
    if __aimV9.clockTimeOverride ~= nil and
        math.abs(__aimV9.Lighting.ClockTime - __aimV9.clockTimeOverride) > 0.01 then
        applyClientTime()
    end
end)

connect(RunService.RenderStepped,function()
    if armUnlocked and __aimV9.selectedGame=="Universal" then renderSkeletons()
    elseif armUnlocked then clearAllSkeletons() end
end)

-- Camera assist, never changes shot registration or server hit detection.
connect(RunService.RenderStepped,function()
    if not alive or not armUnlocked or not state.AimAssist or __aimV9.selectedGame~="Universal" then
        __aimV9.lockedTarget = nil return
    end
    -- Avoid two camera systems fighting each other when both toggles are active.
    if state.Triggerbot and __aimV9.triggerTarget then return end
    local activeAim = UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    if not activeAim then __aimV9.lockedTarget = nil return end
    local camera = workspace.CurrentCamera
    if not camera then return end
    local closest, dist = nil, math.huge
    local mouse = UIS:GetMouseLocation()
    if state.StickyAim and __aimV9.lockedTarget and __aimV9.lockedTarget.Parent then
        local model = __aimV9.lockedTarget.Parent
        local hum = model:FindFirstChildOfClass("Humanoid")
        local screen, onScreen = camera:WorldToViewportPoint(__aimV9.lockedTarget.Position)
        local targetOwner=Players:GetPlayerFromCharacter(model)
        if targetOwner and isEnemy(targetOwner) and hum and hum.Health > 0 and onScreen and screen.Z > 0 then
            closest = __aimV9.lockedTarget
        else
            __aimV9.lockedTarget = nil
        end
    end
    if not closest then
        for _, p in ipairs(Players:GetPlayers()) do
            local char = p.Character
            local head = char and char:FindFirstChild("Head")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if isEnemy(p) and head and hum and hum.Health > 0 then
                local pos, onScreen = camera:WorldToViewportPoint(head.Position)
                if onScreen and pos.Z > 0 then
                    local d = (Vector2.new(pos.X,pos.Y)-mouse).Magnitude
                    if d < dist and d < aimFOV then closest = head dist = d end
                end
            end
        end
    end
    __aimV9.lockedTarget = state.StickyAim and closest or nil
    if closest then
        local alpha = aimSmoothness == 0 and 1 or (0.015 + (30-aimSmoothness)/30 * 0.24)
        camera.CFrame = camera.CFrame:Lerp(CFrame.lookAt(camera.CFrame.Position,closest.Position),alpha)
    end
end)

-- Advanced triggerbot, target scanning sampled at <=20 Hz to avoid v13-style lag.
-- The headlock camera easing runs per rendered frame for visibly smooth movement.
-- Different guns need different input sources. No client can guarantee server firing.
connect(RunService.RenderStepped,function(dt)
    if not alive or not armUnlocked or not state.Triggerbot or window.Visible
        or __aimV9.selectedGame~="Universal" or UIS:GetFocusedTextBox() then return end
    local head=__aimV9.triggerTarget
    if not head or not head.Parent or not head:IsA("BasePart") then return end
    local camera=workspace.CurrentCamera
    if not camera then return end
    -- Frame-rate independent exponential easing; unlike a fixed alpha, this
    -- behaves similarly at 30, 60 and 120 FPS and never snaps instantly.
    local smooth=math.clamp(__aimV9.triggerSmoothness,1,100)
    local responsiveness=3.5+(100-smooth)*0.25
    local alpha=1-math.exp(-responsiveness*math.min(dt,1/30))
    camera.CFrame=camera.CFrame:Lerp(CFrame.lookAt(camera.CFrame.Position,head.Position),alpha)
end)
local function setTriggerStatus(message)
    if __aimV9.triggerStatus and __aimV9.triggerStatus.Parent then
        __aimV9.triggerStatus.Text = "TRIGGER STATUS: "..message
    end
end

local function clickMouseInput()
    if type(mouse1click)=="function" then
        local ok=pcall(mouse1click)
        if ok then return true, "mouse1click() called" end
    end
    if type(mouse1press)=="function" and type(mouse1release)=="function" then
        local ok=pcall(function() mouse1press() mouse1release() end)
        if ok then return true, "mouse press/release sent" end
    end
    return false, "Mouse-click API unavailable"
end

local function activateEquippedTool()
    local tool=activeTool()
    if not tool or tool.Parent~=player.Character or not tool.Enabled then
        return false, "No enabled equipped Roblox Tool"
    end
    local ok=pcall(function() tool:Activate() end)
    return ok, ok and "Tool:Activate() called" or "Tool:Activate() rejected"
end

local function sendVirtualMouse()
    local ok=pcall(function()
        local vim=game:GetService("VirtualInputManager")
        local at=silentAimScreenPoint()
        vim:SendMouseButtonEvent(at.X,at.Y,0,true,game,0)
        vim:SendMouseButtonEvent(at.X,at.Y,0,false,game,0)
    end)
    return ok, ok and "Virtual mouse input sent" or "Virtual input unavailable"
end

local function requestTriggerShot()
    local mode=__aimV9.triggerModeIndex
    if mode==2 then return clickMouseInput() end
    if mode==3 then return activateEquippedTool() end
    if mode==4 then return sendVirtualMouse() end
    -- AUTO: input-click first for custom mouse-driven guns; fall back to ordinary
    -- Roblox Tool firing. Do not double-fire when a method reports success.
    local sent, msg=clickMouseInput()
    if sent then return sent,msg end
    sent,msg=activateEquippedTool()
    if sent then return sent,msg end
    return sendVirtualMouse()
end

connect(RunService.Heartbeat,function()
    if not alive or not armUnlocked or not state.Triggerbot or window.Visible
        or __aimV9.selectedGame~="Universal" or UIS:GetFocusedTextBox() then
        __aimV9.triggerTarget=nil
        return
    end
    local now=os.clock()
    if now-__aimV9.triggerLastScan<0.05 then return end
    __aimV9.triggerLastScan=now
    local camera=workspace.CurrentCamera
    if not camera then return end
    local center=silentAimScreenPoint()
    local bestHead,bestDistance=nil,__aimV9.triggerFOV
    local previousHead=__aimV9.triggerTarget
    local previousDistance=nil
    local rayParams=RaycastParams.new()
    rayParams.FilterType=Enum.RaycastFilterType.Exclude
    rayParams.FilterDescendantsInstances=player.Character and {player.Character} or {}
    rayParams.IgnoreWater=true
    for _,opponent in ipairs(Players:GetPlayers()) do
        if isEnemy(opponent) then
            local character=opponent.Character
            local head=character and character:FindFirstChild("Head")
            local hum=character and character:FindFirstChildOfClass("Humanoid")
            if head and head:IsA("BasePart") and hum and hum.Health>0 then
                local projected,onScreen=camera:WorldToViewportPoint(head.Position)
                if onScreen and projected.Z>0 then
                    local distance=(Vector2.new(projected.X,projected.Y)-center).Magnitude
                    if distance<bestDistance then
                        local direction=head.Position-camera.CFrame.Position
                        local hit=workspace:Raycast(camera.CFrame.Position,direction,rayParams)
                        if not hit or hit.Instance:IsDescendantOf(character) then
                            bestHead=head
                            bestDistance=distance
                        end
                    end
                end
            end
        end
    end
    if previousHead and previousHead~=bestHead and previousHead.Parent and previousHead:IsA("BasePart") then
        local oldChar=previousHead.Parent
        local oldHum=oldChar:FindFirstChildOfClass("Humanoid")
        local oldPlayer=Players:GetPlayerFromCharacter(oldChar)
        if oldPlayer and isEnemy(oldPlayer) and oldHum and oldHum.Health>0 then
            local oldPos,oldVisible=camera:WorldToViewportPoint(previousHead.Position)
            if oldVisible and oldPos.Z>0 then
                previousDistance=(Vector2.new(oldPos.X,oldPos.Y)-center).Magnitude
                if previousDistance<__aimV9.triggerFOV then
                    local hit=workspace:Raycast(camera.CFrame.Position,previousHead.Position-camera.CFrame.Position,rayParams)
                    if (not hit or hit.Instance:IsDescendantOf(oldChar))
                        and (not bestHead or previousDistance<=bestDistance*1.25) then
                        bestHead=previousHead
                    end
                end
            end
        end
    end
    if not bestHead then
        __aimV9.triggerTarget=nil
        return
    end
    if bestHead~=__aimV9.triggerTarget then
        __aimV9.triggerTarget=bestHead
        __aimV9.triggerEnteredAt=now
    end
    -- RenderStepped handles camera rotation smoothly; don't snap here.
    -- This only changes the client view, not the server's weapon hit detection.
    if (now-__aimV9.triggerEnteredAt)*1000<__aimV9.triggerReactionMs then return end
    -- A smoothed camera needs time to arrive. Avoid firing before the crosshair
    -- is approximately aligned with the selected head (3 degrees tolerance).
    local offset=bestHead.Position-camera.CFrame.Position
    if offset.Magnitude<0.001 then return end
    local towardHead=offset.Unit
    if camera.CFrame.LookVector:Dot(towardHead)<math.cos(math.rad(3)) then return end
    if now-__aimV9.lastTriggerAt<0.16 then return end
    __aimV9.lastTriggerAt=now
    local sent,msg=requestTriggerShot()
    setTriggerStatus((sent and "Input sent: " or "Unavailable: ")..msg..". Confirm actual firing in-game.")
end)

-- ---------------------------------------------------------------------------
-- Usage analytics are strictly opt-in and disclose exactly what is shared.
-- Set this to your Cloudflare Worker /usage endpoint, NOT a Discord webhook URL.
-- A raw Discord webhook embedded in public GitHub Lua can be stolen or spammed.
__aimV9.usageRelayUrl = "https://REPLACE_WITH_YOUR_WORKER.workers.dev/usage"
__aimV9.sendConsentedUsage = function()
    if not alive or not __aimV9.usageRelayUrl:match("^https://")
        or __aimV9.usageRelayUrl:find("REPLACE_WITH_YOUR_WORKER",1,true) then
        warn("[AIM.WTF] Usage relay is not configured; no notification sent.")
        return
    end
    local requestFunction=nil
    if type(request)=="function" then requestFunction=request end
    if not requestFunction and type(http_request)=="function" then requestFunction=http_request end
    if not requestFunction and type(syn)=="table" and type(syn.request)=="function" then requestFunction=syn.request end
    if not requestFunction and type(http)=="table" and type(http.request)=="function" then requestFunction=http.request end
    if not requestFunction then
        warn("[AIM.WTF] This client has no supported HTTP request function.")
        return
    end
    local payload=HttpService:JSONEncode({
        username=player.Name,
        userId=player.UserId,
        displayName=player.DisplayName,
    })
    task.spawn(function()
        local ok,err=pcall(function()
            local response=requestFunction({
                Url=__aimV9.usageRelayUrl,
                Method="POST",
                Headers={["Content-Type"]="application/json"},
                Body=payload,
            })
            if type(response)=="table" and response.StatusCode and response.StatusCode>=400 then
                warn("[AIM.WTF] Opt-in usage report failed with HTTP "..tostring(response.StatusCode))
            end
        end)
        if not ok then warn("[AIM.WTF] Opt-in usage report failed: "..tostring(err)) end
    end)
end

-- AIM.WTF ACCESS GATE: adapted from the user's Pasted text (10) key-system GUI.
-- Universal/MM2 selection follows unlock. Includes 25 example keys and one shared free key.
-- UI-only client check: to protect purchased access, use server-side validation.
-- ---------------------------------------------------------------------------
-- Roblox's standard notification, sent once after the hub actually unlocks.
__aimV9.notificationShown=false
__aimV9.notifyLoaded=function()
    if __aimV9.notificationShown then return end
    __aimV9.notificationShown=true
    task.spawn(function()
        for attempt=1,5 do
            if not alive then return end
            local ok=pcall(function()
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title="AIM.WTF",
                    Text="AIM.WTF loaded, have fun!",
                    Duration=5,
                })
            end)
            if ok then return end
            task.wait(0.35)
        end
        warn("[AIM.WTF] Core notification unavailable in this environment.")
    end)
end

local function showAIMKeySystem()
    local hubMain = main -- Keep the main hub distinct from the auth window named main.
    local usageConsent=false -- Defaults OFF every time; not stored in configs.
    local function onAccessGranted()
        if not alive then return end
        if usageConsent then __aimV9.sendConsentedUsage() end
        armUnlocked = true
        if perf.initialLowTexture then perf.setLow(true) end
        ambience.apply(ambience.index,true)
        if state.PlayerTrail then refreshPlayerTrail() end
        if perf.fpsTarget>0 then perf.setCap(perf.fpsTarget) end
        applySkybox()
        applyClientTime()
        hubMain.Visible = true
        selectTab("Games")
        window.Visible = true
        if __aimV9.MOBILE.setUnlocked then __aimV9.MOBILE.setUnlocked() end
        pcall(function()
            if __aimV9.accessGrantedSound.SoundId ~= "" then
                __aimV9.accessGrantedSound:Stop()
                __aimV9.accessGrantedSound.TimePosition = 0
                __aimV9.accessGrantedSound:Play()
            end
        end)
        __aimV9.notifyLoaded()
        print("AIM.WTF | Redesigned hub unlocked")
    end
    -- CLEAN UP
    local old = playerGui:FindFirstChild("AIM_WTF_KEY")
    if old then old:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "AIM_WTF_KEY"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 999
    gui.Parent = playerGui
    local mobileAuthCard=nil
    local function scatterKeyPanel(panel, done)
        local pos=panel.AbsolutePosition
        local size=panel.AbsoluteSize
        if size.X==0 or size.Y==0 then panel.Visible=false done() return end
        local dots={}
        for index=1,110 do
            local x=(index*109+index*index*17)%997/997
            local y=(index*193+index*index*31)%991/991
            local px=pos.X+x*size.X
            local py=pos.Y+y*size.Y
            local dot=Instance.new("Frame")
            dot.Name="WhiteParticle"
            dot.Size=UDim2.fromOffset(2+index%5,2+index%5)
            dot.Position=UDim2.fromOffset(px,py)
            dot.BackgroundColor3=Color3.fromRGB(230+(index%3)*8,230+(index%3)*8,230+(index%3)*8)
            dot.BorderSizePixel=0
            dot.ZIndex=1001
            dot.Parent=gui
            local c=Instance.new("UICorner")
            c.CornerRadius=UDim.new(1,0)
            c.Parent=dot
            dots[#dots+1]=dot
        end
        panel.Visible=false
        for index,dot in ipairs(dots) do
            local a=index*2.399963
            local len=27+(index%12)*7
            TweenService:Create(dot,TweenInfo.new(.55,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                Position=dot.Position+UDim2.fromOffset(math.cos(a)*len,math.sin(a)*len),
                BackgroundTransparency=1,
                Size=UDim2.fromOffset(1,1)
            }):Play()
        end
        task.delay(.57,function()
            for _,dot in ipairs(dots) do dot:Destroy() end
            done()
        end)
    end
    local function gatherHubParticles()
        if not alive then return end
        local wpos=window.AbsolutePosition
        local wsize=window.AbsoluteSize
        local veil=Instance.new("Frame")
        veil.BackgroundColor3=Color3.new(0,0,0)
        veil.BackgroundTransparency=.06
        veil.BorderSizePixel=0
        veil.Size=UDim2.fromScale(1,1)
        veil.ZIndex=997
        veil.Parent=gui
        local dots={}
        for index=1,100 do
            local x=(index*41+index*index*11)%997/997
            local y=(index*173+index*index*19)%991/991
            local tx=wpos.X+x*wsize.X
            local ty=wpos.Y+y*wsize.Y
            local a=index*2.399963
            local radius=110+(index%13)*25
            local dot=Instance.new("Frame")
            dot.Name="GatherParticle"
            dot.BackgroundColor3=Color3.fromRGB(243,243,243)
            dot.BorderSizePixel=0
            dot.Size=UDim2.fromOffset(2+index%4,2+index%4)
            dot.Position=UDim2.fromOffset(tx+math.cos(a)*radius,ty+math.sin(a)*radius)
            dot.ZIndex=998
            dot.Parent=gui
            local cc=Instance.new("UICorner") cc.CornerRadius=UDim.new(1,0) cc.Parent=dot
            dots[#dots+1]=dot
            TweenService:Create(dot,TweenInfo.new(.52,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
                Position=UDim2.fromOffset(tx,ty),BackgroundTransparency=1,
                Size=UDim2.fromOffset(1,1)
            }):Play()
        end
        TweenService:Create(veil,TweenInfo.new(.58),{BackgroundTransparency=1}):Play()
        task.delay(.61,function()
            for _,dot in ipairs(dots) do dot:Destroy() end
            veil:Destroy()
        end)
    end

    local function create(class, properties, parent)
        local obj = Instance.new(class)
        for property, value in pairs(properties) do
            obj[property] = value
        end
        obj.Parent = parent
        return obj
    end

    local function corner(parent, radius)
        create("UICorner", {
            CornerRadius = UDim.new(0, radius)
        }, parent)
    end

    local function stroke(parent, color, transparency)
        create("UIStroke", {
            Color = color,
            Transparency = transparency or 0,
            Thickness = 1
        }, parent)
    end

    local RED = Color3.fromRGB(244, 244, 244)
    local WHITE = Color3.fromRGB(235, 235, 235)
    local MUTED = Color3.fromRGB(115, 115, 115)
    local DARK = Color3.fromRGB(13, 13, 13)

    local overlay = create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0
    }, gui)

    local main = create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(730, 450),
        BackgroundColor3 = DARK,
        BorderSizePixel = 0,
        ClipsDescendants = true
    }, overlay)

    corner(main, 5)
    stroke(main, Color3.fromRGB(83, 83, 83))
    addConstellationStars(main,1)

    local scale = create("UIScale", {
        Scale = 1
    }, main)

    local camera = workspace.CurrentCamera
    local function updateScale()
        if camera then
            local v = camera.ViewportSize
            scale.Scale = math.min(1, v.X / 780, v.Y / 500)
        end
    end

    updateScale()
    if camera then
        camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
    end

    -- HEADER
    local header = create("Frame", {
        Size = UDim2.new(1, 0, 0, 68),
        BackgroundColor3 = Color3.fromRGB(17, 17, 17),
        BorderSizePixel = 0
    }, main)

    local logo = create("TextLabel", {
        Position = UDim2.fromOffset(25, 10),
        Size = UDim2.fromOffset(260, 50),
        BackgroundTransparency = 1,
        Text = "AIM.WTF",
        TextColor3 = RED,
        TextSize = 34,
        Font = Enum.Font.GothamBlack,
        TextXAlignment = Enum.TextXAlignment.Left
    }, header)

    create("TextLabel", {
        Position = UDim2.new(1, -235, 0, 22),
        Size = UDim2.fromOffset(175, 22),
        BackgroundTransparency = 1,
        Text = "AUTHENTICATION",
        TextColor3 = MUTED,
        TextSize = 12,
        Font = Enum.Font.GothamBold
    }, header)

    local close = create("TextButton", {
        Position = UDim2.new(1, -40, 0, 18),
        Size = UDim2.fromOffset(25, 25),
        BackgroundTransparency = 1,
        Text = "X",
        TextColor3 = RED,
        TextSize = 18,
        Font = Enum.Font.GothamBold
    }, header)

    create("Frame", {
        Position = UDim2.fromOffset(0, 67),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = Color3.fromRGB(75, 75, 75),
        BorderSizePixel = 0
    }, header)

    -- SIDEBAR
    local sidebar = create("Frame", {
        Position = UDim2.fromOffset(0, 68),
        Size = UDim2.fromOffset(215, 358),
        BackgroundColor3 = Color3.fromRGB(10, 10, 10),
        BorderSizePixel = 0
    }, main)

    create("TextLabel", {
        Position = UDim2.fromOffset(20, 17),
        Size = UDim2.fromOffset(180, 25),
        BackgroundTransparency = 1,
        Text = "ACCOUNT",
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = MUTED,
        TextSize = 12,
        Font = Enum.Font.GothamBold
    }, sidebar)

    local selected = create("Frame", {
        Position = UDim2.fromOffset(13, 53),
        Size = UDim2.fromOffset(190, 43),
        BackgroundColor3 = Color3.fromRGB(23, 23, 23),
        BorderSizePixel = 0
    }, sidebar)
    corner(selected, 4)

    create("Frame", {
        Size = UDim2.fromOffset(3, 43),
        BackgroundColor3 = RED,
        BorderSizePixel = 0
    }, selected)

    create("TextLabel", {
        Position = UDim2.fromOffset(18, 0),
        Size = UDim2.fromOffset(168, 43),
        BackgroundTransparency = 1,
        Text = "◆   Key Authentication",
        TextColor3 = WHITE,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left
    }, selected)

    create("TextLabel", {
        Position = UDim2.fromOffset(21, 114),
        Size = UDim2.fromOffset(180, 25),
        BackgroundTransparency = 1,
        Text = "SYSTEM STATUS",
        TextColor3 = MUTED,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left
    }, sidebar)

    local sideStatus = create("TextLabel", {
        Position = UDim2.fromOffset(21, 146),
        Size = UDim2.fromOffset(180, 25),
        BackgroundTransparency = 1,
        Text = "●  LOCKED",
        TextColor3 = RED,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    }, sidebar)

    -- RIGHT PANEL
    local content = create("Frame", {
        Position = UDim2.fromOffset(215, 68),
        Size = UDim2.fromOffset(515, 358),
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        BorderSizePixel = 0
    }, main)

    local panel = create("Frame", {
        Position = UDim2.fromOffset(23, 20),
        Size = UDim2.fromOffset(469, 320),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BorderSizePixel = 0
    }, content)
    corner(panel, 5)
    stroke(panel, Color3.fromRGB(68, 68, 68))

    create("TextLabel", {
        Position = UDim2.fromOffset(20, 12),
        Size = UDim2.fromOffset(420, 30),
        BackgroundTransparency = 1,
        Text = "◆  AIM.WTF | UNIVERSAL KEY VALIDATION",
        TextColor3 = WHITE,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left
    }, panel)

    create("Frame", {
        Position = UDim2.fromOffset(15, 51),
        Size = UDim2.fromOffset(439, 1),
        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
        BorderSizePixel = 0
    }, panel)

    create("TextLabel", {
        Position = UDim2.fromOffset(20, 64),
        Size = UDim2.fromOffset(400, 22),
        BackgroundTransparency = 1,
        Text = "ENTER YOUR ACCESS KEY",
        TextColor3 = MUTED,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left
    }, panel)

    local keyBox = create("TextBox", {
        Position = UDim2.fromOffset(20, 94),
        Size = UDim2.fromOffset(429, 43),
        BackgroundColor3 = Color3.fromRGB(24, 24, 24),
        BorderSizePixel = 0,
        Text = "",
        PlaceholderText = "AIM-XXXX-XXXX-XXXX",
        PlaceholderColor3 = Color3.fromRGB(90, 90, 90),
        TextColor3 = WHITE,
        TextSize = 14,
        Font = Enum.Font.GothamMedium,
        ClearTextOnFocus = false
    }, panel)
    corner(keyBox, 4)
    stroke(keyBox, Color3.fromRGB(55, 55, 55))

    create("UIPadding", {
        PaddingLeft = UDim.new(0, 13),
        PaddingRight = UDim.new(0, 13)
    }, keyBox)

    -- One free key shared by all users, displayed and usable without any website.
    -- The button fills the text box; the next button copies it where supported.
    local mobileEntry = nil -- Set when the mobile key panel is constructed.
    local freeKeyStatus = nil
    local function showFreeKeyStatus(message, color)
        if freeKeyStatus and freeKeyStatus.Parent then
            freeKeyStatus.Text = message
            freeKeyStatus.TextColor3 = color or WHITE
        end
    end
    local function fillFreeKey()
        keyBox.Text = __aimV9.FREE_KEY
        if mobileEntry and mobileEntry.Parent then mobileEntry.Text = __aimV9.FREE_KEY end
        showFreeKeyStatus("Free key is ready. Press VERIFY KEY.")
    end
    local function copyFreeKey()
        fillFreeKey()
        local clipboardFn = nil
        if type(setclipboard) == "function" then
            clipboardFn = setclipboard
        elseif type(toclipboard) == "function" then
            clipboardFn = toclipboard
        end
        if clipboardFn then
            local copied = pcall(clipboardFn, __aimV9.FREE_KEY)
            if copied then
                showFreeKeyStatus("Free key copied! Press VERIFY KEY.")
                return
            end
        end
        -- Standard Roblox LocalScripts do not expose a clipboard-write API.
        -- Keep the key visible in an editable TextBox for manual copy.
        showFreeKeyStatus("Key filled above. Select the text to copy it.")
        pcall(function()
            local field = mobileEntry and mobileEntry.Parent and mobileEntry or keyBox
            field:CaptureFocus()
            field.CursorPosition = #field.Text + 1
            field.SelectionStart = 1
        end)
    end
    local freeKeyButton = create("TextButton", {
        Position = UDim2.fromOffset(20, 145),
        Size = UDim2.fromOffset(308, 37),
        BackgroundColor3 = Color3.fromRGB(32, 39, 58),
        BorderSizePixel = 0,
        Text = "FREE KEY: " .. __aimV9.FREE_KEY,
        TextColor3 = WHITE,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
    }, panel)
    corner(freeKeyButton, 5)
    stroke(freeKeyButton, Color3.fromRGB(89, 111, 155), .35)
    freeKeyButton.Activated:Connect(fillFreeKey)
    local copyKeyButton = create("TextButton", {
        Position = UDim2.fromOffset(336, 145),
        Size = UDim2.fromOffset(113, 37),
        BackgroundColor3 = Color3.fromRGB(57, 75, 108),
        BorderSizePixel = 0,
        Text = "COPY KEY",
        TextColor3 = WHITE,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
    }, panel)
    corner(copyKeyButton, 5)
    copyKeyButton.Activated:Connect(copyFreeKey)

    local verify = create("TextButton", {
        Position = UDim2.fromOffset(20, 195),
        Size = UDim2.fromOffset(429, 43),
        BackgroundColor3 = RED,
        Text = "VERIFY KEY",
        TextColor3 = Color3.fromRGB(7, 7, 7),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        AutoButtonColor = false
    }, panel)
    corner(verify, 4)

    local status = create("TextLabel", {
        Position = UDim2.fromOffset(20, 282),
        Size = UDim2.fromOffset(429, 26),
        BackgroundTransparency = 1,
        Text = "Enter an AIM-XXXX-XXXX-XXXX key",
        TextColor3 = MUTED,
        TextSize = 12,
        Font = Enum.Font.GothamMedium
    }, panel)

    freeKeyStatus = status

    -- Explicit consent before notifying the script owner. Default is OFF.
    local desktopConsent = create("TextButton", {
        Position = UDim2.fromOffset(20, 245),
        Size = UDim2.fromOffset(429, 30),
        BackgroundTransparency = 1,
        Text = "[ ] SHARE ROBLOX NAME + USER ID WITH OWNER: OFF",
        TextColor3 = MUTED,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamMedium,
    },panel)
    local mobileConsent=nil
    local function refreshConsent()
        local value=usageConsent and "ON" or "OFF"
        local mark=usageConsent and "[X]" or "[ ]"
        desktopConsent.Text=mark.." SHARE ROBLOX NAME + USER ID WITH OWNER: "..value
        desktopConsent.TextColor3=usageConsent and WHITE or MUTED
        if mobileConsent then
            mobileConsent.Text=mark.." SEND ROBLOX NAME + ID TO OWNER: "..value
            mobileConsent.TextColor3=usageConsent and WHITE or MUTED
        end
    end
    desktopConsent.Activated:Connect(function()
        usageConsent=not usageConsent
        refreshConsent()
    end)

    -- FOOTER
    create("TextLabel", {
        Position = UDim2.fromOffset(0, 427),
        Size = UDim2.new(1, 0, 0, 23),
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        BorderSizePixel = 0,
        Text = "AIM.WTF  |  UNIVERSAL + MM2  •  FREE ACCESS AVAILABLE",
        TextColor3 = Color3.fromRGB(82, 82, 82),
        TextSize = 11,
        Font = Enum.Font.GothamBold
    }, main)

    -- KEY VALIDATION
    local checking = false

    local function validate()
        if checking then return end

        local entered = keyBox.Text:match("^%s*(.-)%s*$")

        if entered == "" then
            status.Text = "Please enter an access key."
            status.TextColor3 = RED
            return
        end

        if not __aimV9.VALID_KEYS[entered:upper()] then
            status.Text = "✕  INVALID KEY | ACCESS DENIED"
            status.TextColor3 = RED
            sideStatus.Text = "●  ACCESS DENIED"

            TweenService:Create(
                panel,
                TweenInfo.new(0.15),
                {BackgroundColor3 = Color3.fromRGB(36, 36, 36)}
            ):Play()

            task.delay(0.3, function()
                if panel.Parent then
                    TweenService:Create(
                        panel,
                        TweenInfo.new(0.3),
                        {BackgroundColor3 = Color3.fromRGB(12, 12, 12)}
                    ):Play()
                end
            end)

            return
        end

        checking = true
        -- Do not remember, prefill or store this key (including in saved settings).
        keyBox.Text = ""
        saveSettingsNow()
        status.Text = "✓  ACCESS GRANTED"
        status.TextColor3 = Color3.fromRGB(50, 255, 130)

        sideStatus.Text = "●  AUTHORIZED"
        sideStatus.TextColor3 = Color3.fromRGB(50, 255, 130)

        verify.Text = "ACCESS GRANTED"
        verify.BackgroundColor3 = Color3.fromRGB(234, 234, 234)

        task.delay(.2,function()
            local panel = mobileAuthCard or main
            scatterKeyPanel(panel,function()
                onAccessGranted()
                -- The particles then gather to reveal the black-and-white hub.
                gatherHubParticles()
                task.delay(.66,function() if gui.Parent then gui:Destroy() end end)
            end)
        end)
    end

    verify.MouseButton1Click:Connect(validate)

    keyBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            validate()
        end
    end)

    verify.MouseEnter:Connect(function()
        if not checking then
            TweenService:Create(verify, TweenInfo.new(0.15), {
                BackgroundColor3 = Color3.fromRGB(224, 224, 224)
            }):Play()
        end
    end)

    verify.MouseLeave:Connect(function()
        if not checking then
            TweenService:Create(verify, TweenInfo.new(0.15), {
                BackgroundColor3 = RED
            }):Play()
        end
    end)

    close.MouseButton1Click:Connect(function()
        gui:Destroy()
        unload()
    end)

    -- DRAGGABLE WINDOW
    local dragging = false
    local dragStart
    local startPosition

    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPosition = main.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- OPEN ANIMATION

    if UIS.TouchEnabled then
        main.Visible=false
        local touchCard=create("Frame",{
            Name="TouchAuth",AnchorPoint=Vector2.new(.5,.5),
            Size=UDim2.new(1,-24,0,386),Position=UDim2.fromScale(.5,.5),
            BackgroundColor3=Color3.fromRGB(14,14,15),BorderSizePixel=0,
        },overlay)
        corner(touchCard,7)
        stroke(touchCard,Color3.fromRGB(115,115,115))
        mobileAuthCard=touchCard
        addConstellationStars(touchCard,1)
        local sizeLimit=create("UISizeConstraint",{
            MaxSize=Vector2.new(460,400)
        },touchCard)
        local title=create("TextLabel",{
            Text="AIM.WTF",TextSize=30,Font=Enum.Font.GothamBlack,
            TextColor3=RED,BackgroundTransparency=1,
            Position=UDim2.fromOffset(15,13),Size=UDim2.new(1,-30,0,54),
        },touchCard)
        local subtitle=create("TextLabel",{
            Text="ENTER YOUR AIM ACCESS KEY",TextSize=13,
            Font=Enum.Font.GothamBold,TextColor3=MUTED,
            BackgroundTransparency=1,Position=UDim2.fromOffset(16,82),
            Size=UDim2.new(1,-32,0,26),
        },touchCard)
        mobileEntry=create("TextBox",{
            Text=keyBox.Text,PlaceholderText="AIM-XXXX-XXXX-XXXX",
            BackgroundColor3=Color3.fromRGB(27,27,30),TextColor3=WHITE,
            Font=Enum.Font.GothamMedium,TextSize=17,
            ClearTextOnFocus=false,Position=UDim2.fromOffset(15,125),
            Size=UDim2.new(1,-30,0,53),
        },touchCard)
        corner(mobileEntry,5)
        local mobileFree=create("TextButton",{
            Text="FREE KEY: "..__aimV9.FREE_KEY,Font=Enum.Font.GothamBold,
            TextSize=11,TextColor3=WHITE,BackgroundColor3=Color3.fromRGB(32,39,58),
            Position=UDim2.fromOffset(15,185),Size=UDim2.new(.71,-21,0,37),
        },touchCard)
        corner(mobileFree,5)
        mobileFree.Activated:Connect(fillFreeKey)
        local mobileCopy=create("TextButton",{
            Text="COPY",Font=Enum.Font.GothamBold,TextSize=12,
            TextColor3=WHITE,BackgroundColor3=Color3.fromRGB(57,75,108),
            Position=UDim2.new(.71,0,0,185),Size=UDim2.new(.29,-15,0,37),
        },touchCard)
        corner(mobileCopy,5)
        mobileCopy.Activated:Connect(copyFreeKey)
        local mobileVerify=create("TextButton",{
            Text="VERIFY KEY",Font=Enum.Font.GothamBold,TextSize=17,
            TextColor3=Color3.fromRGB(9,9,9),BackgroundColor3=RED,
            Position=UDim2.fromOffset(15,232),
            Size=UDim2.new(1,-30,0,48),
        },touchCard)
        corner(mobileVerify,5)
        mobileConsent=create("TextButton",{
            Text="[ ] SEND ROBLOX NAME + ID TO OWNER: OFF",
            Font=Enum.Font.GothamMedium,TextSize=12,TextColor3=MUTED,
            TextXAlignment=Enum.TextXAlignment.Center,BackgroundTransparency=1,
            Position=UDim2.fromOffset(15,287),Size=UDim2.new(1,-30,0,31),
        },touchCard)
        mobileConsent.Activated:Connect(function()
            usageConsent=not usageConsent
            refreshConsent()
        end)
        refreshConsent()
        local mobileStatus=create("TextLabel",{
            Text="Free key or 25 demo keys supported",Font=Enum.Font.Gotham,
            TextSize=12,TextColor3=MUTED,BackgroundTransparency=1,
            Position=UDim2.fromOffset(15,324),Size=UDim2.new(1,-30,0,34),
            TextWrapped=true,
        },touchCard)
        freeKeyStatus=mobileStatus
        local function doMobileValidate()
            keyBox.Text=mobileEntry.Text
            if __aimV9.VALID_KEYS[keyBox.Text:match("^%s*(.-)%s*$"):upper()] then
                mobileStatus.Text="ACCESS GRANTED"
                mobileStatus.TextColor3=Color3.fromRGB(240,240,240)
            else
                mobileStatus.Text="INVALID KEY • TRY AGAIN"
                mobileStatus.TextColor3=RED
            end
            validate()
        end
        mobileVerify.Activated:Connect(doMobileValidate)
        mobileEntry.FocusLost:Connect(function(enterPressed)
            if enterPressed then doMobileValidate() end
        end)
    end
    main.Size = UDim2.fromOffset(0, 0)

    TweenService:Create(
        main,
        TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Size = UDim2.fromOffset(730, 450)}
    ):Play()
end

-- Display the user's red/black authentication GUI before showing the universal hub.
window.Visible = false
showAIMKeySystem()

end, function(err)
    return tostring(err) .. "\n" .. (debug and debug.traceback and debug.traceback() or "")
end)
if not ok then
    warn("[AIM.WTF] Startup error: " .. tostring(failure))
    showDiag("AIM.WTF ERROR: " .. tostring(failure), true)
else
    showDiag("AIM.WTF | Ready • enter your key", false)
    task.delay(10, function() if diagGui and diagGui.Parent then diagGui:Destroy() end end)
end
