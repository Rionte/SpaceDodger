function powerupInit()
    powerX, powerY = getCurrentXY()
end

function updatePowerup()
    powerY = powerY + (2+bgMultiplier)
end

function spawnPowerup()
    love.graphics.draw(scoreMult, powerX, powerY)
    love.graphics.print(powerX, 0, 200)
    love.graphics.print(powerY, 0, 250)
end