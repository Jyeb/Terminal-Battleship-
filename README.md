
# Terminal-Battleships Application (Ruby)

## Trello 
[Trello Board](ttps://trello.com/b/8CDGrAdK/battleship-application)

## Description

Terminal-Battleships is a game created following the ruleset of the popular strategy game 'Battleships'. Players take turns selecting an alpha-numeric position on a game board, with the aim being to find the locations of the enemies ships. A winner is determined when all of the opponents ships have been destroyed.
## Motivations
The motivation behind the project was to create an enjoyable application, whilst challenging current programming knowledge. The aim was to create an app, that was challenging, enjoyable and realistic within the allotted time frame.
Due to the restricted time, the application still has ample potential for further development.

## Getting Started
1. Install Ruby on your local machine
2. Download the repository, and unzip the files
3. Using the terminal, locate the directory containing the files

## Purpose and Scope
The purpose of the application, was to showcase and develop fundamental programming skills, whilst creating an entertaining app. The application is intended for entertainment purposes, with a large focus on personal education, in relation to fundamental programming principles. The application will take the ruleset of the common strategy game, battleships, and developed using ruby. The application will be built in the terminal, using various gem's, and an implementation of various ruby gems. The application will allow a user to compete against a computer player, both players will take turns, attempting to determine the locations of the opponents ships. Correct guesses will return visual output to the terminal, indicating a correct choice has been made, this procedure will continue until either of the players has correctly guessed all locations of their opponents ships, at which point the result of the game will be displayed, along with a message prior to exiting the game. These features will be implemented through the use of object orientated program, functional programming, Test Driven Development (TDD), and utilization of the extensive ruby library. Education pertaining to the importance of extensive documentation will also be a primary focus of the development process. 

Primarily, from a functional perspective the operation of the application is focused on entertainment. However, the app can also serve as a benchmark for other students learning software development.
 From an entertainment perspective, the app can serve as a time-passer, whilst software developers, can use the  code as a template for further implementations. The time constraints on development, will limit the extent of short term implementations, however will serve as a template with the potential for extensive development.

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

![alt text](https://github.com/Jyeb/Terminal-Battleship-/blob/master/img/shiptests.png "Ship testing")
![alt text](https://github.com/Jyeb/Terminal-Battleship-/blob/master/img/shiptests.png "Logic testing")
## Features 
The application contains several features, however the following could be considered the primary features that are pertinent to overall functionality of the game. The feature containing collision detection is a necessity as it's used for all player interactions within the game and determine outcome. Collision detection has interaction with player input, another feature which is required for the operation of the game. The entirety of the game loop is reliant on player input, on each iteration which is used to determine the outcome and visual feedback of the application. The menu system is also a primary feature responsible for the initialization of the game, it also holds the functionality to enter the primary game loop, exit the game, and a menu for instructions on how to play the game. 

## Copyright, ethical and social issues

The application was created with the prime purpose of education, and entertainment, and as such issues relating to copyright and ethics are perceived to be negligible. Whilst the game `Battleships` is widely known, the rules of a game cannot be subject to copyright or patented.

## Author

**Jye Bussa** - sole creator for the week 3 Coder Academy Assessment.
