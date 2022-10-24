require "gosu"
require_relative "./player.rb"
require_relative "./asteroid.rb"

class Window < Gosu::Window
    attr_accessor :bullets
    def initialize()
        super(1240, 720)
        self.caption = "Game"
        @player = Player.new(self)
        @asteroids = []
        @bullets = []
    end

    def button_down(button_id)
        case button_id
        when Gosu::KB_RETURN
            @player.shoot
        when Gosu::KB_M
            asteroid = Asteroid.new(self)
            @asteroids.append(asteroid)
        end
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
        @player.update

        @asteroids.each { |a| 
            a.update
        } 

        @bullets.each { |b| 
            b.update
            @asteroids.each { |a|
                # if b.hitbox.intersects?(a.hitbox)
                if a.hitbox.intersects?(b.hitbox)
                    @bullets.delete(b)
                    @asteroids.delete(a)
                end
            }
        }
    end

    def draw()
        @player.draw

        @asteroids.each { |a| 
            a.draw
        }

        @bullets.each { |b| 
            b.draw
        }
    end
end

window = Window.new
window.show 