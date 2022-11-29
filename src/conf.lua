local love = love
do
  love.conf = function(t)
    t.title = "AGF"
    t.author = "Tourahi"
    t.version = "11.3"
    t.console = false
    t.modules.joystick = false
    t.modules.audio = true
    t.modules.keyboard = true
    t.modules.event = true
    t.modules.image = true
    t.modules.graphics = true
    t.modules.timer = true
    t.modules.mouse = true
    t.modules.sound = true
    t.modules.physics = false
    t.window.vsync = true
    t.window.resizable = false
  end
  return love
end
