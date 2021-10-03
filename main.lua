suit = require 'lib.suit'
SSM = require 'lib.ssm'

function love.load()
    SSM.setPath('scenes/')
    SSM.add('game')
end

function love.update(dt)
    SSM.update(dt)
end

function love.draw()
    SSM.draw()
end
