class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_accessor :secret_word, :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    self.attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    # blank array, loop through all, check index of each and shovel matching ones
    output = []
    self.secret_word.each_char.with_index { |l, idx| output << idx if char == l }
    output
  end

  def fill_indices(char, arr)
    # [1, 3, 4] == arr == get_matching_indices
    # loop through arr above
    # guess_word [ _ , _ , _ ]

    arr.each { |idx| self.guess_word[idx] = char }

  end

  def try_guess(char)
    if get_matching_indices(char).length == 0
      self.remaining_incorrect_guesses -= 1
    else
      fill_indices(char, get_matching_indices(char))
    end
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      self.attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end
