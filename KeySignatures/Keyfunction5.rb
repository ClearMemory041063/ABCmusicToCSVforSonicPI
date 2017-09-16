# Keyfunction5.rb
# 16 sep 2017
#
# Purpose
# Given a key signature
# fills out a list of sharps and flats


############################
def numto_noteS(num)
  # upper case are sharps
  nm1=["c","C","d","D","e","f","F","g","G","a","A","b"]
  oct=num/12
  n= num-oct*12
  #  puts num,oct-1,n,nm1[n]+(oct-1).to_s
  return nm1[n]
end
############################
def numto_noteF(num)
  #  upper case are flats
  nm2=["c","D","d","E","e","f","G","g","A","a","B","b"]
  oct=num/12
  n= num-oct*12
  #  puts num,oct-1,n,nm2[n]+(oct-1).to_s
  return nm2[n]
end
############################
# if the list contains deplicate letters clear the list
# if not cleared remove lower case and spaces
def trimlist(list)
  i=0
  while i<list.length-1
    j=i+1
    tst=list[i].upcase
    while j<list.length-1
      if tst==list[j].upcase
        list=""
        break
      end
      j+=1
    end
    i+=1
  end
  # remove lower case and spaces
  list= list.gsub(/[^[:upper:]]+/, "")
end
############################
# given the tonic :G and the scale type :major
# return an array contain the sharplist string and the flatlist string
def getkey(tonic,name)
  puts tonic,name
  #  s=scale(:Eb3,:major)
  s=scale(tonic,name)
  #  puts s
  sharplist=""
  flatlist=""
  i=0
  while i<s.length-1
    sharplist+=numto_noteS(s[i])
    flatlist+=numto_noteF(s[i])
    i+=1
  end
  # puts sharplist
  # puts flatlist
  sharplist=trimlist(sharplist)
  flatlist=trimlist(flatlist)
  
  #  puts "SL=",sharplist
  #  puts "FL=",flatlist
  return [sharplist,flatlist]
end

############################
# Example usage
############################

list=getkey(:Eb3,:major)
puts "Sharps=",list[0],"Flats=",list[1]

list=getkey(:Gb3,:major)
puts "Sharps=",list[0],"Flats=",list[1]

list=getkey(:G3,:major)
puts "Sharps=",list[0],"Flats=",list[1]
