### Translate music files in ABC format to a CSV file for use by Sonic PI or for analysis
#### What are ABC files and how to use them?
#### runABC
runABC is a program to edit, view the musical score, print the musical score and play ABC files in Midi format.
It can be found at: [runABC]( http://ifdo.ca/~seymour/runabc/top.html)

A tutorial is located here: [Tutorial](http://www.lesession.co.uk/abc/abc_notation.htm)

and here: [Using ABCplus]( http://natura.di.uminho.pt/~jj/ipm/abcplus_en.pdf)

[project]( http://abc.sourceforge.net/)
#### The ABCtoCSV.rb Program
The ABCtoCSV.rb Program is written in the Ruby computer language and the examples given here were run on a Windows 10 machine using the Sonic PI software.
Sonic PI software in several machine flavors can be found at:

[Sonic PI]( http://sonic-pi.net/)
The ABCtoCSV.rb Program can be loaded into the Sonic Pi software or opened with a text editor such as Notepad.
#### Editing the ABCtoCSV.rb Program 
The program needs the path and filenames for input and output files.
The  sharplist and flatlist strings need to list the notes in both lower and upper case to reflect the musical key. I hope to address this in the future so they are filled in by information contained in the ABC file header.

```
#ABCtoCSV1.rb
#14Sep2017
# Specify the path and in and out filenames
# note path in fname uses / not \
inname="C:/Users/jj/Documents/soundPi/abctocsvmaster/testscale.abc"
outfname="C:/Users/jj/Documents/soundPi/abctocsvmaster/testscale1.csv"
# specify which note of chord to use as am index 0.n
chrdindex=0
# set up lists of flats and sharps
flatlist="eE"
sharplist="Aa"
```

##### An ABC file example TestScale.ABC

```
X: 1
T: Scale Test
C: Joe
M: 2/4
L: 1/8
K: G
C,,D,,E,,F,,|G,,A,,B,,C,|
D,E,F,G,|A,B,CD|EFGA|Bcde|
fgab|c'd'e'f'|g'a'b'c''|
d''e''f''g''|
```
##### CSV file produced from TestScale.ABC
testscale.csv with sharplist="" and flatlist=""

```
octave,tone,time
2.0,C,0.125
2.0,D,0.125
2.0,E,0.125
2.0,F,0.125
2.0,G,0.125
2.0,A,0.125
2.0,B,0.125
3.0,C,0.125
3.0,D,0.125
3.0,E,0.125
3.0,F,0.125
3.0,G,0.125
3.0,A,0.125
3.0,B,0.125
4.0,C,0.125
4.0,D,0.125
4.0,E,0.125
4.0,F,0.125
4.0,G,0.125
4.0,A,0.125
4.0,B,0.125
5.0,c,0.125
5.0,d,0.125
5.0,e,0.125
5.0,f,0.125
5.0,g,0.125
5.0,a,0.125
5.0,b,0.125
6.0,c,0.125
6.0,d,0.125
6.0,e,0.125
6.0,f,0.125
6.0,g,0.125
6.0,a,0.125
6.0,b,0.125
7.0,c,0.125
7.0,d,0.125
7.0,e,0.125
7.0,f,0.125
7.0,g,0.125
```
##### CSV file produced from TestScale.ABC
testscale1.csv with flatlist="eE" and sharplist="Aa"

```
octave,tone,time
2.0,C,0.125
2.0,D,0.125
2.0,Eb,0.125
2.0,F,0.125
2.0,G,0.125
2.0,As,0.125
2.0,B,0.125
3.0,C,0.125
3.0,D,0.125
3.0,Eb,0.125
3.0,F,0.125
3.0,G,0.125
3.0,As,0.125
3.0,B,0.125
4.0,C,0.125
4.0,D,0.125
4.0,Eb,0.125
4.0,F,0.125
4.0,G,0.125
4.0,As,0.125
4.0,B,0.125
5.0,c,0.125
5.0,d,0.125
5.0,eb,0.125
5.0,f,0.125
5.0,g,0.125
5.0,as,0.125
5.0,b,0.125
6.0,c,0.125
6.0,d,0.125
6.0,eb,0.125
6.0,f,0.125
6.0,g,0.125
6.0,as,0.125
6.0,b,0.125
7.0,c,0.125
7.0,d,0.125
7.0,eb,0.125
7.0,f,0.125
7.0,g,0.125
```
#### Where to Find Some Music Written in ABC format
[lotro]( http://www.lotro-abc.com/)

[nottingham]( http://abc.sourceforge.net/NMD/)

[abc notation]( http://abcnotation.com/tunes )

#### How to Play Music on the Sonic PI using the CSV files
Using synthesiser voices:

[SonicPISongFromCSV]( https://github.com/ClearMemory041063/SonicPiSongFromCSV)

Using Orchestra voices:

[SonicPiWAVOrchestra]( https://github.com/ClearMemory041063/SonicPiWavOrchestra)

Here is a link to an MP2 file recording of music produced using CSV files:
( Use the download button located in the upper right of the page )

[Ode to Joy 4 voices]( https://drive.google.com/file/d/0BxMOEsGLzwfeY01RZU1ISEJvNnc/view?usp=sharing)
 
#### Analysis of Music Using Excel
The CSV files can be opened using Excel or other spreadsheet programs. The allows editing id you save the edited version as a CSV file.
Insert a coulmn on the left and insert a series that numbers the notes.
In a new column insert running addition of the time column.
If you divide by 1 for 4/4 time or 0.75 for 3/4 time, and round down the results will nuber the musical measures (bars).
If you concatenate as text, the octave, tone and time values in each measure,  then copy the whole spreadsheet contents and paste special in a new sheet ( this removes all the math),
you can sort the new sheet on the concatenated values and determine which measures are duplicates. Label each group, copy everything and paste special in a new sheet.
Sort on the note numbers, and then tou can use the measure labels to determine the oder of play of the measures. So instead of having all the notes of the entire song, you could use the notes in each unique measure, and a sequence of measures to play to produce the song.
#### State of the ABC to CSV program
It doesn't translate a lot of things that ABC notation can do, it's just a starting point.
You may need to edit the ABC file to make it work.
I hope to add to the capabilites .





