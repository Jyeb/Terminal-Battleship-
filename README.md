
# Terminal-Battleships Application (Ruby)
 
## Description

Terminal-Battleships is a game created following the ruleset of the popular strategy game 'Battleships'. Players take turns selecting an alpha-numeric position on a game board, with the aim being to find the locations of the enemies ships. A winner is determined when all of the opponents ships have been destroyed.
 
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

## Testing
The application was thoroughly tested throughout the development process as a means to ensure that functionality was operating as expected, and to prevent future changes to the application. Upon initialization of a window within the `curses` gem, the alteration of the terminal properties, hindered the procedure of testing for all objects containing an initialized window. This meant that these objects were untested. This however, should cause no issues, as the underlying functionality that creates these windows is reliant on properties inherited from objects, which underwent thorough testing. 

### What  was Tested? 
All objects which were pertinent to the underlying operation of the game tested.

## 
