suit = require 'lib.suit'
SSM = require 'lib.ssm'

function love.load()
    bg = love.graphics.newImage("images/bg.png")
end

function love.update(dt)
end

function love.draw()
    love.graphics.draw(bg)
end