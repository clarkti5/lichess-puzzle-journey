# Exploratory analysis on the Lichess puzzle database
>See the [Exploratory Analysis folder](https://github.com/clarkti5/lichess-puzzle-journey/tree/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis) for more details.

|![Lichess Puzzle Database](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/11df224a-f3a2-4b7e-bde1-92434d96aac4)|
|:--:|
|*Interactive version available [here](https://public.tableau.com/views/LichessPuzzleDatabase/LichessPuzzleDatabase?:language=en-US&:display_count=n&:origin=viz_share_link)*|

## Contents
1. [Descriptive statistics](#descriptive)
2. [Distributions](#distributions)
3. [Puzzle rating](#rating)
4. [Rating deviation](#deviation)
5. [Popularity](#popularity)

## Descriptive statistics <a name='descriptive'></a>
>See [`lichess_db_puzzle_eda_descriptive.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis/lichess_db_puzzle_eda_descriptive.ipynb) for more detials.

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

The second point seems less straight-forward than the first. However, think of `Rating_Deviation` as measuring the predictability of a puzzle's difficulty—a puzzle with low rating deviation is performing at a relatively stable rating (i.e. difficulty), while a puzzle with high rating deviation has a relatively unstable rating. Meanwhile, `Popularity` essentially measures whether a puzzle is meeting the users' expectations. In this interpretation, it makes sense that a more popular puzzle is performing as expected, hence would have a more predictable level of difficulty.

## Distributions <a name='distributions'></a>
>See [`lichess_db_puzzle_eda_distributions.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis/lichess_db_puzzle_eda_distributions.ipynb) for more details.

We used `ggplot` to visualize the distributions of puzzle rating, rating deviation, popularity, number of plays, puzzle length, themes, and opening tags.

### Puzzle rating

![rating_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/eddea066-2777-4c20-81a0-d331ef854238)

The distribution of ratings is unimodal and fairly symmetric. Below is a boxplot.

![rating_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/4b2ad9a7-b167-4f43-8f1f-ede6fed3b08f)

### Rating deviation

![rating_deviation_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/ecfc7a65-698a-4d0a-bd7c-77918a5af303)

The distribution of rating deviation is unimodal and right-skewed. Most puzzles have a rating deviation of less than `100`. Below is a boxplot—note the potential outliers.

![rating_deviation_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/2395acab-354a-493f-8f1d-8631e571cbf7)

### Popularity

![popularity_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/1aeb406a-8f46-449a-9970-fe627c7b9f27)

The distribution of popularity is unimodal and left-skewed. Most puzzles are rather popular, suggesting there are few puzzles that users find to be inaccurate, poorly designed, or otherwise unfair. Below is a boxplot—note the potential outliers.

![popularity_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/9ccd786d-89db-4a48-8b8d-5a004e7a0e51)

### Number of plays

![number_of_plays_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/a6584c67-f675-41d0-832f-3760fa15ff55)

The distribution of number of plays is unimodal and right-skewed. There are comparatively few puzzles with more than `2,000` plays. Below is a boxplot—note the potential outliers and small interquartile range.

![plays_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/e6a5657e-6f99-4e8d-b948-8daabd7d4619)

### Puzzle length

![length_bar](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/27e6cf70-8ccb-4693-964d-f1fae9441b83)

Puzzle length ranges from `1` to `29` (i.e. from `1` to `15` player moves), though the distribution is right-skewed. The most common puzzle length is `3`, which corresponds to `2` moves made by the player. Below is a boxplot—note the potential outliers occuring around length `9--11`. 

![length_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/08538a87-f410-476c-ae74-d91f130f6ac8)

### Themes

![theme_bar](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/2aec1ccc-be9c-439e-be6b-f87ab3106c2e)

There are `60` distinct themes (not including the `healthyMix` and `playerGames` themes). The `5` most frequently occuring themes are as follows.

- `short`
- `middlegame`
- `crushing`
- `endgame`
- `advantage`

It is interesting to recall here that these puzzles are generated by user games on [lichess.org](https://lichess.org). So, be on the lookout for these sorts of tactics in your games!

### Opening tags

![opening_bar](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/8a72ddb6-9275-4467-a0e9-7a803b664594)

There are over `100` opening tags, not including variations! The most common opening in the puzzle database is the `Sicilian_Defense`—watch out for early tactics in your Sicilian games!

## Puzzle rating <a name='rating'></a>
>See [`lichess_db_puzzle_eda_rating.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis/lichess_db_puzzle_eda_rating.ipynb) for more details.

The strongest feature correlation to puzzle rating was with puzzle length, vizualized below.

![length_vs_rating](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/fb5c5c39-3b82-4536-a1c9-9c0c47b52929)

The median puzzle rating increases as puzzle length increases.

We investigated the relationship between puzzle theme and puzzle ratings, as well.

![theme_vs_rating](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/799edabb-6d75-4f3c-9348-8b85c4bfce98)

The themes with median puzzle rating greater than `2,000` are as follows.

- `castling`
- `quietMove`
- `veryLong`
- `underPromotion`
- `mateIn5`
- `enPassant`
- `defensiveMove`
- `zugswang`

These are all themes that involve either relatively long puzzles or moves that are subtle, rare, or otherwise non-routine.

Meanwhile, `bankRankMate` has the lowest median rating—these puzzles are generally considered to be quiet easy.

Finally, we looked at opening tag as it relates to puzzle rating.

![opening_vs_rating](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/b8147e90-1166-424e-bf9e-65c266b8bbf4)

The median rating is pretty consistent across openings. The `Zukertort_Defense` and `Amar_Gambit` are the only openings with a median rating over `2,000`, while the `Borg_Opening` is the only opening with a median rating under `1,000`.

## Rating deviation <a name='deviation'></a>

## Popularity <a name='popularity'></a>
