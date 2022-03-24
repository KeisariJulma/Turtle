---@diagnostic disable: lowercase-global


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

local box = peripheral.find("chatBox")
local x, y, z = gps.locate()
box.sendMessageToPlayer("X:"..x.." Y:"..y.." Z:"..z) "KeisariJulma")
