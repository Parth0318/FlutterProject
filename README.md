# t_store

┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
|                                                                                                  |
|                                   WELCOME TO [T_Store]                                           |  
|                                                                                                  |
|    Greetings,                                                                                    |
|                                                                                                  |
|    We extend our sincere appreciation for your interest in [T_Store]. This repository            |
|    houses a robust e-commerce solution developed using the Flutter framework. Every line         |
|    of code here reflects our commitment to quality, efficiency, and scalability.                 |
|                                                                                                  |
|    We're dedicated to continuous improvement and we welcome feedback to make this                |
|    solution even more industry-leading. Dive in, explore, and let's innovate together.           |
|                                                                                                  |
|    Regards,                                                                                      |
|    Coding with T                                                                                 |
|                                                                                                  |
└──────────────────────────────────────────────────────────────────────────────────────────────────┘






# --------------  INITIALIZATION  ---------------- #

┌─── GETTING STARTED ──────────────────────────────────────────────────────────────────────────────┐
|                                                                                                  |
|    1️⃣ Initialize Packages: Begin by fetching all necessary packages.                             |
|       Execute the following in your terminal: `flutter pub get`.                                 |
|                                                                                                  |
|    2️⃣ SDK Version Check: Ensure you have the correct Dart SDK version.                           |
|       [Note]: `The current Dart SDK version is 2.18.6`.                                          |
|       [Error]: Might be `t_store requires SDK version >=3.0.5 <4.0.0`.                           |
|       This indicates version solving has failed due to a mismatch.                               |
|       [Solution]: Upgrade Flutter - To rectify SDK version mismatches and stay updated,          |
|       run: `flutter upgrade`. This command will fetch and install all the required updates.      |
|                                                                                                  |
|    3️⃣ Lastly, ensure all dependencies are properly set.                                          |
|       Execute `flutter pub get`.                                                                 |
|       On successful completion, you're primed and ready to launch the application.               |
|                                                                                                  |
└──────────────────────────────────────────────────────────────────────────────────────────────────┘


# --------------  ERRORS  ---------------- #


## ** -- DESIGN ERRORS -- **
This contains all the possible errors that can occur while designing the app.

┌─── File ──────────────── Function ─────── Detail ────────────────────────────────────────────────────────────────────────────┐
| 1. home.dart          |  Stack        |   [ERROR]: size.isFinite': is not true.in Stack
|                       |               |   [SOLUTION]: You added CustomShapes but Stack currently don't have
|                       |               |   any space so simply add something in Stack or wrap it inside
|                       |               |   SizedBox with width and height and error will be gone.
|                       |               |   
| 2. THelperFunctions   | isDarkMode()  |   [ERROR]: Theme is not switching when changing from Light to Dark
|                       |               |   or vise vera.
|                       |               |   [SOLUTION]: You have multiple context with same name so, pass the
|                       |               |   actual build context to -> THelperFunctions.isDarkMode(context). 
|                       |               |   
|                       |               |   
|                       |               |   
|                       |               |   
|                       |               |   
|                       |               |   
|                       |               |   
|                       |               |   
|                       |               |   
|                       |               |   
└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘



## ** -- PACKAGES ERRORS -- **
This contains all the possible errors that can occur while importing or using packages.

┌── Package ────────────── Detail ─────────────────────────────────────────────────────────────────┐
|                       |  
|                       |  
|                       |  
|                       |
|                       |    
|                       |      
|                       |   
|                       |  
|                       |
|                       |
|                       |  
└──────────────────────────────────────────────────────────────────────────────────────────────────┘

