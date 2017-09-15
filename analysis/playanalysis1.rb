# playanalysis1.rb
# 14 Sep 2017
# a song for Sonic PI
# use the result of the analysis to play the three theme measures
# and produce an 8 measure song

## changes from playanalysis.rb
# use define instead of def
# change rythmn of measure M0
# add a new measure M3 and extend the song to 24 measures
###########
# using define :function_name do |args,...| makes
# global variables tempo and octave_shift accessable
# where
# using def function_name(args,...) restricts the access
#################################################

# setup tempo variable
tempo=2.5
# shift octave
octave_shift = 1

# select the Sonic Pi synthesiser to use as voice
use_synth :fm
#use_synth :saw
#use_synth :prophet
#use_synth :dsaw
#use_synth :tb303
#use_synth :pulse
#################################################
define :playnote do |octave,tone,time|
  #  play :E4
  #  puts octave,tone,time
  thenote=tone+(octave+octave_shift).to_s
  #  puts thenote
  puts thenote.intern
  play thenote.intern
  # play :C4
  sleep time*tempo
end
define :playM0 do #||#(tempo)
  puts "M0"
  #4C00.1253A00.1254D00.1254C00.125
  playnote 4,"C",0.125
  playnote 3,"A",0.0625 # changed from0.125
  playnote 4,"D",0.0625 # changed from0.125
  playnote 4,"C",0.125
end
define :playM1 do||#(tempo)
    puts "M1"
  #4C00.1254D00.1254E00.1254F00.125
  playnote 4,"C" ,0.125
  playnote 4,"D" ,0.125
  playnote 4,"E" ,0.125
  playnote 4,"F" ,0.125
end
define :playM2 do || #(tempo)
    puts "M0"
  #4F00.1254E00.1254D00.1254C00.125
  playnote 4,"F",0.125
  playnote 4,"E",0.125
  playnote 4,"D",0.125
  playnote 4,"C",0.125
  
end
define :playM3 do #||#(tempo)
  puts "M3"
  #4C00.1253A00.1254D00.1254C00.125
  playnote 4,"C",0.125
  playnote 4,"D",0.0625 # changed from0.125
  playnote 3,"A",0.0625 # changed from0.125
  playnote 4,"C",0.125
end

# set up a live loop to play the song
live_loop :bar1 do
  #  play :E4
  playM0
  playM0
  playM1
  playM2
  playM0
  playM0
  playM2
  playM1
  
  playM3
  playM3
  playM1
  playM2
  playM3
  playM3
  playM2
  playM1
  
  playM0
  playM3
  playM1
  playM2
  playM2
  playM1
  playM0
  playM3
  
  
  
  sleep 0.1
  stop
end




