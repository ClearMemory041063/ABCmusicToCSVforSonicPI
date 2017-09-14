# playanalysis.rb
# 14 Sep 2017
# a song for Sonic PI
# use the result of the analysis to play the three theme measures
# and produce an 8 measure song

#################################################

# setup tempo variable
tempo=2.5 #slower

# select the Sonic Pi synthesiser to use as voice
use_synth :fm
#use_synth :saw
#use_synth :prophet
#use_synth :dsaw
#use_synth :tb303
#use_synth :pulse
#################################################
def playnote(octave,tone,time,tempo)
  #  play :E4
  #  puts octave,tone,time
  thenote=tone+octave.to_s
  #  puts thenote
  puts thenote.intern
  play thenote.intern
  # play :C4
  sleep time*tempo
end
def playM0(tempo)
  puts "M0"
  #4C00.1253A00.1254D00.1254C00.125
  playnote(4,"C",0.125,tempo)
  playnote(3,"A",0.125,tempo)
  playnote(4,"D",0.125,tempo)
  playnote(4,"C",0.125,tempo)
end
def playM1(tempo)
  puts "M1"
  #4C00.1254D00.1254E00.1254F00.125
  playnote(4,"C",0.125,tempo)
  playnote(4,"D",0.125,tempo)
  playnote(4,"E",0.125,tempo)
  playnote(4,"F",0.125,tempo)
end
def playM2(tempo)
  puts "M0"
  #4F00.1254E00.1254D00.1254C00.125
  playnote(4,"F",0.125,tempo)
  playnote(4,"E",0.125,tempo)
  playnote(4,"D",0.125,tempo)
  playnote(4,"C",0.125,tempo)
  
end


# set up a live loop to play the song
live_loop :bar1 do
  #  play :E4
  playM0(tempo)
  playM0(tempo)
  playM1(tempo)
  playM2(tempo)
  playM0(tempo)
  playM0(tempo)
  playM2(tempo)
  playM1(tempo)
  
  # tick_reset #causes it to play again
  sleep 0.1
  stop
end




