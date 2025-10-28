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
- if (clothes <=0 || capacity <=0) Please enter a valid number for both
- if (capacity > 28) shows Max capacity of washing machine is 28kg .
- if (clothes > 40) shows Max no. of clothes is 40 pieces.

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

Basic Validation Approach 
- Show a snackbar message  if the textfield is empty
- Show a snackbar message if the textfield has invalid input
- input is converted using int.tryParse(), to prevent apps crash if user enter 0
- Ensure machine capacity will never be zero to avoid arithmetic error. 
Reset button to reset everything back to ensure new data entry for the next calculation.


![WhatsApp Image 2025-10-26 at 17 12 24_44daa468](https://github.com/user-attachments/assets/db4d77c9-f7f9-4770-ac2f-0e4f906b7eb7) 
![WhatsApp Image 2025-10-26 at 17 12 37_3b8b2517](https://github.com/user-attachments/assets/7eb7a28d-c75d-45fe-a674-08f135ac38da)
![WhatsApp Image 2025-10-26 at 17 13 05_b298ecf5](https://github.com/user-attachments/assets/d2cd73b0-45da-4686-8f25-4a018283bf14)










