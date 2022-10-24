require_relative "./entity.rb"
require_relative "./player.rb"

class Bullet < Entity
    def initialize(window, x, y, angle)
        @window = window
        @image = Gosu::Image.new("../media/images/bullet-small.png")
        @x = x
        @y = y
        @vel_x = Math.cos(angle) * 7
        @vel_y = Math.sin(angle) * 7
        @angle = 0
    end

    def update()
        @x += @vel_x 
        @y += @vel_y
        if @x > @window.width || @x < 0
            @window.entities.delete(self)
        end
        if @y > @window.height || @y < 0
            @window.entities.delete(self)
        end
    end
end