![wN](https://user-images.githubusercontent.com/50031286/233688542-c8b05132-a0d6-4697-a9c7-33015d031c43.svg)

# lichess-puzzle-journey

>My journey to achieving a 2,500 puzzle rating on Lichess.org and some general exploration of the Lichess puzzle database.

This repository contains some exploration and investigation into the [Lichess](https://lichess.org) database of chess puzzles as well as my own chess puzzle progress. 

This project was undertaken partly out of curiosity and partly to practice some `Python`, `R`, and `Tableau`. As such, I did most of the data manipulation in `Python` using `pandas` with initial visualizations in `R` using `ggplot2`. I worked primarily in `Google Colab`, since I wanted to familiarize myself with that platform, as well. I used `rpy2` to run `Python` and `R` in the same `Colab` notebook via `R magic`. Occasionally, the `Colab` runtime would run out of RAM and crash when using `R magic`—in those cases, I ran the `R` code locally. Advanced visualizations and dashboards were done in `Tableau`. 

This is *certainly* not the most efficient way to do things but it worked out well enough overall and I learned a lot along the way.

# What is Lichess?

>[Lichess.org](https://lichess.org/about) is a free/libre, open-source chess server powered by volunteers and donations.

With humble beginnings, [Lichess.org](https://lichess.org) (pronounced "lee-chess") is now one of the most popular chess websites in the world, with over 3 million games played daily.

[Lichess.org](https://lichess.org) also has an extensive database of chess tactics puzzles, all of which were generated from user games on the website. This database contains millions of puzzles [available to play](https://lichess.org/training/themes) for free!

# The data

>[Data Collection and Processing Overview](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing%20Overview.md)

We collected data from the full [Lichess puzzle database](https://database.lichess.org/#puzzles) as well as data on my personal rating history and puzzle activity. Details can be found in [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb).

# My puzzle journey

>[My Puzzle Activity Overview](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/My%20Puzzle%20Activity%20Overview.md)

At the onset of the COVID-19 Pandemic in early 2020, I—like many others—inexplicably found myself interested in learning to play chess. I created an account on Lichess.org (the clearly superior, open-source alternative to Chess.com) in May of 2020, but didn't do much with it aside from the occasional coorespondence game with friends and family.

About 2 years later, I found myself practicing more frequently with the tactics puzzles available on Lichess. Eventually, I noticed that my puzzle performance was being evaluated with a puzzle rating. From https://database.lichess.org/#puzzles,

>To determine the [puzzle] rating, each attempt to solve [a puzzle] is considered as a [Glicko2](https://en.wikipedia.org/wiki/Glicko_rating_system) rated game between the player and the puzzle.

Basically, the higher-rated the puzzle, the more difficult it is to solve, and the higher a player's puzzle rating, the better they are at solving puzzles.

Now that a metric of performance was involved, what started as a way to pass time between classes and meetings turned into a personal challenge to see how high I could push my puzzle rating.

After about a year of taking puzzles far too seriously, on February 24, 2023, I reached my all-time high puzzle rating of `2,510` (putting me in the `96th` percentile for puzzle ratings). You'll details behind the data collection and analysis in [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb) and [`lichess_puzzle_activity_history_eda.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Exploratory%20Analysis/lichess_puzzle_activity_history_eda.ipynb) respectively.

# Exploring the Lichess puzzle database

>[Lichess Puzzle Database Overview](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Lichess%20Puzzle%20Database%20Overview.md)

We perform some basic processing and analysis of the [Lichess.org](https://lichess.org/) puzzle database. The database itself was obtained from https://database.lichess.org/#puzzles on March 22, 2023. The database contains information on Lichess puzzles including

- Puzzle ID
- FEN (board position 1 move prior to the beginning of the puzzle)
- Moves (i.e. solution to the puzzle)
- Rating
- Rating Deviation
- Popularity
- Number of Plays
- Themes
- Game URL
- Opening Tags.

From the [documentation](https://database.lichess.org/#puzzles):

>Generating these chess puzzles took more than 50 years of CPU time.
We went through 300,000,000 analysed games from the Lichess database, and re-analyzed interesting positions with Stockfish 12/13/14/15 NNUE at 40 meganodes. The resulting puzzles were then automatically tagged. To determine the rating, each attempt to solve is considered as a Glicko2 rated game between the player and the puzzle. Finally, player votes refine the tags and define popularity.

You'll find the details behind the data collection and analysis in [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb) and the [`Exploratory Analysis` folder](https://github.com/clarkti5/lichess-puzzle-journey/tree/main/Exploratory%20Analysis) respectively.
