require_relative "./entity.rb"
require_relative "./player.rb"

class Bullet < Entity
    def initialize(window, x, y, angle)
        @window = window
        @image = Gosu::Image.new("../media/images/bullet-small.png")
        @x = x
        @y = y
        @vel_x = Math.cos(angle) * 10
        @vel_y = Math.sin(angle) * 10
        @angle = 0
    end

    def update()
        @x += @vel_x 
        @y += @vel_y
        if @x > @window.width || @x < 0
            @window.bullets.delete(self)
        end
        if @y > @window.height || @y < 0
            @window.bullets.delete(self)
        end 
    end
end