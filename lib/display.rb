module Display

    def instructions(msg)
        {
            'enter_names' => 'ENTER PLAYER NAMES'
        }[msg]
    end

    def name_error(msg)
        {
            'too_many_chars' => 'Names cannot be greater than 10 characters',
            'same_name' => 'Names cannont be the same'
        }[msg]
    end
end