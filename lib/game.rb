require_relative './display.rb'
require_relative './board.rb'

class Game < Board

    include Display

    def initialize
        #@player = {'name' => 'Patrick', 'symbol' => 'P'}
        @player1 = {}
        @player2 = {}
        @current = nil
        @game_over = nil
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

    def set_player_symbols
        @player1['symbol'] = @player1['name'][0]
        @player2['symbol'] = @player2['name'][0]
    end

    def play
        get_names
        @current 
        until @game_over
            print_board(@board)
            move = get_move
            modify_board(move, @current)
            @gameover = game_over?
            @current == @player1 ? @current = @player2 : @current = @player1
        end
        check_outcome
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
        return true if move.between?(1, 7) && !column_full?(move)
        #check if column is full
        #if column full, then print error and return false
    end

    def column_full?(move)
        column = @board.map { |row| row[move - 1]}

        #checks if column has no empty spaces ("O")
        column.none?('O')
    end

    def game_over?
        #checks if there are any available positions left on the board (.none? enumerable)
        #checks if either play is a winner
        #will change @game_over variable to outcome
        #if there is a winner change the variable to player1 or player2 

        #check_winner method is located in board.rb
        if check_winner
            @game_over = @current
        elsif draw?
            @game_over = 'draw'
        end
    end

    def draw?
        @board.each do |row|
            return false if row.any?('O')
        end
        true
    end

    def check_outcome
        case @game_over
        when 'draw'
            puts "The board is full... It\'s a draw!"
        else
            puts "#{@game_over['name']} won!"
        end
    end
end