require '../lib/game.rb'

describe Game do

    describe '#play' do #method will loop until game is finished

        it 'gets player\'s move' do
            #player1 choice gets saved to instance variable
        end

        it 'switches to other player\'s turn in the end' do
            #current variable will switch from player1 --> player2
        end


        #bottom two tests may be ran in other methods (ie/ checkDraw and checkWinner)
        #or have an "outcome" instance variable and set to whatever outcome happens
        it 'sends win message when a player wins' do

        end

        it 'sends draw message when there are no more available moves' do

        end

    describe '#validate_names' do
        subject(:game_play) { described_class.new() }

        context 'returns true if player names are valid' do
            it 'player names are not the same' do
                player1 = game_play.instance_variable_get(:@player1)
                player2 = game_play.instance_variable_get(:@player2)
                player1 = 'timmy'
                player2 = 'john'
                expect(game_play.validate_names).to eq(true)
            end

            it 'player name is less than 10 characters' do
                player1 = game_play.instance_variable_get(:@player1)
                player2 = game_play.instance_variable_get(:@player2)
                player1 = 'john'
                player2 = 'timmy'
                expect(game_play.validate_names).to eq(true)
            end
        end

        context 'returns false/error msg if player names are invalid' do
            it 'player names are the same' do
                #write expect (error message)
            end

            it 'player name is greater than 10 characters' do

            end
        end
    end

    describe '#validate_choice' do
        subject(:choice) { described_class.new() }

        context 'returns true if choice/move is valid' do
            xit 'move is available' do 
                #move has not been taken yet
            end
        end

        context 'returns false/error msg if choice/move is invalid' do
            xit 'move is unavailable or out of range' do

            end

            xit 'sends error message if move is unavailable' do

            end

            xit 'sends error messsage if move is out of range' do

            end
        end
    end

    describe '#end_game?' do 
        #set 'outcome' instance variable to outcome
        context 'if there is no winner' do
            xit 'returns false' do

            end
        end

        context 'if there is a winner' do
            xit 'sets "outcome" to winner' do
            
            end
        end

        context 'if there are no more moves available' do
            xit 'sets "outcome" to draw' do

            end
        end
    end

    describe '#check_winner' do 
        #checks if 'current' player has any winning combos (BST?)
    end

    describe '#check_outcome' do
        #checks the message that will be printed out
        context 'a player wins the game' do

        end

        context 'game ends with a draw' do

        end
    end
end