require "gosu"
require_relative "./player.rb"
require_relative "./asteroid.rb"

class Window < Gosu::Window
    attr_accessor :bullets, :asteroids

    def initialize()
        super(1240, 720)
        self.caption = "Scuffed asteroids"
        @player = Player.new(self)
        @asteroids = []
        @bullets = []
    end

    def button_down(button_id)
        case button_id
        when Gosu::KB_RETURN
            @player.shoot
        when Gosu::KB_M
            1.times do
                asteroid = Asteroid.new(self)
                @asteroids.append(asteroid)
            end
        end
    end

    def update()
        @player.update
        player_hitbox = @player.hitbox
        
        @asteroids.each do |a| 
            if a.hitbox.intersects?(player_hitbox)
                @player.x = self.width/2
                @player.y = self.height/2
            end
            a.update
        end

        @bullets.each do |b| 
            b.update
            bullet_hitbox = b.hitbox
            @asteroids.each do |a|
                if a.hitbox.intersects?(bullet_hitbox)
                    @bullets.delete(b)
                    a.break()
                end
            end
        end
    end

    def draw()
        @player.draw

        @asteroids.each do |a| 
            a.draw
        end

        @bullets.each do |b| 
            b.draw
        end
    end
end

window = Window.new
window.show 