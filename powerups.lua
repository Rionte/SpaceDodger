function powerupInit()
    powerY = getCurrentY()
    scoreMult = love.graphics.newImage("images/doublescore.png")
end

function updatePowerup()
    powerY = powerY + (2+bgMultiplier)
end

function powerOnScreen()
    if powerY >= love.graphics.getHeight() then
        boolSpawn = false
        startTempCount = true
    end
end

function spawnPowerup()
    love.graphics.draw(scoreMult, 100, powerY, nil, 0.7)
    love.graphics.print(powerY, 0, 200)
    love.graphics.print(tostring(boolSpawn), 0, 250)
end

function showRandomNum()
    love.graphics.print(getRandNum())
end