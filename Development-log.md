# Terminal-Battleships Application (Ruby)
# Development Plan

## Intended features
```
4th september, 2019
```
During the initial development plan there were features which at the time, seemed plausible, but upon attempted implementation were hindered by time constraints. The major issue encountered was pertaining to the intent to develop multiple game modes of various difficulty. Upon further investigation, the extra requirements of the intended features appears to extend the projects estimated timeframe, beyond reasonable expectation. The implementation of difficulty levels involved "predictive" traits performed by the computer player (CP), The CP was to make educated guesses of appropriate moves, based on the result of their last move. This created a few issues, firstly, the nature of the game meant that the logic required for these features created contradictions. Simply stacking ships beside each other, would confuse the CP and have it believe it was following the path of a single ship, causing it to act in an unintended way. 