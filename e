read the claude.,d and the architecture.md and the instructions.md (those are for the previous commit work , so i might say do something that is said to not do in there)
  
  what i want you to do is 
  make this desktop-reservations-management app using the endpoints in this place `/home/dahmane/Desktop/Coding/PFE/Dalti_Reservation-backend/Not_related_to_the_code/endpoint_tests/` (only read the result files 
  unless they dont have what you need , then the .http files contain all the endpoints)
  
  do this , 
  
  -when a user opend the app , he must login using google  (but lets not implement that for now and just use a jwt token variable directly put in the code ) , just a "continue as ...." button for now
  -then when clicking to continue , the user is taken to screen2 , in this screen the user is getting the option to what to manage (a user might own 2 orgs and a staff in a third organization , so he must choose)
  - when he chooses , the choice is registered and he gets to the home page screen {the home page scren has an expandable side bar (does not compeltely vanish , just narrows) which contains[queues section with a
  queue_name button that expands to (today , history , register a walk-in, accept future reservations )]} , org button that expands to (edit organization , statistics)  , and at the bottom of the side bar is  a
  logout button , and a settings button , and a "handle something else" button 
  
  you do not have to make the screens of the buttons of the side bar yet , just implement them with empty screens with a text in the middle saying what screen is this
  
  you have to understand the db model of the backend
  keep the code clean and minimal-ui(i dont need ui to save the context for now)
  if you have questions ask , if you want to flag me or note something i'd be glad 
─────────────────────────────────────────────────────────────────────────────────────