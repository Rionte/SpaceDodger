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
    if powerupType == 1 then
        love.graphics.draw(scoreMult, tempVar, powerY, nil, 0.7)
    elseif powerupType == 2 then
        love.graphics.draw(shootAst, tempVar, powerY, nil, 0.7)
    end
end

function showRandomNum()
    return getRandNum()
end