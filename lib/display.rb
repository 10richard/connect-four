module Display

    def print_board(board)
        puts ''
        puts "BOARD:\n1 2 3 4 5 6 7"
        board.each do |row|
            puts row.join(' ')
        end
    end

    def instructions(msg, current_player=nil)
        {
            'enter_names' => 'ENTER PLAYER NAMES',
            'get_move' => "Enter a column on the board (#1 - 7)\n#{current_player}'s turn:",
        }[msg]
    end

    def name_error(msg)
        {
            'too_many_chars' => 'Names cannot be greater than 10 characters',
            'same_name' => 'Names cannont be the same',
        }[msg]
    end

    def game_error(msg)
        {
            'column_full' => "Column selected is full\nSelect a different column",
            'no_column' => "\n**You did not select a valid column**\nPlease enter #1-7"
        }[msg]
    end
end