class WordSearch
  attr_accessor :wordlist, :puzzle, :solution
  attr_writer :height, :width

  VERSION = '0.0.2'
  ROW_OFFSETS = [1,0,0,-1,1,1,-1,-1]
  COL_OFFSETS = [0,1,-1,0,-1,1,1,-1]

  def initialize(*args)
    opts = {}

    defaults = {
      :wordlist  => Array.new,
      :puzzle    => Array.new,
      :solution  => Array.new,
      :intersect => false,
    }

    case
    when args.length == 0 then
    when args.length == 1 && args[0].class == Hash then
      arg = args.shift

      if arg.class == Hash
        opts = arg
      end
    else
      raise ArgumentError, "new() expects hash or hashref as argument"
    end

    opts = defaults.merge opts

    # set instance variables from DEFAULT_OPTIONS
    opts.each do |k,v|
      self.instance_variable_set(("@" + k.to_s).to_sym, v)
    end

    @directions  = 8
    @height      = 0
    @width       = 0
#     @fillalphabet

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

              rr += ROW_OFFSETS[direction]
              cc += COL_OFFSETS[direction]
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
