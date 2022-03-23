---@diagnostic disable: lowercase-global
local blocks = {
    ["minecraft:grass_block"] = true,
    ["minecraft:dirt"] = true
}

local branch = {
    amount = 5, 	-- the amount of "branch-pairs"
	length = 32,	-- the length of each branch
	space  = 5}	-- the space between each branch-pair

local slot = {
    fuel  = 1,	-- the slotnumber for fuel
	torch = 2,	-- the slotnumber for torches
	fill  = 3}	-- the slotnumber for filling material

local other = {
    torch = true,  -- place torches? (true=yes/false=no)
    close = false}  -- close the branches? (true=yes/false=no)

local savedMoves = {}


function isInventoryFull()
    if (turtle.getItemCount(16) == 0) then
        return false
    else
        return true
    end
end


function blockDetection(has_block, data)
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

function blockDetectionDown()
    local has_block, data = turtle.inspectDown()
    return blockDetection(has_block, data)
end

function blockDetectionForward()
    local has_block, data = turtle.inspect()
    return blockDetection(has_block, data)
end

function blockDetectionUp()
    local has_block, data = turtle.inspectUp()
    return blockDetection(has_block, data)
end


function Tunnel(length)
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
        oreVein()
    end
end

function mineForward()
    turtle.dig()
    turtle.forward()
end

function mineDown()
    turtle.digDown()
    turtle.down()
end

function recordMoves(direction)
    table.insert(savedMoves, direction)
end

function oreVein()
    if blockDetectionForward() then
        mineForward()
        return true
    end
    turtle.turnLeft()
    if blockDetectionForward() then
        recordMoves("left")
        recordMoves("forward")
        mineForward()
        return true
    end
    turtle.turnLeft()
    turtle.turnLeft()
    if blockDetectionForward() then
        recordMoves("right")
        recordMoves("forward")
        mineForward()
        return true
    end
    if blockDetectionDown then
        mineDown()
        recordMoves("down")
    end
    return false
    
end

function Main()
    
end

Main()