function drawMineHitboxes()
    -- 1st pair of asteroids
    love.graphics.line(asx+10, asy+20, asx+asteroid:getWidth()*3.7, asy+20)
    love.graphics.line(asx+10, asy+asteroid:getHeight()*3.7, asx+asteroid:getWidth()*3.7, asy+asteroid:getHeight()*3.7)
    love.graphics.line(asx+10, asy+20, asx+10, asy+asteroid:getHeight()*3.7)
    love.graphics.line(asx+asteroid:getWidth()*3.7, asy+20, asx+asteroid:getWidth()*3.7, asy+asteroid:getHeight()*3.7)

    love.graphics.line(as2x+10, asy+20, as2x+asteroid:getWidth()*3.7, asy+20)
    love.graphics.line(as2x+10, asy+asteroid:getHeight()*3.7, as2x+asteroid:getWidth()*3.7, asy+asteroid:getHeight()*3.7)
    love.graphics.line(as2x+10, asy+20, as2x+10, asy+asteroid:getHeight()*3.7)
    love.graphics.line(as2x+asteroid:getWidth()*3.7, asy+20, as2x+asteroid:getWidth()*3.7, asy+asteroid:getHeight()*3.7)

    love.graphics.line(as3x+10, asy+20, as3x+asteroid:getWidth()*3.7, asy+20)
    love.graphics.line(as3x+10, asy+asteroid:getHeight()*3.7, as3x+asteroid:getWidth()*3.7, asy+asteroid:getHeight()*3.7)
    love.graphics.line(as3x+10, asy+20, as3x+10, asy+asteroid:getHeight()*3.7)
    love.graphics.line(as3x+asteroid:getWidth()*3.7, asy+20, as3x+asteroid:getWidth()*3.7, asy+asteroid:getHeight()*3.7)

    -- 2nd pair of asteroids
    love.graphics.line(as4x+10, as2y+20, as4x+asteroid:getWidth()*3.7, as2y+20)
    love.graphics.line(as4x+10, as2y+asteroid:getHeight()*3.7, as4x+asteroid:getWidth()*3.7, as2y+asteroid:getHeight()*3.7)
    love.graphics.line(as4x+10, as2y+20, as4x+10, as2y+asteroid:getHeight()*3.7)
    love.graphics.line(as4x+asteroid:getWidth()*3.7, as2y+20, as4x+asteroid:getWidth()*3.7, as2y+asteroid:getHeight()*3.7)

    love.graphics.line(as5x+10, as2y+20, as5x+asteroid:getWidth()*3.7, as2y+20)
    love.graphics.line(as5x+10, as2y+asteroid:getHeight()*3.7, as5x+asteroid:getWidth()*3.7, as2y+asteroid:getHeight()*3.7)
    love.graphics.line(as5x+10, as2y+20, as5x+10, as2y+asteroid:getHeight()*3.7)
    love.graphics.line(as5x+asteroid:getWidth()*3.7, as2y+20, as5x+asteroid:getWidth()*3.7, as2y+asteroid:getHeight()*3.7)

    love.graphics.line(as6x+10, as2y+20, as6x+asteroid:getWidth()*3.7, as2y+20)
    love.graphics.line(as6x+10, as2y+asteroid:getHeight()*3.7, as6x+asteroid:getWidth()*3.7, as2y+asteroid:getHeight()*3.7)
    love.graphics.line(as6x+10, as2y+20, as6x+10, as2y+asteroid:getHeight()*3.7)
    love.graphics.line(as6x+asteroid:getWidth()*3.7, as2y+20, as6x+asteroid:getWidth()*3.7, as2y+asteroid:getHeight()*3.7)
end

function drawPlayerHitbox()
    love.graphics.line(px+15, py+5, px+player:getWidth()*2.8, py+5)
    love.graphics.line(px+15, py+player:getHeight()*4, px+player:getWidth()*2.8, py+player:getHeight()*4)
    love.graphics.line(px+15, py+5, px+15, py+player:getHeight()*4)
    love.graphics.line(px+player:getWidth()*2.8, py+5, px+player:getWidth()*2.8, py+player:getHeight()*4)
end
