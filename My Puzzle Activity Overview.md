# Exploratory analysis of my Lichess puzzle activity
>See [`lichess_puzzle_activity_history_eda.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Exploratory%20Analysis/lichess_puzzle_activity_history_eda.ipynb) for more details.

|![Dashboard 1](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/3f9fc756-e222-43c8-a80a-b8c65284dd41)|![My Puzzle Activity](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/9d6e7d5e-a2d1-475d-b0cf-33029cd1cbb9)|
|:--:|:--:|
|*Interactive version available [here.](https://public.tableau.com/views/MyLichessPuzzleRatingHistory/Sheet1?:language=en-US&:display_count=n&:origin=viz_share_link)* | *Interactive version available [here.](https://public.tableau.com/views/MyLichessPuzzleActivity/MyPuzzleActivity?:language=en-US&:display_count=n&:origin=viz_share_link)*|

## Contents
1. [My puzzle rating history](#history)
2. [My puzzle activity](#activity)

## My puzzle rating history <a name='history'></a>

We created `puzzle_activity_df` from the `tclark_puzzle_activity_clean.csv` data processed in [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb).

![Screenshot 2023-05-16 at 10 22 29 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/02b3033c-85d8-478b-a5d8-caec7013b243)

Note that I played `1,716` puzzles between February 2022 and March 2023. Below is a visualization of my rating over time.

![rating_by_day](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/66de15c0-b974-4027-886b-e5cfcc29fda3)

My rating fluctuated a lot, with an approximately `4`-month plateau in the `1,700--1,900` range from mid-May 2022 through August 2022, followed by a climb over `2,000` in September 2022 through about mid-October 2022. I plateaued again aroung `2,000--2,100` for almost `3` months, after which I had another spike in progress up to `2,500`.

Overall, it seems I have gone through a cycle that looks something like

- `1--2` months of improvement.
- `3--4` months of plateau.

The figure below considers my rating broken into `6` segements each containing an approximately equal number of days. Observe the plateaus from July 2022 to September 2022 and from mid-October 2022 through January 2023.

![rating_by_day_cut_number](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/a0b35a55-c7de-429c-8871-c9bbbe637cf7)



