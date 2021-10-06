function minesInit()
    astSizeMultiplier = 2
    astSize = asteroid:getWidth() * 4
    aspos = {
        { y=-100, x={ love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) } },
        { y=-550, x={ love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) } }
    }
end
    
function minesUpdate()
    for _,asy in ipairs(aspos) do
        asy.y = asy.y + (2+bgMultiplier)
        if asy.y >= 700 then
            asy.y = -100
            asy.x = { love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) }
        end
    end
end

function minesDraw()
    for _,asy in ipairs(aspos) do
        for _,asx in ipairs(asy.x) do
            love.graphics.draw(asteroid, asx, asy.y, nil, astSizeMultiplier)
            love.graphics.print(asx, asx+38, asy.y+48)
        end
    end
end