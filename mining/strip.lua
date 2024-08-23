local slot = {
    fuel = 1,
    torch = 2,
    fill = 3
}
local torchInterval = 8

local brachStart = {
    x = turtle.getX(),
    y = turtle.getY(),
    z = turtle.getZ()

}


function Main(amountOfBranches, Brancelength, brancHeight)
    print("No")
end

function torch()
    turtle.select(slot.torch)
    turtle.placeDown()
end


function printPosition()
    print("Hello")
    print(brachStart.x, brachStart.y, brachStart.z) 
end

printPosition()