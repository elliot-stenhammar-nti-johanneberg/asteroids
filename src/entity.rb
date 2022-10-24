class Entity
    def initialize(window)
        @window = window
        @x = 0
        @y = 0
        @vel_x = 0.0
        @vel_y = 0.0 
        @angle = 0 
    end

    def update()
        @x += @vel_x 
        @y += @vel_y
        if @x > @window.width || @x < 0
            @x = @window.width - @x 
        end
        if @y > @window.height || @y < 0
            @y = @window.height - @y 
        end
    end

    def draw()
        @image.draw_rot(@x, @y, 0, @angle * 180/Math::PI + 90) # Convert
    end
end