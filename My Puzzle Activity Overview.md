# Exploratory analysis of my Lichess puzzle activity
>See [`lichess_puzzle_activity_history_eda.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Exploratory%20Analysis/lichess_puzzle_activity_history_eda.ipynb) for more details.

|![Dashboard 1](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/c1dbeebc-ba97-4df5-bcf6-c7defe38a74a)|![My Puzzle Activity](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/bc9f9d7f-9c8d-40f2-aa7e-c8e266fab803)|
|:--:|:--:|
|*Interactive version available [here.](https://public.tableau.com/views/MyLichessPuzzleRatingHistory/Sheet1?:language=en-US&:display_count=n&:origin=viz_share_link)* | *Interactive version available [here.](https://public.tableau.com/views/MyLichessPuzzleActivity/MyPuzzleActivity?:language=en-US&:display_count=n&:origin=viz_share_link)*|

## Contents
1. [Loading the data](#data)
2. [My puzzle rating history](#history)
3. [My puzzle activity](#activity)

## Loading the data <a name=data></a>

### Rating history

We created `puzzle_rating_history_df` from the `tclark_puzzle_rating_history_clean.csv` data processed in [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb).

![Screenshot 2023-05-16 at 10 57 41 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/9ca29ca1-c704-4dbf-ae73-f3fec550539a)

We also combined the `year`, `month`, and `day` columns into a single `date` column.

![Screenshot 2023-05-16 at 10 58 29 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/23759e67-c552-4080-ab11-c985df52ec69)

### Puzzle activity

We created `puzzle_activity_df` from the `tclark_puzzle_activity_clean.csv` data processed in [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb).

![Screenshot 2023-05-16 at 10 22 29 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/fae36ce4-31e3-4dca-a0a3-8a0878d5c555)

Note that I played `1,716` puzzles between February 2022 and March 2023.

Finally, we took a subset of the full `puzzles_df` consisting of just the puzzles that I played.

![Screenshot 2023-05-16 at 11 02 38 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/88fcb1f5-2dc0-4702-ad34-59986d30b0da)

We dropped the `Rating` column—since many of the puzzle ratings have changed since I played the puzzles, I chose to keep their rating at the time I played them (which is stored in the `puzzleRating` column of `puzzle_activity_df`).

## My puzzle rating history <a name=history></a>

### My rating over time

Below is a visualization of my rating over time.

![rating_by_day](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/31f87b9c-f16b-4f48-9b4a-013b1e7b274d)

My rating fluctuated a lot, with an approximately `4`-month plateau in the `1,700--1,900` range from mid-May 2022 through August 2022, followed by a climb over `2,000` in September 2022 through about mid-October 2022. I plateaued again aroung `2,000--2,100` for almost `3` months, after which I had another spike in progress up to `2,500`.

Overall, it seems I have gone through a cycle that looks something like

- `1--2` months of improvement.
- `3--4` months of plateau.

The figure below considers my rating broken into `6` segements each containing an approximately equal number of days. Observe the plateaus from July 2022 to September 2022 and from mid-October 2022 through January 2023.

![rating_by_day_cut_number](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/c0d47e80-18bb-45b6-aff4-e25454885da8)

### A new strategy

We can compare my rating history to the volume of puzzles played per day, as visualized here.

![rating_volume_combined](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/daa007e7-c952-4ec2-94d9-6e46cd0d6158)

Again, around mid-October 2022 I plateaued in rating. About a month later, I decided to change my strategy. I started taking *as long as necessary* to solve a puzzle—I no longer attempted a puzzle until I was essentially certain of its solution. 

Working for about `20` minutes at a time, I would sometimes take several days on a single puzzle (luckily, [lichess](https://lichess.org) keeps track of which puzzle you're on). This meant I played fewer rated puzzles, but it also meant I almost always got them correct, as you can see with my win rate starting in mid-November 2022.

After taking a break in ealry December, I finally overcame the 2,100 rating barrier. My rating continued to improve as I continued to successfully solve puzzles. Around March 2023, I also began playing easy unrated puzzles in between the more difficult rated puzzles, so the volumes on the graph may be a bit misleading, since I was only completing a rated puzzle once every couple of days.

Whether all of this resulted in me learning more about tactics is debatable, but it did have a noticeable impact on improving my puzzle rating. Ultimately, if you're looking for the secret to improving your puzzle rating, my advice is simply

>Keep getting puzzles correct!

### My highest rating

Taking as long as necessary meant I played fewer puzzles, but I almost always got them right—so my rating kept going up! My highest rating was `2,510`, achieved in late-February 2023. This is in the `96-th` percentile of puzzle ratings.

![Screenshot 2023-05-16 at 10 49 21 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/c3f07fcb-0ced-497b-a55c-2d1748a54ec2)

The `take-as-long-as-it-takes` strategy is, admittedly, time-consuming and mentally draining. I'm a mathematician, so I'm accustomed to being stuck on a single problem for days (or even years) at a time. Nonetheless, I started playing the easier unrated puzzles as a fun distraction since the rated ones had become so challenging. I'm not sure at the moment if I want to continue trying to push my rating as high as possible or go back to just playing puzzles for fun.

## My puzzle activity <a name=activity></a>

### Win rate by day and time

![Screenshot 2023-05-16 at 11 06 20 AM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/ba94ad34-a899-416e-a6de-d0759224755d)

Tuesdays, Wednesdays, and Saturdays appear to be my best puzzle-playing days.

### Win rate by theme

I probably need to work on longer puzzles and endgame puzzles.

![theme_win_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/948a0573-2942-48ae-957d-c9c2ccb7a669)

### Win rate by opening

Perhaps I should consider playing the `French_Defense` more often.

![opening_win_histogram](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/09bcc33d-af88-40ce-892c-540eeb04ecb3)




