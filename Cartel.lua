-- =============================================
-- Cartel Main Script
-- GitHub Auto-Update Ready
-- Version: 1.0.1          ← Update this when you release changes!
-- =============================================

local SCRIPT_NAME    = "Cartel"
local SCRIPT_VERSION = "1.0.1"

local function ShowToast(title, text, duration)
    GUI.AddToast(title, text, duration or 5000, eToastPos.TOP_RIGHT)
end

local function InitializeGUI()
    local rootTab = ListGUI.GetRootTab()
    local mainTab = rootTab:AddSubTab(SCRIPT_NAME, "Main Features")

    mainTab:AddSeperator("Script Information")
    
    local verFeature = FeatureMgr.AddFeature(joaat("cartel_version"), "Script Version", eFeatureType.InputText, "")
    FeatureMgr.SetFeatureString(verFeature, SCRIPT_VERSION)

    mainTab:AddSeperator("Features")
    
    -- Example features (uncomment and customize as needed)
    local godmode   = FeatureMgr.AddFeature(joaat("godmode"),   "Godmode",         eFeatureType.Toggle, "Local player is invincible")
    local infAmmo   = FeatureMgr.AddFeature(joaat("inf_ammo"),  "Infinite Ammo",   eFeatureType.Toggle, "")
    local infArmor  = FeatureMgr.AddFeature(joaat("inf_armor"), "Infinite Armor",  eFeatureType.Toggle, "")
    
    -- Add your own features below this line
    -- local vehicleSpawner = FeatureMgr.AddFeature(joaat("veh_spawner"), "Vehicle Spawner", eFeatureType.Button, "")
    
end

local function MainLoop()
    while not ShouldUnload() do
        -- Put any continuous logic here (e.g. loops for ESP, protections, etc.)
        
        Script.Yield(500)
    end
end

local function OnLoad()
    Logger.LogInfo(SCRIPT_NAME .. " v" .. SCRIPT_VERSION .. " loaded successfully.")
    ShowToast(SCRIPT_NAME, "Loaded - Version " .. SCRIPT_VERSION, 5000)
    
    InitializeGUI()
    
    Script.QueueJob(function()
        MainLoop()
    end)
end

OnLoad()
