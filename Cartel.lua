-- =============================================
-- Cherax Main Script - GitHub Update Ready
-- Version: 1.0.0          ← Change this when you update!
-- =============================================

local SCRIPT_NAME    = "Cartel"
local SCRIPT_VERSION = "0.0.1"   -- ← Always update this when releasing a new version

local function ShowToast(title, text, duration)
    GUI.AddToast(title, text, duration or 6000, eToastPos.TOP_RIGHT)
end

local function InitializeGUI()
    local rootTab = ListGUI.GetRootTab()
    local mainTab = rootTab:AddSubTab(SCRIPT_NAME, "Main Features")

    mainTab:AddSeperator("Script Information")
    
    local verFeature = FeatureMgr.AddFeature(joaat("main_version"), "Script Version", eFeatureType.InputText, "")
    FeatureMgr.SetFeatureString(verFeature, SCRIPT_VERSION)

    -- ===================== YOUR FEATURES GO HERE =====================
    
    mainTab:AddSeperator("Your Features")
    
    local godmode = FeatureMgr.AddFeature(joaat("godmode"), "Godmode", eFeatureType.Toggle, "Makes local player invincible")
    local infAmmo = FeatureMgr.AddFeature(joaat("inf_ammo"), "Infinite Ammo", eFeatureType.Toggle, "")
    
    -- Add more features below as needed...
    
    -- =================================================================
end

local function MainLoop()
    while not ShouldUnload() do
        -- Put your looped logic here if needed
        
        Script.Yield(500)
    end
end

local function OnLoad()
    Logger.LogInfo(SCRIPT_NAME .. " v" .. SCRIPT_VERSION .. " loaded.")
    ShowToast(SCRIPT_NAME, "Successfully loaded - Version " .. SCRIPT_VERSION, 5000)
    
    InitializeGUI()
    
    Script.QueueJob(function()
        MainLoop()
    end)
end

OnLoad()
