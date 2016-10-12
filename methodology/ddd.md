##Data driven development

http://stackoverflow.com/a/1065657/532008

Data driven progamming is a programming model where the data itself controls the flow of the program and not the program logic. It is a model where you control the flow by offering different data sets to the program where the program logic is some generic form of flow or of state-changes.

For example if you have program that has four states: UP - DOWN - STOP - START

You can control this program by offering input (data) that represents the states:

 - set1: DOWN - STOP - START - STOP - UP   - STOP
 -  set2: UP - DOWN - UP - DOWN

The program code stays the same but data set (which is not of a dynamic input type  but statically given to the computer) controls the flow.
