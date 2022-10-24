require "gosu"
require_relative "./player.rb"
require_relative "./asteroid.rb"

class Window < Gosu::Window
    attr_accessor :entities
    def initialize()
        super(1240, 720)
        self.caption = "Game"
        @player = Player.new(self)
        @entities = []
    end

    def update()
        if Gosu.button_down? Gosu::KB_A
            @player.turn_left
        end
        if Gosu.button_down? Gosu::KB_D
            @player.turn_right
        end
        if Gosu.button_down? Gosu::KB_W
            @player.thrust
        end
        if Gosu.button_down? Gosu::KB_RETURN
            @player.shoot
        end
        if Gosu.button_down? Gosu::KB_M
            asteroid = Asteroid.new(self)
            @entities.append(asteroid)
        end
        @player.update

        @entities.each { | entity | 
            entity.update
        }
    end

    def draw()
        @player.draw

        @entities.each { | entity | 
            entity.draw
        }
    end

end

window = Window.new
window.show 