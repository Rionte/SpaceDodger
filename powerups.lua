function powerupInit()
    powerY = getCurrentY()
    scoreMult = love.graphics.newImage("images/doublescore.png")
    shootAst = love.graphics.newImage("images/shoot.png")
    powerupList = {scoreMult, shootAst}
    powerOnScreenVar = false
    powerupType = 0
end

function updatePowerup()
    powerY = powerY + (2+bgMultiplier)
end

function powerOnScreen()
    if powerY >= love.graphics.getHeight() then
        powerY = -100
        powerOnScreenVar = false
        startTempCount = true
        boolSpawn = false
        return false
    else
        powerOnScreenVar = true
        return true
    end
end

function spawnPowerup()
    love.graphics.draw(scoreMult, tempVar, powerY, nil, 0.7)
    love.graphics.print(powerY, 0, 200)
    love.graphics.print(tostring(boolSpawn), 0, 250)
    love.graphics.print(powerupType, 0, 400)
end

function showRandomNum()
    return getRandNum()
end