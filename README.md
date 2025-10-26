# laundry_load_planner

This is an laundry load planner. 

It helps to estimate the number of loads needed to wash their clothes based on the washing machine capacity. User can select the type of wash cycle they want and it will show the total water and time required to wash.

Input -> Process -> output

Input 
- number of clothes 
  ??0 and a if else method is used to handle the error. ??0 is to prevent user from typing any irrelevant message like String or fill nothing in the textField which is null, hence the if else method is used to display an error message for user to told them "Please enter a valid number for both" 

- washing machine capacity (kg)
- type of wash cycle ( according to google search n goolge ai answer )
   - normal 
      water - 50L
      time - 45 min
   - heavy 
      water - 70L
      time - 60 min
   - quick 
      water - 30L
      time - 15 min

Process 
 According to google search also 
 - number of loads  = total number of clothes / number of clothes fit per load 
 which in here is washing machine capacity 
 (small notes: the result should not be decimal it must be a int hence ceil() is used to round up the number)
  
 - total water = loads * water
 - total time = loads * time

Output
- number of loads 
- total water needed to be used 
- total time needed to be used
- Please enter a valid number for both 

widget list used in this project are 
-AppBar
-Scaffold 
-Container
-Row
-Column
-Center
-Image.asset
-MaterialApp 
-Padding
-SizedBox
-Text
-TextField
-Dropdown
-ElevatedButton
-SnackBar
-SingleChildScrollView
-DecorationImage 
-EdgeInsets
-Border
-Navigator 
-MaterialPageRoute 

Basic Validation Approach 
-








