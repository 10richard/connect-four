class Board
    attr_accessor 

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
end