require "gosu"
require_relative "./player.rb"
require_relative "./asteroid.rb"

class Window < Gosu::Window
    attr_accessor :bullets, :asteroids

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
            1.times {
                asteroid = Asteroid.new(self)
                @asteroids.append(asteroid)
            }
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
        player_hitbox = @player.hitbox
        
        @asteroids.each { |a| 
            if a.hitbox.intersects?(player_hitbox)
                @player.x = self.width/2
                @player.y = self.height/2
            end
            a.update
        } 

        @bullets.each { |b| 
            b.update
            bullet_hitbox = b.hitbox
            @asteroids.each { |a|
                # if b.hitbox.intersects?(a.hitbox)
                if a.hitbox.intersects?(bullet_hitbox)
                    @bullets.delete(b)
                    a.break()
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