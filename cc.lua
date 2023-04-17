local scrn = peripheral.find("monitor")
local chatBox = peripheral.find("chatBox")
local playerDetector = peripheral.find("playerDetector")

local battery = peripheral.find("inductionPort")

local redput = {peripheral.find("redstoneIntegrator")}
local Red1 = redput[#redput]
local Red2 = redput[#redput-1]

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
        paintutils.drawBox(1,1,size[1],5,colors.gray)
        paintutils.drawFilledBox(2,2,size[1]-1,3,colors.lightGray)
        paintutils.drawFilledBox(2,2,2+(size[1]-3)*battery.getFilledPercentage(),3,colors.lime)
        os.sleep(1)
    end
end

parallel.waitForAll(drawBattery)
