
# Terminal-Battleships Application (Ruby)

## Description
Terminal-Battleships is a game created following the ruleset of the popular strategy game 'Battleships'. Players take turns selecting an alpha-numeric position on a game board, with the aim being to find the locations of the enemies ships. A winner is determined when all of the opponents ships have been destroyed.

## Motivations
The motivation behind the project was to create an enjoyable application, whilst challenging current programming knowledge. The aim was to create an app, that was challenging, enjoyable and realistic within the allotted time frame. 
Due to the restricted time, the application still has ample potential for further development. 

## Getting Started

  

1. Install Ruby on your local machine

  

2. Download the repository, and unzip the files

  

3. Using the terminal, locate the directory containing the files

  

## Installing
 

Install bundler on your local machine.
 

```

install bundler

```

Tell bundle to install the required gems.

```

bundle install

```
Running the application can be done with the following command 
```
ruby main.rb
```

  ## Structure
  The plan for the structure was created prior to writing any lines of code. The class and file setup were as follows. 
`main` - This is the file used to run the application, and contains the loop responsible for running the game.
`mainmenu` - This file contains all menu items, which include game controls, starting the game, and an exit option, it inherits from the board class, which is required for setting up the game.
`gameboard` - The `gameboard `file is responsible for initializing the game window, and displaying the appropriate content to the terminal, and as such inherits from `gamelogic`. 
`gamelogic` - Contains the major functionality required for game interactions. 
`players`- A class containing methods for both game users. The player methods contain the ship objects allowing player interaction
`ships` - The ships file holds all of the potential board layouts within the game. 



## Testing

The application was thoroughly tested throughout the development process as a means to ensure that functionality was operating as expected, and to prevent future changes to the application. Upon initialization of a window within the `curses` gem, the alteration of the terminal properties, hindered the procedure of testing for all objects containing an initialized window. This meant that these objects were untested. This however, should cause no issues, as the underlying functionality that creates the windows is reliant on properties inherited from objects, which underwent thorough testing.


### What was Tested?

Adequate testing was completed to ensure application functionality was operating as intended. All objects with a return value pertinent to proper operation were tested.
  

## Copyright, ethical and social issues
The application was created with the prime purpose of education, and entertainment, and as such issues relating to copyright and ethics are perceived to be negligible. Whilst the game `Battleships` is widely known, the rules of a game cannot be subject to copyright or patented. 

## Author
**Jye Bussa** - sole creator for the week 3 Coder Academy Assessment.

