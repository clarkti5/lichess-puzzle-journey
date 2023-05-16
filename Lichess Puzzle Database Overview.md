# Exploratory analysis on the Lichess puzzle database
>See the [Exploratory Analysis folder](https://github.com/clarkti5/lichess-puzzle-journey/tree/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis) for more details.

|![Lichess Puzzle Database](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/11df224a-f3a2-4b7e-bde1-92434d96aac4)|
|:--:|
|*Interactive version available [here](https://public.tableau.com/views/LichessPuzzleDatabase/LichessPuzzleDatabase?:language=en-US&:display_count=n&:origin=viz_share_link)*|

## Contents
1. [Descriptive statistics](#descriptive)
2. [Distributions](#distributions)
3. [Puzzle rating)(#rating)
4. [Rating deviation](#deviation)
5. [Popularity](#popularity)

## Descriptive statistics <a name='descriptive'></a>

We used `pandas` to read the `lichess_db_puzzle_clean.csv` file from [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb) as a dataframe called `puzzles_df`. We found that there are over `3` million puzzles in the database.

![Screenshot 2023-05-16 at 8 43 48 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/39066424-8398-4299-9800-bd401fcc8a07)

We then examined the descriptive statistics using `puzzles_df.describe()`.

![Screenshot 2023-05-16 at 8 45 15 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/7211a48d-6f73-4fac-a80e-8dd31f999bd5)

Some interesting characteristics include the following.

- The minimum puzzle rating is `545`, while the maximum puzzle rating is `3,212`.
- The median puzzle rating is `1,514`.
- The median puzzle length is `3` moves (i.e. `2` moves made by the player).
- The maximum puzzle length is `29` moves (i.e. `15` moves made by the player)!
- There are puzzles in the database that have yet to be played.
- Meanwhile, the maximum number of plays is over `1,000,000`!

We also used [`chess`](https://github.com/niklasf/python-chess/tree/master) to view some puzzles. For example, below is the puzzle with highest rating.

![Screenshot 2023-05-16 at 8 47 43 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/7d3caa35-99e0-4d93-9538-0a2583dc3f1a)

Here is the puzzle with the highest number of plays.

![Screenshot 2023-05-16 at 8 48 14 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/b2525dca-0e44-4960-9caf-a06d128124a1)

Finally, we examined the feature correlations.

![Screenshot 2023-05-16 at 8 49 06 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/112157f5-e2c4-4b6b-b5be-80b20cb29c43)

- Perhaps unsurprisingly,`Puzzle_Length` and `Rating` are moderately positively correlated (i.e. longer puzzles tend to be more difficult).
- There is a weak negative correlation between `Popularity` and `Rating_Deviation`. This may indicate that popular puzzles tend to have lower rating deviation.

The second point seems less straight-forward than the first. However, think of `Rating_Deviation` as measuring the predictability of a puzzle's difficulty—a puzzle with low rating deviation is performing at a relatively stable rating (i.e. difficulty), while a puzzle with high rating deviation has a relatively unstable rating. Meanwhile, `Popularity` essentially measures whether a puzzle is meeting the users` expectations. In this interpretation, it makes sense that a more popular puzzle is performing as expected, hence would have a more predictable level of difficulty.

## Distributions <a name='distributions'></a>

We used `ggplot` to visualize the distributions of puzzle rating, rating deviation, popularity, number of plays, puzzle length, themes, and opening tags.

### Puzzle rating

### Rating deviation

### Popularity

### Number of plays

### Puzzle length

### Themes

### Opening tags

## Puzzle rating <a name='rating'></a>

## Rating deviation <a name='deviation'></a>

## Popularity <a name='popularity'></a>
