require_relative "./entity.rb"
class Asteroid < Entity
    attr_accessor :level, :image

    def initialize(window)
        super(window)
        @image = Gosu::Image.new("../media/images/asteroid-small.png")
        @x = rand(0..@window.width)
        @y = rand(0..@window.height)
        @vel_x = rand() * 3
        @vel_y = rand() * 3
        @angle = -Math::PI/2 * rand() # In radians
        @level = 1
    end

    def break()
        if @level == 1
            2.times {
                sub_asteroid = Asteroid.new(@window)
                sub_asteroid.level = 2
                sub_asteroid.x = self.x
                sub_asteroid.y = self.y
                sub_asteroid.image = Gosu::Image.new("../media/images/sub_asteroid-small.png")
                @window.asteroids.append(sub_asteroid)
            }
            @window.asteroids.delete(self)
        elsif @level == 2
            @window.asteroids.delete(self)
        end
    end
end