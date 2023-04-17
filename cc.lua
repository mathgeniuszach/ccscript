local scrn, chatBox, playerDetector
local battery
local redput, Red1, Red2

local getEnergyFilledPercentage

if not pocket then
    scrn = peripheral.find("monitor")
    chatBox = peripheral.find("chatBox")
    playerDetector = peripheral.find("playerDetector")

    battery = peripheral.find("inductionPort")

    redput = {peripheral.find("redstoneIntegrator")}
    Red1 = redput[#redput]
    Red2 = redput[#redput-1]

    getEnergyFilledPercentage = battery.getEnergyFilledPercentage
end

local RS_MAIN = {Red1, "right"}
local RS_MACHINES = {Red1, "top"}
local RS_DRAWERS = {Red1, "left"}

local BATTERY = {Red2, "top"}
local REACTOR_A = {Red2, "back"}
local REACTOR_B = {Red2, "left"}

local size = pocket and {26,20} or {50,33}

local function setPower(source, state)
    source[1].setOutput(source[2], state)
end

local function drawBattery()
    while true do
        local w = math.ceil((size[1]-2)*getEnergyFilledPercentage())
        local r = size[1]-2-w
        if w then paintutils.drawFilledBox(2,2,1+w,3,colors.lime) end
        if r then paintutils.drawFilledBox(2+w,2,size[1]-1,3,colors.lightGray) end
        os.sleep(1)
    end
end

parallel.waitForAll(drawBattery)