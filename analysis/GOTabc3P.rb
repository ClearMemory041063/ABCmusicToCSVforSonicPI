# GOTabc3part.txt
# Live loop parameters
#tempo
# use st value to control the tempo
x=177./60
puts x, 3.0/x

st=2.0 #slow tempo
st=1.5 #medium tempo
st=1.3 #fast tempo
# change keys by integer halftones +-
key1=8.0
# integer +- adds halftone to note number
m1=0.0
m2=0.025
m3=0.0
m4=0.0
# integer+- shifts octaves
octshift1 = 0.0
octshift2 = 0.0
octshift3 = 0.0
octshift4 = 0.0
# Amplitude values for each voice
amp1=1.5
amp2=1.0
amp3=1.0
amp4=1.0
# Pan values for each voice
pan1 =-1.0
pan2 =-1.0
pan3 =1.0
pan4 =-0.5

#################################

require 'csv'
songfile1="c:/home/songs/got1A.csv"#read the csv file into an array of hashes
#read the csv file into an array of hashes
tune1 = Array.new
CSV.foreach(songfile1, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  tune1 << row.to_hash
end
songfile2="c:/home/songs/got2A.csv"#read the csv file into an array of hashes
#read the csv file into an array of hashes
tune2 = Array.new
CSV.foreach(songfile2, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  tune2 << row.to_hash
end
songfile3="c:/home/songs/got3A.csv"#read the csv file into an array of hashes
#read the csv file into an array of hashes
tune3 = Array.new
CSV.foreach(songfile3, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  tune3 << row.to_hash
end
#tune1=tune1.ring #convert to a ring datastructure
#tune2=tune2.ring
#tune3=tune3.ring

# you will need to download the wav files from
# http://virtualplaying.com
# unzip and copy selected files to a folder defined by
# the samps variable below

# use samps to point ot the folder where the wav files
# are located
samps = "c:/home/pi/samples/"
# setup several wav files using the #
# so you can live loop by deleting or adding the hashtags
samps1=samps+"trumpets-sus-e4.wav"
#samps1=samps+"tuba-sus-e2-PB-loop.wav"
samps1=samps+"cello-c4.wav"
samps4=samps+"violin-e4.wav"
samps3=samps+"tuba-sus-e2.wav"
#samps3=samps+"oboe-e4-pb-loop.wav"


# The hash data structure that returns the note
# number
rates = {C:0.0,
         CS:1.0,
         DB:1.0,
         D:2.0,
         DS:3.0,
         EB:3.0,
         E:4.0,
         F:5.0,
         FS:6.0,
         GB:6.0,
         G:7.0,
         GS:8.0,
         AB:8.0,
         A:9.0,
         AS:10.0,
         BB:10.0,
         B:11.0,
         R:-100.0
         }


# one way to play wave files
halftone=Math.log(2.0)/12.0
octtone=Math.log(2.0)

define :playwavnote do |sampsn,octv,pitch,time,key,m,amp=1.0,pan=0.0|
  rate1=rates[pitch.upcase.intern]
  puts "ratenum=",rate1,key
  if(rate1< -99)
    sleep st*time.to_f
  else
    rate1=Math.exp((-4.0+rate1+m)*halftone+key*halftone+octv*octtone)
    puts "rate1=",rate1
    sample sampsn,
      rate:rate1,
      attack: 0.1,
      sustain: st*time.to_f*0.5,
      release: st*time.to_f*2.0/3.0,amp: amp ,pan: pan
sleep st*time.to_f
end
end

barcnt=0.0 #totals note length in a measure
barcount= 0 #counts measures
# set up a live loop to play the song
live_loop :bar1 do
  puts look
  note=tune1.tick
  unless note==nil
    puts note
    puts "key1=",key1
    puts note[:tone].intern
    playwavnote samps1,note[:octave]-4.0+octshift1,
      note[:tone],note[:time], key1,m1,amp1,pan1
    #test for a measure (barcount)
    # add up note times
    ## Caution don't use if == because of addition imprecision
    barcnt=barcnt+note[:time]
    puts "barcnt=",barcnt
    if(barcnt>=0.75) # 1.0 for 4:4 time 4/4=1 0.75 =3/4 or 3:4 time
      barcnt=0.0
      barcount += 1
      puts "barcount= ",barcount
    end
  else #end of song seen
    # tick_reset #causes it to play again
    barcount=0
    key1+=4.0  # halftones to shift after each phrase
    # if(key1>11.0)then key1=0.0 end
    if(key1<11.0)then tick_reset else stop end
    sleep 0.1
  end
end

live_loop :bar2 do
  sync :bar1
  note2=tune1.tick
  unless note2==nil
    puts note2
    puts "key1=",key1
    playwavnote samps1,note2[:octave]-4.0+octshift2,
      note2[:tone],note2[:time], key1,m2,amp2,pan2
  else #end of song seen
    #tick_reset #causes it to play again
    if(key1<11.0)then tick_reset end
    sleep 0.1
  end
end

live_loop :bar3 do
  sync :bar1
  note1=tune2.tick
  unless note1==nil
    puts note1
    puts "key1=",key1
    playwavnote samps1,note1[:octave]-4.0+octshift3,
      note1[:tone],note1[:time], key1,m3,amp3,pan3
  else #end of song seen
    # tick_reset #causes it to play again
    if(key1<11.0)then tick_reset end
    sleep 0.1
  end
end

live_loop :bar4 do
  sync :bar1
  note4=tune3.tick
  unless note4==nil
    puts note4
    puts "key1=",key1
    playwavnote samps1,note4[:octave]-4.0+octshift4,
      note4[:tone],note4[:time], key1,m4,amp4,pan4
  else #end of song seen
    # tick_reset #causes it to play again
    if(key1<11.0)then tick_reset end
    sleep 0.1
  end
end
