class WordSearch
  attr_accessor :wordlist
  attr_reader :puzzle, :solution

  VERSION = '0.0.1'

  def initialize(wordlist)
    @directions  = 8
#     @fillalphabet
    @height      = 40
    @width       = 40
    @intersect   = 0
    @wordlist    = wordlist
    @row_offsets = [1,0,0,-1,1,1,-1,-1];
    @col_offsets = [0,1,-1,0,-1,1,1,-1];
    @puzzle      = Array.new
    @solution    = Array.new

# if wordlist
#   normalize wordlist
# end
  end

  def wordcount
    @wordlist.size
  end

private

  
  def normalize_wordlist
    @wordlist.each {|word| word.upcase!}

    # TODO: Change unicode characters to ASCII
  end
end
