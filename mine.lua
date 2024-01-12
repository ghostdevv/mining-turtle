if #arg < 3 then
    print("Usage: turtle_program <width> <height> <depth>")
    return
end

local width = tonumber(arg[1])
local height = tonumber(arg[2])
local depth = tonumber(arg[3])

if not width or not height or not depth then
    print("Invalid arguments. Please enter valid numbers for width, height, and depth.")
    return
end

turtle.refuel()
print("Fuel Level: " .. turtle.getFuelLevel())

local up = true

for di = 1, depth do
    print("Digging layer " .. di)

    for dw = 1, width do
        for dh = 1, height do
            turtle.dig()

            if dh < height then
                if up then
                    turtle.up()
                else
                    turtle.down()
                end
            end
        end

        up = not up

        if dw < width then
            if di % 2 == 0 then
                turtle.turnLeft()
                turtle.forward()
                turtle.turnRight()
            else
                turtle.turnRight()
                turtle.forward()
                turtle.turnLeft()
            end
        end
    end

    turtle.forward()
end
