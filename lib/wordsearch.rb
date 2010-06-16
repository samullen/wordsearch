class WordSearch
  attr_accessor :wordlist, :puzzle
  attr_reader :solution
  attr_writer :height, :width

  VERSION = '0.0.1'

  def initialize(wordlist)
    @wordlist    = wordlist
    @row_offsets = [1,0,0,-1,1,1,-1,-1]
    @col_offsets = [0,1,-1,0,-1,1,1,-1]
    @directions  = 8
    @height      = nil
    @width       = nil
    @intersect   = 0
#     @fillalphabet

    @puzzle      = Array.new
    @solution    = Array.new
# if wordlist
#   normalize wordlist
# end
  end

  def width
    @width || @puzzle[0].size
  end

  def height
    @height || @puzzle.size
  end

  # number of words in the list
  def wordcount
    @wordlist.size
  end

  def expletives(wordlist=nil)
    wordlist ||= %w(FUCK SHIT FAG BITCH CUNT DICK HELL DAMN TWAT TITS PISS SEX)
    expletives = Array.new

    wordlist.each do |word|
      expletives << word if self.find_word(word) > 0
    end

    expletives
  end

  # find and return duplicate words from the default or provided wordlist
  def duplicates(wordlist=@wordlist)
    wordlist.each do |word|
      if self.find_word(word) > 1
        duplicates << word
      end
    end

    duplicates
  end

  def find_word(word)
    letters = word.each_char.to_a
    occurrences = 0

    height.times do |r|
      width.times do |c|
        if @puzzle[r][c] == letters[0]
          @directions.times do |direction|
            error = false
            rr = r
            cc = c

            for letter in letters
              if (rr < 0 || rr >= height || cc < 0 || cc >= width || @puzzle[rr][cc] != letter)
                error = true
                break
              end

              rr += @row_offsets[direction]
              cc += @col_offsets[direction]
            end

            unless error 
              occurrences += 1

              return 2 if occurrences > 1
            end
          end
        end
      end
    end
  
    return occurrences
  end

private

  def clear_grid
    for c in @puzzle do
      for r in @puzzle[c] do
        @puzzle[c][r] = '.'
      end
    end
  end
  
  def normalize_wordlist
    @wordlist.each {|word| word.upcase!}

    # TODO: Change unicode characters to ASCII
  end
end
