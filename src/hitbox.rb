class Hitbox
    attr_reader :left, :bottom, :width, :height, :right, :top

    def initialize(left, bottom, width, height)
        @left = left
        @bottom = bottom
        @width = width
        @height = height
        @right = @left + @width
        @top = @bottom + @height
    end

    def intersects?(box)
        self.right > box.left && self.bottom < box.top && self.left < box.right && self.top > box.bottom
    end
end
