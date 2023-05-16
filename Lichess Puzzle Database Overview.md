# Exploratory analysis on the Lichess puzzle database
>See the [Exploratory Analysis folder](https://github.com/clarkti5/lichess-puzzle-journey/tree/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis) for more details.

|![Lichess Puzzle Database (1)](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/5ad77779-a1f4-4c77-afe0-9f6868eda0af)|
|:--:|
|*Interactive version available [here](https://public.tableau.com/views/LichessPuzzleDatabase/LichessPuzzleDatabase?:language=en-US&:display_count=n&:origin=viz_share_link)*|

## Contents
1. [Descriptive statistics](#descriptive)
2. [Distributions](#distributions)
3. [Puzzle rating](#rating)
4. [Rating deviation](#deviation)
5. [Popularity](#popularity)

## Descriptive statistics <a name=descriptive></a>
>See [`lichess_db_puzzle_eda_descriptive.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis/lichess_db_puzzle_eda_descriptive.ipynb) for more detials.

We used `pandas` to read the `lichess_db_puzzle_clean.csv` file from [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb) as a dataframe called `puzzles_df`. We found that there are over `3` million puzzles in the database.

![Screenshot 2023-05-16 at 8 43 48 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/a73d8c21-4f98-4cb0-8e1c-407eea7dda1c)

We then examined the descriptive statistics using `puzzles_df.describe()`.

![Screenshot 2023-05-16 at 8 45 15 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/8089413a-5eaa-4431-afc2-082beaff990e)

Some interesting characteristics include the following.

- The minimum puzzle rating is `545`, while the maximum puzzle rating is `3,212`.
- The median puzzle rating is `1,514`.
- The median puzzle length is `3` moves (i.e. `2` moves made by the player).
- The maximum puzzle length is `29` moves (i.e. `15` moves made by the player)!
- There are puzzles in the database that have yet to be played.
- Meanwhile, the maximum number of plays is over `1,000,000`!

We also used [`chess`](https://github.com/niklasf/python-chess/tree/master) to view some puzzles. For example, below is the puzzle with highest rating.

![Screenshot 2023-05-16 at 8 47 43 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/65186f29-871f-44ce-b93c-afc24d0a8757)

Here is the puzzle with the highest number of plays.

![Screenshot 2023-05-16 at 8 48 14 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/c8cfd740-e023-4a37-bba1-46ad64b50621)

Finally, we examined the feature correlations.

![Screenshot 2023-05-16 at 8 49 06 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/9ee57ffa-bcd5-4c08-bac8-366a3ce472de)

- Perhaps unsurprisingly,`Puzzle_Length` and `Rating` are moderately positively correlated (i.e. longer puzzles tend to be more difficult).
- There is a weak negative correlation between `Popularity` and `Rating_Deviation`. This may indicate that popular puzzles tend to have lower rating deviation.

The second point seems less straight-forward than the first. However, think of `Rating_Deviation` as measuring the predictability of a puzzle's difficulty—a puzzle with low rating deviation is performing at a relatively stable rating (i.e. difficulty), while a puzzle with high rating deviation has a relatively unstable rating. Meanwhile, `Popularity` essentially measures whether a puzzle is meeting the users' expectations. In this interpretation, it makes sense that a more popular puzzle is performing as expected, hence would have a more predictable level of difficulty.

## Distributions <a name=distributions></a>
>See [`lichess_db_puzzle_eda_distributions.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis/lichess_db_puzzle_eda_distributions.ipynb) for more details.

We used `ggplot` to visualize the distributions of puzzle rating, rating deviation, popularity, number of plays, puzzle length, themes, and opening tags.

### Puzzle rating

![rating_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/3615a923-f5c3-4ff6-a3c8-561ef3adfdce)

The distribution of ratings is unimodal and fairly symmetric. Below is a boxplot.

![rating_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/27f40b13-e850-4434-ad8f-89d126df3bcf)

### Rating deviation

![rating_deviation_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/599e5987-cdd3-4f7c-b453-e81469fc4ff8)

The distribution of rating deviation is unimodal and right-skewed. Most puzzles have a rating deviation of less than `100`. Below is a boxplot—note the potential outliers.

![rating_deviation_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/193beb9b-49d0-4330-8141-48b76b2aa1fc)

### Popularity

![popularity_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/e5dacda4-c75e-49fb-b40e-fa7aa72ecb51)

The distribution of popularity is unimodal and left-skewed. Most puzzles are rather popular, suggesting there are few puzzles that users find to be inaccurate, poorly designed, or otherwise unfair. Below is a boxplot—note the potential outliers.

![popularity_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/eb6d97f2-b2f6-4cc1-8fa9-d7ceaa8fb8c9)

### Number of plays

![number_of_plays_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/9e5c5f04-2541-4f1e-bd91-38625b7d7d80)

The distribution of number of plays is unimodal and right-skewed. There are comparatively few puzzles with more than `2,000` plays. Below is a boxplot—note the potential outliers and small interquartile range.

![plays_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/0371205a-6291-4cd0-b890-eeb7575a99b0)

### Puzzle length

![length_bar](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/5e0e94e0-d64d-40a4-bcda-e5f54e4996dd)

Puzzle length ranges from `1` to `29` (i.e. from `1` to `15` player moves), though the distribution is right-skewed. The most common puzzle length is `3`, which corresponds to `2` moves made by the player. Below is a boxplot—note the potential outliers occuring around length `9--11`. 

![length_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/c45cd084-816e-4d9b-8002-b31b7379494a)

### Themes

![theme_bar](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/08231f03-9317-400d-8a96-101597910f02)

There are `60` distinct themes (not including the `healthyMix` and `playerGames` themes). The `5` most frequently occuring themes are as follows.

- `short`
- `middlegame`
- `crushing`
- `endgame`
- `advantage`

It is interesting to recall here that these puzzles are generated by user games on [lichess.org](https://lichess.org). So, be on the lookout for these sorts of tactics in your games!

### Opening tags

![opening_bar](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/950eb1d8-2582-4585-9634-3d6500500398)

There are over `100` opening tags, not including variations! The most common opening in the puzzle database is the `Sicilian_Defense`—watch out for early tactics in your Sicilian games!

## Puzzle rating <a name=rating></a>
>See [`lichess_db_puzzle_eda_rating.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis/lichess_db_puzzle_eda_rating.ipynb) for more details.

The strongest feature correlation to puzzle rating was with puzzle length, vizualized below.

![length_vs_rating](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/ad412f52-f50a-43fd-b3f3-69ba7f14f3b6)

The median puzzle rating increases as puzzle length increases.

We investigated the relationship between puzzle theme and puzzle ratings, as well.

![theme_vs_rating](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/ac98986d-746e-45b4-be54-e940ff3b2244)

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

![opening_vs_rating](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/90c81c2e-6720-429a-847f-074eecd89e80)

The median rating is pretty consistent across openings. The `Zukertort_Defense` and `Amar_Gambit` are the only openings with a median rating over `2,000`, while the `Borg_Opening` is the only opening with a median rating under `1,000`.

## Rating deviation <a name=deviation></a>
>See [`lichess_db_puzzle_eda_deviation.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis/lichess_db_puzzle_eda_deviation.ipynb) for more details.

Rating deviation is very consistent across most features in the database. Two things that stood out from our investigations here are the following.

- The theme `equality` has a much higher median rating deviation than the other themes.

![theme_vs_rating_deviation](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/e02c1802-2a5e-485f-9019-6ca9b974e32e)

- The opening with the highest median rating deviation is the `Norwegian_Defense`.

![opening_vs_rating_deviation](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/b9376040-3799-4064-b62e-763a342ce615)

## Popularity <a name=popularity></a>
>See [`lichess_db_puzzle_eda_popularity.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/e00ed36e7ac232d119ace64d10de16848f68e24c/Exploratory%20Analysis/lichess_db_puzzle_eda_popularity.ipynb) for more details.

Aside from the relationship between `Puzzle_Length` and `Rating`, the next strongest correlation was between `Popularity` and `Rating_Deviation`, visualized below.

![popularity_vs_rating_deviation_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/2ede0bd9-368f-45e1-b11b-54b1fd2ca4af)

Observe, as popularity increases, the median rating deviation decreases.

The other features seemed to have little impact on popularity—notably, median popularity is fairly stable when compared across themes.

![theme_vs_popularity_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/5a3798ce-d773-477a-a484-29b4dfe3b24e)

Notably, the `Queens_Pawn_Mengarini_Attack` is the opening with lowest median popularity.

![opening_vs_popularity_boxplot](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/efe0a1b8-1c67-4c6e-b918-c4fcd98bda6e)

