suit = require 'lib.suit'
SSM = require 'lib.ssm'
cron = require 'lib.cron.cron'

function love.load()
    SSM.setPath('scenes/')
    SSM.add('title')
end

function love.update(dt)
    SSM.update(dt)
end

function love.draw()
    SSM.draw()
end