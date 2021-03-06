require File.join(File.dirname(__FILE__), '..', 'lib','wordsearch')

describe WordSearch do
  before(:all) do
    basedir = File.dirname(__FILE__)
    @puzzle = Hash.new

    @puzzle[:ww] = {
      :puzzle => "GMSSEXREACAMERA,EREHPSOMTAOKAAE,RSUCOFTNOOAECSA,MTIBROURZDGMOAK,AIROSOTJOEEPLNS,NOLAMTNKINXLOII,TLSINSHADEAGRAF,ELNPTSMGMEPUSVA,COESAAMOITEITIR,HPLLTCRIOLSPMCG,NAFEIUEYSNFASTO,IXUTNEDEWSGREOT,CRPNOISIVEIEARO,AOEPYTOTORPOLMF,LABSURVEILLANCE".split(/,/).map {|line| line.each_char.to_a},
      :wordlist => %w(Aerial Amateur Apollo Astronaut Atmosphere Camera Colors Eastman Expose Film Flash Focus Fotografiska Frame Fuji Gear German Image Kodak Labs Lens Lights Military Model Moon Mount NASA Optic Orbit Prototype Roll Shade Shoot Space Speed Studio Surveillance Sweden Technical Transmission Victor Vision Zoom)
    }
    @puzzle[:wr] = {
      :puzzle => "PKDPLUMPZXCJ,ZUVONWSWIDEP,PJMHCEARKVII,UPOPSTOYPPLC,LJLRWOOONEIK, PXUOLERRXENU,ZNZFPPBZSPGP,PATIENTSWALL",
      :wordlist => %w(PICKUP PLUMP PUMP PULP PLOP PEEP PROP PIP POP CEILING FLOOR WALL PATIENTS DOCTORS NURSES JOHN WAYNE WIDE WEB)
    }
#     @puzzle[:halloween] = File.join(basedir, "files/halloween2009.puz")
#     @puzzle[:crnet]     = File.join(basedir, "files/crnet100306.puz")
#     @puzzle[:tmcal]     = File.join(basedir, "files/tmcal100306.puz")
#     @puzzle[:xp]        = File.join(basedir, "files/xp100306.puz")
#     @puzzle[:ydx]       = File.join(basedir, "files/ydx100515.puz")
  end

  it "" do
    ws = WordSearch.new(:wordlist => @puzzle[:wr][:wordlist])
    ws.puzzle = @puzzle[:wr][:puzzle].split(/,/).map {|row| row.split('')}
    puts ws.duplicates
    puts ws.expletives
  end
end
