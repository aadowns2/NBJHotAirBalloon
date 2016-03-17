      $set ilusing "System.Diagnostics".
       
       Identification Division.
           Program-ID. NBJHotAirBalloon.
               Author. Anthony Downs.
               Installation.
               Date-Written. 03/15/2016.
               Date-Compiled.
               Security.
               
       Environment Division.
           Configuration Section.
               Special-Names.
               
           Input-Output Section.
               File-Control.
                   Select ConnFile assign to ConnData
                       File Status is File_Status
                       Organization is Line Sequential.
                       
                   Select NewYorkFile assign to NewYorkData
                       File Status is File_Status
                       Organization is Line Sequential. 
               
               I-O-Control.
               
       Data Division.
           File Section.
           FD  ConnFile
               Record Contains 30 Characters.
               COPY Output_Record REPLACING LEADING ==Prefix== BY ==C==.
               
           FD NewYorkFile
              Record Contains 50 Characters.
              COPY Output_Record REPLACING LEADING ==Prefix== BY ==N==.
           
           Working-Storage Section.
           *>Constants for price schedule and misc costs
           78  Child                               value 30.   *>Child age is under 12
           78  Adult                               value 75.   *>Adult age is 12 through 61
           78  Senior                              value 45.   *>Senior age is 62 or over
           78  PropaneCost                         value 35.   *>Price per tank of propane/one tank per trip
           
           *>Switches for end of file, counters, other constants
           01  More-Data               PIC X(1)    value 'Y'.
               88  No-More-Data                    value 'N'.
           01  Misc_Variables.
               05  Counters            PIC 9(2).
               05  File_Status         PIC 9(2).
           78  Minimum_to_Launch                   value 6.
       
                 
           Local-Storage Section.
           
           Linkage Section.
           
           Report Section.
           
       Procedure Division.
           INITIALIZE Misc_Variables.
           
           100-Initialization.
               OPEN OUTPUT ConnFile PERFORM 500-Validation
               OPEN OUTPUT NewYorkFile PERFORM 500-Validation
                   
               PERFORM 200-Get-UserInput
               
               Stop "Press <CR> to End Program"
               Stop Run.
           
           200-Get-UserInput.
               DISPLAY "Please Enter a Valid Location and State Code"
                   DISPLAY "State Code " WITH NO ADVANCING ACCEPT C_State
                   DISPLAY "Location " WITH NO ADVANCING ACCEPT C_Location
                   
                   PERFORM 500-Validation.
                       
           300-Calculations.
           
           400-Write-Records.
               Write C_Record
               WRITE N_Record.
           
           500-Validation.
               INVOKE TYPE Debug::WriteLine(C_State & C_Location).
           
       End Program NBJHotAirBalloon.
      