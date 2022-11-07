require_relative "./entity.rb"
require_relative "./bullet.rb"

class Player < Entity
    attr_accessor :angle, :vel, :x, :y

    def initialize(window)
        super(window)
        @image = Gosu::Image.new("../media/images/spaceship-small.png")
        @x = @window.width/2
        @y = @window.height/2
        @angle = -Math::PI/2 # In radians
    end

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

    def shoot()
        bullet = Bullet.new(@window, @x, @y, @angle)
        @window.bullets.append(bullet)
    end

end