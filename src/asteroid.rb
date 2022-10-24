require_relative "./entity.rb"
class Asteroid < Entity

    def initialize(window)
        super(window)
        @image = Gosu::Image.new("../media/images/asteroid-small.png")
        @x = rand(0..@window.width)
        @y = rand(0..@window.height)
        @vel_x = rand(1..3)
        @vel_y = rand(1..3)
        @angle = -Math::PI/2 * rand() # In radians
    end

end