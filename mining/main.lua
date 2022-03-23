local branch = {
    amount = 5,
    lenght = 32,
    space = 5
}
local slot = {
    fuel = 1,
    troch = 2,
    fill = 3
}

local other = {
    troch = true
}

local blocks = {
    ["minecraft:grass_block"] = true,
    ["minecraft:dirt"] = true
}


local savedMoves = {}

function Main()
    forward(1)
end

function torch()
    if other.torch then
        turtle.select(slot.torch)
        turtle.place()
    end
end

function findblocks()
    local found = false
    if blockfront() then
        found = true
        table.insert(savedMoves, "strait")
        orePatch()
        findblocks()
    end
    turtle.turnLeft()
    if blockfront() then
        found = true
        table.insert(savedMoves, "left")
        table.insert(savedMoves, "strait")
        orePatch()
        findblocks()
    end
    turtle.turnLeft()
    turtle.turnLeft()
    if blockfront() then
        found = true
        table.insert(savedMoves, "right")
        table.insert(savedMoves, "strait")
        orePatch()
        findblocks()
    end
    turtle.turnLeft()
    if found then
        returnTOstrip()
    end
end

function returnTOstrip()
    turtle.turnLeft()
    turtle.turnLeft()
    for i = #savedMoves, 1, -1 do
        local value = savedMoves[i]
        if (value == "left") then
            turtle.turnRight()
        elseif (value == "right") then
            turtle.turnLeft()
        elseif (value == "strait") then
            turtle.forward()
        end
    end
    turtle.forward()
    turtle.turnLeft()
    turtle.turnLeft()
    for k in savedMoves (table) do
        table [k] = nil
    end
end

function orePatch()
    turtle.dig()
    turtle.forward()
end



function forward(length)
    for i=1, length, 1 do
        while turtle.detect() or turtle.detectUp() do
            turtle.dig()
            turtle.digUp()
            sleep(0.5)
        end
        if turtle.detectDown() == false then
            turtle.select(slot.fill)
            turtle.placeDown()
        end
        turtle.forward()
        findblocks()    
    end
end

function blockfront()
    local has_block, data = turtle.inspect()
    if has_block then
        if (blocks[data.name]) then
            return true
        else
            return false
        end
    else
        return false
    end
end

Main()