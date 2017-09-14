#ABCtoCSV1.rb
#14Sep2017

# Specify the path and in and out filenames
# note path in fname uses / not \
inname="C:/Users/jj/Documents/soundPi/abctocsvmaster/testscale.abc"
outfname="C:/Users/jj/Documents/soundPi/abctocsvmaster/testscale.csv"
# specify which note of chord to use as am index 0.n
chrdindex=0
# set up lists of flats and sharps
flatlist=""
sharplist=""

# setup array to hold SP output
tune=[]
# start with the SP headers
tune.push("octave,tone,time")
# set up hdrinfo hash
hdrinfo={time: 1.0,flatlist: flatlist,sharplist: sharplist}
tune.push(hdrinfo)
puts tune
######################
# define strings containing sets of characters
#stnote ="abcdefgABCDEFGzZ"
## use set strings to test set membership
def testset(w,set)
  if (w==nil)then return 0 end
  if (set==nil)then return 0 end
  return set.include? w
end
############################
# the parseBlack function
def parseBlack(flatlist,sharplist, note, modifier)
  note=note[0]
  if modifier=="=" then return note end
  if modifier == "_" then return note+"b" end
  if modifier == "^" then return note+"s" end
  if flatlist.length>0
    if testset(note,flatlist)
      return note+"b"
    end
    #    return note
  end
  if sharplist.length>0
    if testset(note,sharplist)
      return note+"s"
    end
    #    return note
  end
  return note
end
#############################

def parseFraction(hdr)
  #  puts "hdr=",hdr
  a=hdr.split("/")
  if(a.length<2)
    # puts a[0].to_f
    return a[0].to_f
  else
    b=a[0].to_f
    c=a[1].to_f
    return a[0].to_f /  a[1].to_f
  end
end
#####################

#def processnote(tune,note)
# if note==nil then return end
#  puts "note= ",note
#  a=tune.pop
#  tune.push(note)
#  tune.push(a)
#end
def processnote(tune,note)
  if note==nil then return end
  hdrinfo=tune.pop
  a=hdrinfo[:time]
  #puts "note= ",note
  octave=4.0
  tone="r"
  time=a
  blacknote=""
  divflg=0
  # step thru the note string
  i=0
  loop do
    #puts note[i]
    #look for ABC sharp, flat or natural
    if testset(note[i],"^=_")
      blacknote=note[i]
      
    end
    if testset(note[i],"ABCDEFGR")
      #tone=note[i]+blacknote
      tone=parseBlack(hdrinfo[:flatlist],hdrinfo[:sharplist], note[i], blacknote)
      octave=4.0
    end
    if testset(note[i],"abcdefgr")
      #tone=note[i]+blacknote
      tone=parseBlack(hdrinfo[:flatlist],hdrinfo[:sharplist], note[i], blacknote)
      octave=5.0
    end
    if note[i]=="/" then divflg=1 end
    if testset(note[i],"0123456789")
      note1=note[i..note.length-1]
      #puts note1
      if divflg>0
        time=time/note1.to_f
      else
        time=time*note1.to_f
      end
      break
    end
    if note[i]=="'" then octave+=1 end
    if note[i]=="," then octave-=1 end
    
    i+=1
    break if i>=note.length
  end
  tune.push(octave.to_s+","+tone+","+time.to_s)
  #tune.push(a)
  tune.push(hdrinfo)
  #puts tune
end


#def processchd(tune,chd)
#  puts "chd= ",chd
#  a=tune.pop
#  tune.push(chd)
#  tune.push(a)
#end
def processchd(tune,sss,n)
  chd=[]
  #puts "sss= ",sss
  ## need to add the case of digit or /digit(s) after "]"
  sss=sss.chop
  #puts "sss= ",sss
  sss.reverse!
  sss=sss.chop
  sss.reverse!
  #puts "sss= ",sss
  b=0
  while b<sss.length
    ####### see if note starts with a sharp, flat or natural symbol
    startflat=""
    if testset(sss[b],"^_=")
      #puts "SF=",sss[b],b
      startflat=sss[b]
      b+=1
    end
    #####look for individual notes
    ept=0
    if testset(sss[b],"abcdefgABCDEFGzZ")
      #puts "looknote",b,sss[b]
      start=b
      ept=b+1
      loop do
        break if testset(sss[ept],"^_=")
        break if testset(sss[ept],"abcdefgABCDEFGzZ")
        break if sss[ept]=="|"
        ept=ept+1
      end
      ending=ept-1
      b=ending #+1
      #puts start,ending,b,sss[start..ending],sss[b]
      chd.push( sss[start..ending])
      #puts chd
    end
    ###
    b+=1
    break if b>=sss.length
  end
  processnote(tune,chd[n])
end

def processheader(tune,hdr)
  puts "hdr= ",hdr
  case hdr[0]
  when "L"
    hdrinfo=tune.pop
    hdr=hdr[2..hdr.length]
    hdrinfo[:time]=parseFraction(hdr)
    tune.push(hdrinfo)
    puts tune
  end
end

######################
ggg=""
File.open(inname, "r") do |fh|# open and write to a file with ruby
  sss=""
  while sss!= nil
    #sss=fh.gets
    #puts "sst",sss
    ####### Look for Header info Letter followed by a :
    b=0
    while b<sss.length
      if(b<1)
        if(sss[1]==":") #special commands
          processheader(tune,sss)
          b=sss.length+1 # skip to end
          break
        end
      end
      #puts "bhdr=",b
      if sss[b]=="%" then break end
      #if sss[b]=="|"
      #break if sss[b]=="]"
      #if sss[b]=="|" then break end
      #if sss[b]=="%" then break end
      
      ##### look for chords
      ept=0
      if(sss[b]=="[")
        start=b
        ept=b+1
        loop do
          # puts "lll=",sss[start..ept]
          break if sss[ept]=="]"
          break if sss[ept]=="|"
          ept=ept+1
        end
        ending=ept
        ## need to look for "/0123456789 " after the "]"
        b=ending+1
        processchd(tune,sss[start..ending],chrdindex)
      end
      ####### see if note starts with a sharp, flat or natural symbol
      startflat=""
      if testset(sss[b],"^_=")
        #puts "SF=",sss[b],b
        startflat=sss[b]
        b+=1
      end
      #####look for individual notes
      ept=0
      if testset(sss[b],"abcdefgABCDEFGzZ")
        #puts "looknote",b,sss[b]
        start=b
        ept=b+1
        loop do
          break if testset(sss[ept],"^_=")
          break if testset(sss[ept],"abcdefgABCDEFGzZ")
          break if sss[ept]=="|"
          ept=ept+1
        end
        ending=ept-1
        b=ending #+1
        #K:Bb
        #B2 A B G2 |B2 A B G2 |B2 A B G2 |B2 A B G2 |
        
        #puts start,ending,b,sss[start..ending],sss[b]
        processnote(tune,startflat+sss[start..ending])
      end
      b+=1
      #puts "b=",b
    end
    sss=fh.gets
    if(sss != nil) then sss=sss.chomp end
    b=0
  end
end
puts "Writing to file"
tune.pop # remove the header
open(outfname, 'w') { |f|
  tune.each {|x| f.puts x }
  #f.puts "octave,tone,time"
}
i=0
while i<tune.length
  #  puts tune[i]
  i+=1
end


