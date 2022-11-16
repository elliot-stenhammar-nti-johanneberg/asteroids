require "gosu"
require_relative "./entity.rb"
require_relative "./bullet.rb"

class Player < Entity
    attr_accessor :angle, :vel, :x, :y

public
    def initialize(window)
        super(window)
        @image = Gosu::Image.new("../media/images/spaceship-small.png")
        @x = @window.width/2
        @y = @window.height/2
        @angle = -Math::PI/2 # In radians
    end

    def update()
        super()
        if Gosu.button_down? Gosu::KB_A
            self.turn_left
        end
        if Gosu.button_down? Gosu::KB_D
            self.turn_right
        end
        if Gosu.button_down? Gosu::KB_W
            self.thrust
        end
    end

def shoot()
    bullet = Bullet.new(@window, @x, @y, @angle)
    @window.bullets.append(bullet)
end

private
    def turn_left()
        @angle -= 0.1
    end

    def turn_right()
        @angle += 0.1
    end

    def thrust()
        @vel_x += Math.cos(@angle) * 0.1
        @vel_y += Math.sin(@angle) * 0.1
    end
end