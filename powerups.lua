function powerupInit()
    powerY = getCurrentY()
    scoreMult = love.graphics.newImage("images/doublescore.png")
    shootAst = love.graphics.newImage("images/shoot.png")
    powerupList = {scoreMult, shootAst}
    start = false
    powerX = 0
    spawn = true
    changeColorVar = false

    powerTimer = 5
    powerClock = cron.every(60, function() 
        love.graphics.print(powerTimer, 450, 0)
        powerTimer = powerTimer - 1
    end)
end

function updatePowerup()
    powerY = powerY + (2+bgMultiplier)
    if startPowerTimer then
        if powerType == scoreMult then
            scoreMultNum = 2
            changeColorVar = true
        elseif powerType == shootAst then
            a = 1
        end
    else
        scoreMultNum = 1
    end
    if isBelow() and start == true then
        powerY = 0
        spawn = true
        start = false
        startPowerTimer = true
    end
end

function updateTimer()
    if startPowerTimer == true then
        powerClock:update(1)
        if powerTimer == 0 then
            startPowerTimer = false
            powerTimer = 5
        end
    end
end

function isOnTop()
    return powerY <= 0
end

function powerOnScreen()
    if powerY > 0 then
        if powerY <= 700 then
            return true
        end
        return false
    else
        return false
    end
end

function isBelow()
    return powerY > 700
end

function spawnPowerup()
    if spawn == true then
        powerX = spawnPosList[love.math.random(1, 2)]
        powerType = powerupList[love.math.random(1, 2)]
    end
    spawn = false
    love.graphics.draw(powerType, powerX, powerY, nil, 0.7)
end

function getPowerX()
    return powerX
end