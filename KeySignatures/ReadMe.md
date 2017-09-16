#### Key Signatures
Music is composed in a key such as G major etc.
The sheet music shows the sharp and flat note just to the right of the clef.
Keys in ABC notation are described in this tutorial

[ABC tutorial]( http://www.lesession.co.uk/abc/abc_notation.htm#k_field)
from the tutorial
```
Key signatures (the K: field) 
The key signature is specified by the K: field eg
K:G 
So our G major scale can now be written as 
K:G
GABcdefg 
And our G minor scale as 
K:Gm
GABcdefg 
Major keys are assumed, but can be specified by maj eg 
K:Gmaj 
Minor keys are shown by m or min, eg 
K:Gm 
or
K:Gmin. 
In the key signature field sharps are noted by the hash character # and flats by the letter b, eg 
B flat :	K:Bb
C sharp :	K:C#
```
#### Need to add this to the ABCtoCSV.rb program.
#### A function to fill in the sharplist and flatlist given the key signature
See the KeyFunction5.rb for the code.
To invoke the function use code like this:

```
list=getkey(:Eb3,:major)
puts "Sharps=",list[0],"Flats=",list[1]
list=getkey(:Gb3,:major)
puts "Sharps=",list[0],"Flats=",list[1]
list=getkey(:G3,:major)
puts "Sharps=",list[0],"Flats=",list[1]
```
This produces output in the right window pane of Sonic PI:

```
{run: 278, time: 0.0}
 ?? :Eb3 :major
 ?? "Sharps=" "" "Flats=" "EAB"
 ?? :Gb3 :major
 ?? "Sharps=" "FGACD" "Flats=" ""
 ?? :G3 :major
 ?? "Sharps=" "F" "Flats=" "G"
```
#### Not yet implemented in the ABCtoCSV code
