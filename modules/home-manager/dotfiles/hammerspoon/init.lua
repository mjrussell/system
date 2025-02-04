-- install hammerspoon cli
local brewPrefixOutput, _, _, _ = hs.execute("brew --prefix", true)
local brewPrefix = string.gsub(brewPrefixOutput, "%s+", '')
require("hs.ipc")
local ipc = hs.ipc.cliInstall(brewPrefix)
print(string.format("ipc: %s", ipc))

-- import keybindings for yabai
require("yabai")

-- Make all our animations really fast
hs.window.animationDuration = 0

-- Load SpoonInstall, so we can easily load our other Spoons
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall

-- Draw pretty rounded corners on all screens
Install:andUse("RoundedCorners", {
    start = true,
    config = {
        radius = 12
    }
})
Install:andUse("ReloadConfiguration", {
    start = true,
    hotKeys = {
        reloadConfiguration = {{"cmd", "ctrl", "shift"}, "r"}
    }
})
