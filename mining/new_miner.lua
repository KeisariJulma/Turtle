---@diagnostic disable: lowercase-global
local blocks = {
    ["minecraft:grass_block"] = true,
    ["minecraft:dirt"] = true
}

local fasesing = "North"

local map = {}

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
        return data.name
    else
        return nil
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


function mapping(block_id, fasing)
    local locationX, locationY, locationZ = gps.locate()
    if fasing == "North" then
        locationZ = locationZ+1
    elseif fasing == "East" then
        locationX = locationX-1
    elseif fasing == "South" then
        locationZ = locationZ-1
    elseif fasing == "West" then
        locationX = locationX+1
    end
    table.insert(map, {block_id = locationX, locationY, locationZ})
end

function Main()
    Tunnel(1)
end

Main()