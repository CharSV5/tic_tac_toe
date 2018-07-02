# Tic Tac Toe

## How to run
Fork and clone the repo and run ```bundle install``` (assuming you have bundler) to install the dependencies. Start the server by running either ```ruby app.rb``` or ```rackup config.ru``` and visit localhost:4567 if ruby or localhost:9292 if rackup.

## How to run the tests
Run ```rspec```

## How to play the game
The game randomly chooses whether X or O goes first, each player will take turns claiming a square by typing a number that corresponds to the square they wish to claim, and clicking submit. The winner is the first player to claim 3 squares in a row, column or diagonal.

## Technologies used
Ruby, Sinatra, Rspec, Capybara,  HTML, CSS, Rubocop, Simplecov, Sessions and Rack.

## How I built this
I started with the logic and thought and test drove the three classes with 100% coverage of unit tests. I chose Sinatra for the framework and used ERB for the views. ERB doesn't have the advantage of javascript event handlers like on click, so given the time frame for this project, I decided to use a text area where you have to specify which square to claim. I used Sessions so data would persist across refreshes. Due to the deadline being so close, I initially didn't think I would have time for feature testing, but in the end I was able to add some feature tests with Capybara. As this had been a last minute addition to reach a deadline, I did it after most of the app was built and not before like I would do usually.
