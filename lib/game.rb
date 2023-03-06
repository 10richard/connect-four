require_relative './display.rb'
require_relative './board.rb'

class Game < Board

    include Display

    def initialize
        #@player = {'moves' => [], 'symbol' => 'P', 'name' => 'Patrick'}
        @player1 = {'moves' => []}
        @player2 = {'moves' => []}
        @current = nil
        @game_over = false
        @board = Board.new()
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
        @player1['name'] = p1
        @player2['name'] = p2
        puts 'Player names set'
    end

    def play
        get_names
        @current 
        until @game_over
            print_board(@board)
            move = get_move
            modify_board(move, @current)
            #@gameover = game_over?
            @current == @player1 ? @current = @player2 : @current = @player1
        end
        #check_outcome
    end

    def get_move
        #append move to current player's moves list? - use to determine if there is a winner
        got_move = false
        until got_move
            puts instructions('get_move')
            move = gets.chomp
            got_move = validate_move(move)
        end
        @current == @player1 ? @player1['moves'].append(move) : @player2['moves'].append(move)
    end

    def validate_move(move)
        move.between?(1, 7)
        #check if column is full
        #if column full, then print error and return false
    end

    def game_over?
        #checks if there are any available positions left on the board (.none? enumerable)
        #checks if either play is a winner
        #will return true if above conditions are met, otherwise return false
    end
end