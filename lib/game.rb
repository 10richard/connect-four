require_relative './display.rb'

class Game 

    def initialize
        @player1 = nil
        @player2 = nil
        @current = nil
    end

    def get_names
        puts instructions('enter_names')
        puts 'PLAYER 1: '
        p1_name = gets.chomp
        puts 'PLAYER 2: '
        p2_name = gets.chomp
        validate_names(p1_name, p2_name)
    end

    def validate_names(p1, p2)
        if p1.length > 10 || p2.length > 10
            puts name_error('too_many_chars')
            return get_names
        elsif p1 == p2
            puts name_error('same_name')
            return get_names
        end
        puts 
    end
end