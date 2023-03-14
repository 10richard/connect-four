class Board
    attr_accessor :board

    def initialize
        @board = Array.new(6) {Array.new(7) {'O'}}
    end

    def modify_board(move, player)
        board_dup = @board.dup.reverse

        catch :valid_move do
            board_dup.each do |row|
              row.each_with_index do |pos, i|
                if i + 1 == move && pos == 'O'
                    row[i] = player['symbol']
                    throw :valid_move
                end
              end
            end
        end

        @board = board_dup.reverse
    end

    def check_winner(current_player)
        symbol = current_player['symbol']
        p 'horizontal', check_horizontal(symbol)
        p 'vertical', check_vertical(symbol)
        p 'left_diagonal', check_left_diagonal(symbol)
        p 'right_diagonal', check_right_diagonal(symbol)
        check_horizontal(symbol) || check_vertical(symbol) || check_left_diagonal(symbol) || check_right_diagonal(symbol)
    end

    def check_horizontal(symbol)
        #counts amount of consecutive symbols in a row (resets to 0 if symbol is not the same)
        count = 0
        @board.each do |row|
            row.each do |pos|
                if count == 4
                    return true
                elsif pos == symbol
                    count += 1
                else
                    count = 0
                end
            end
        end
        false 
    end

    def check_vertical(symbol)
        count = 0
        in_a_row = 0
        while count < 7
            column = get_column(count)
            column.each do |pos|
                if in_a_row == 4
                    return true
                elsif pos == symbol
                    in_a_row += 1
                else
                    in_a_row = 0
                end
            end
            in_a_row = 0
            count += 1
        end
        false
    end

    def check_left_diagonal(symbol, row=0, column=0)
        return false if row > 3
        return true if @board[row][column] == symbol && @board[row + 1][column + 1] && @board[row + 2][column + 2] && @board[row + 3][column + 3]
        if column == 4
            row += 1
            column = 0
        end
        #set column to 0 if == 4
        check_left_diagonal(symbol, row, column += 1)
    end

    def check_right_diagonal(symbol, row=0, column=0)
        return false if row > 3
        board = @board.dup
        return true if board[row][column] == symbol && board[row + 1][column + 1] && board[row + 2][column + 2] && board[row + 3][column + 3]
        if column == 4
            row += 1
            column = 0
        end
        #reverse board
        #set column to 0 if == 4
        check_right_diagonal(symbol, row, column += 1)
    end

    def get_column(count)
        column = @board.map { |row| row[count]}
        column
    end
end