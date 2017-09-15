### Analysis of Music Analysis.abc
Use program to convert to a CSV file

#### Analysis using Excel
Open the analyis.csv with Excel.
Insert a column on the left titled N
Insert a series in the N column to number the notes

Insert a count column on the right of the data
using this set of formulas. Row 7 is the first data row

|count|
| --- |
|=+D7|
|=+E7+E8|
|=+E8+D9|
|and so on|

Insert a Meas column with the following formulas

|Measure|
| --- |
|=+ROUNDUP(E7/0.5,0)|
|=+ROUNDUP(E8/0.5,0)|
|and so on|

Insert the MM column with the formula that concatenates the octave, tone and time as text

| MM|
| --- |
|=CONCATENATE(TEXT(B7,"0"),C7,TEXT(D7,"00.000"))|
|=CONCATENATE(TEXT(B8,"0"),C8,TEXT(D8,"00.000")) |
|and so on|

Insert the MMM column that concatenates the MM elements on the first line of each different measure

| MMM |
| --- |
|=CONCATENATE(G7,G8,G9,G10)|
| |
| |
| |
|=CONCATENATE(G11,G12,G13,G14)|
| |
| |
| |
|and so on|



|N|oct|tone|time|count|Meas|MM|MMM|
|---|---|---|---|---|---|---|---|
|0|4|C|0.125|0.125|1|4C00.125|4C00.1253A00.1254D00.1254C00.125|
|1|3|A|0.125|0.25|1|3A00.125||
|2|4|D|0.125|0.375|1|4D00.125||
|3|4|C|0.125|0.5|1|4C00.125||
|4|4|C|0.125|0.625|2|4C00.125|4C00.1253A00.1254D00.1254C00.125|
|5|3|A|0.125|0.75|2|3A00.125||
|6|4|D|0.125|0.875|2|4D00.125||
|7|4|C|0.125|1|2|4C00.125||
|8|4|C|0.125|1.125|3|4C00.125|4C00.1254D00.1254E00.1254F00.125|
|9|4|D|0.125|1.25|3|4D00.125||
|10|4|E|0.125|1.375|3|4E00.125||
|11|4|F|0.125|1.5|3|4F00.125||
|12|4|F|0.125|1.625|4|4F00.125|4F00.1254E00.1254D00.1254C00.125|
|13|4|E|0.125|1.75|4|4E00.125||
|14|4|D|0.125|1.875|4|4D00.125||
|15|4|C|0.125|2|4|4C00.125||
|16|4|C|0.125|2.125|5|4C00.125|4C00.1253A00.1254D00.1254C00.125|
|17|3|A|0.125|2.25|5|3A00.125||
|18|4|D|0.125|2.375|5|4D00.125||
|19|4|C|0.125|2.5|5|4C00.125||
|20|4|C|0.125|2.625|6|4C00.125|4C00.1253A00.1254D00.1254C00.125|
|21|3|A|0.125|2.75|6|3A00.125||
|22|4|D|0.125|2.875|6|4D00.125||
|23|4|C|0.125|3|6|4C00.125||
|24|4|F|0.125|3.125|7|4F00.125|4F00.1254E00.1254D00.1254C00.125|
|25|4|E|0.125|3.25|7|4E00.125||
|26|4|D|0.125|3.375|7|4D00.125||
|27|4|C|0.125|3.5|7|4C00.125||
|28|4|C|0.125|3.625|8|4C00.125|4C00.1254D00.1254E00.1254F00.125|
|29|4|D|0.125|3.75|8|4D00.125||
|30|4|E|0.125|3.875|8|4E00.125||
|31|4|F|0.125|4|8|4F00.125||

Insert a new worksheet, name it wsB and copy the first worksheet data and paste special into wsB.
Select all the data and sort on column MMM.

Add column test with the formula

|test|
| --- }
| 0 |
| =+IF(H8=H7,I7,I7+1)|
| =+IF(H9=H8,I8,I8+1 |
| and so on |

Add column Theme with the formula

|Theme|
|---|
|=CONCATENATE("M",TEXT(I7,0))|
|=CONCATENATE("M",TEXT(I8,0))|
| and so on |

For display here I removed some columns.

|N|Measure|MM|MMM|test|Theme|
|---|---|---|---|---|---|
||1|4C00.125|4C00.1253A00.1254D00.1254C00.125|0|M0|
|0|2|4C00.125|4C00.1253A00.1254D00.1254C00.125|0|M0|
|4|5|4C00.125|4C00.1253A00.1254D00.1254C00.125|0|M0|
|16|6|4C00.125|4C00.1253A00.1254D00.1254C00.125|0|M0|
|20|3|4C00.125|4C00.1254D00.1254E00.1254F00.125|1|M1|
|8|8|4C00.125|4C00.1254D00.1254E00.1254F00.125|1|M1|
|28|4|4F00.125|4F00.1254E00.1254D00.1254C00.125|2|M2|
|12|7|4F00.125|4F00.1254E00.1254D00.1254C00.125|2|M2|
|24||||

Insert a new worksheet, name it wsC and copy the wsB worksheet data and paste special into wsC.
Select all the data and sort on  Measure column.
There are three differnt theme measures M0, M1, and M2.
This list the theme order to play the song of 8 measures total.

|N|Measure|MMM|test|Theme|
|---|---|---|---|---|
|0|1|4C00.1253A00.1254D00.1254C00.125|0|M0|
|4|2|4C00.1253A00.1254D00.1254C00.125|0|M0|
|8|3|4C00.1254D00.1254E00.1254F00.125|1|M1|
|12|4|4F00.1254E00.1254D00.1254C00.125|2|M2|
|16|5|4C00.1253A00.1254D00.1254C00.125|0|M0|
|20|6|4C00.1253A00.1254D00.1254C00.125|0|M0|
|24|7|4F00.1254E00.1254D00.1254C00.125|2|M2|
|28|8|4C00.1254D00.1254E00.1254F00.125|1|M1|

#### Just for fun

[GOT]( https://drive.google.com/open?id=0BxMOEsGLzwfeak1tUkZNM2pEVjA)




