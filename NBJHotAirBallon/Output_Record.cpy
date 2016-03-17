      * Output_Record
      *Replace prefix with C and N for Connecticut or New York
       01  Prefix_Record.
           05  Prefix_State                   PIC X(2).
           05  Prefix_Location                PIC X(15).
           05  Prefix_Number_Balloons         PIC 9(1).
           05  Prefix_Number_Prop_Tanks       PIC 9(2).
           05  Prefix_Number_Pilots           PIC 9(1).
           05  Prefix_Number_Oth_Empl         PIC 9(1).
           05  Prefix_Total_Daily_Emp_Exp     PIC 9(4)V9(2).
