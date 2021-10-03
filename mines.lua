function genMine()
    asy = asy + (2+bgMultiplier)
    as2y = as2y + (2+bgMultiplier)
    if asy >= 700 then
        asy = -100
        asx = love.math.random(-15, 50)
        as2x = love.math.random(150, 275)
        as3x = love.math.random(425, 500)
    end
    if as2y >= 700 then
        as2y = -100
        as4x = love.math.random(-15, 150)
        as5x = love.math.random(160, 275)
        as6x = love.math.random(300, 450)
    end
end

function drawMine()
    love.graphics.draw(asteroid, asx, asy, nil, 4)
    love.graphics.draw(asteroid, as2x, asy, nil, 4)
    love.graphics.draw(asteroid, as3x, asy, nil, 4)

    love.graphics.draw(asteroid, as4x, as2y, nil, 4)
    love.graphics.draw(asteroid, as5x, as2y, nil, 4)
    love.graphics.draw(asteroid, as6x, as2y, nil, 4)
end