# Terminal-Battleships Application (Ruby)
# Development Plan

### Trello 
<https://trello.com/b/kwo34Wlz/terminal-app>
## Intended features
```
4th september, 2019
```
During the initial development plan there were features which at the time, seemed plausible, but upon attempted implementation were hindered by time constraints. The major issue encountered was pertaining to the intent to develop multiple game modes of various difficulty. Upon further investigation, the extra requirements of the intended features appears to extend the projects estimated timeframe, beyond reasonable expectation. The implementation of difficulty levels involved "predictive" traits performed by the computer player (CP), The CP was to make educated guesses of appropriate moves, based on the result of their last move. This created a few issues, firstly, the nature of the game meant that the logic required for these features created contradictions. Simply stacking ships beside each other, would confuse the CP and have it believe it was following the path of a single ship, causing it to act in an unintended way. 

## Testing Roadblocks 
```
5th September, 2019
```
The intended testing procedure was to use TDD (Test Driven Development) and follow the Red-Green-Refactor development process. This would involve the process of first creacting failing tests, and then proceed to create the desired functionality and attempt to create working tests. The multiple procedural steps occuring within the game made this quite difficult, as the desired assertions for test types were difficult to check prior to the creation of other parts. An example of this relates to user interaction. The user is inputing alphanumeric coordinates, which are compared to a corresponding index within another array, the values attained at the index of the second array, are then checked against values within a multitude of other arrays, created within seperate objects. This made the procedure rather difficult, as the data types of assertions were subject to change throughout development, making post-production test creation a more effecient solution.

## Alterations
```
5th Semptember, 2019
```
A mostly working model of the game was in operation, however when attempting to refactor to implement neccesary features, there were issues in relation to how certain objects were being created. The `Ship` class and instance variables will be altered in order to pass the position of the object at a later date. Due to time constraints, an array of Hard-coded boards will be implemented, which will then be chosen at random to initialize the computer players board. 