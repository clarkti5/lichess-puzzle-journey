# Data Collection and Processing Overview
> See [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb) for details.

## Contents
1. [Lichess puzzle database](#database)
3. [My puzzle activity](#activity)
4. [My puzzle rating history](#history)

## Lichess puzzle database <a name='database'></a>

The Lichess puzzle database was downloaded from [https://database.lichess.org/#puzzles](https://database.lichess.org/#puzzles) on March 22, 2023. The data was in the form of a compressed `.csv` using [`zstd`](https://github.com/facebook/zstd) compression. This file was decompressed in command line and converted to a `pandas` dataframe using `.read_csv()`.

![Screenshot 2023-05-15 at 12 06 50 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/7201e190-cfad-4bf5-98bf-c1d6a1d18d23)

The data initially contained no headers, so we added headers in line with the [database documentation](https://database.lichess.org/#puzzles).

![Screenshot 2023-05-15 at 12 08 26 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/56f8acf3-b164-4e5d-9c96-169d7666176f)

Checking for missing or null values, we found quite a few in the `Opening_Tags` column.

![Screenshot 2023-05-15 at 12 09 14 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/d382b2bc-2b12-4e80-bb8b-e4fdf4457887)

This was to be expected, though—opening tags are only set for puzzles occuring before move `20` since a tactic occuring within the first `20` moves of a game likely has features strongly influenced by the opening played, whereas puzzles occuring later may not be as strongly influenced by the opening.

Finally, we added a column for `Puzzle_Length` that counts the number of moves in the puzzle from it's starting position. The first move in the `Moves` column sets up the position to present to the player, so `Puzzle_Length` is `1` less than the number of moves in `Moves`.

![Screenshot 2023-05-15 at 12 14 08 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/5e4097f0-174c-46e5-8889-d7536e68c3b5)

Note that the number of moves the *player* must make is actually half of the number of moves in the `Moves` column, or

>$$\dfrac{\text{Puzzle Length} + 1}{2}.$$

## My puzzle activity <a name='activity'></a>

I used a personal token generated from https://lichess.org/account/oauth/token to access my puzzle activity from the Lichess API at https://lichess.org/api/puzzle/activity.

![Screenshot 2023-05-15 at 12 21 36 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/9a03ef6e-949d-4b83-aeb2-b9a3aad1bd1a)
![Screenshot 2023-05-15 at 12 22 08 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/47844141-b64e-47a9-b663-817584da2bd2)
![Screenshot 2023-05-15 at 12 22 31 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/2b57dfb1-d59e-40d1-94dc-f4471ff2da68)

The response is a `.ndjson` filed, i.e. a new-line delimited `json` file. I had trouble getting `pandas` to read this, so I frist split the response text into a list, to which I applied `json.loads()` to parse each element as a `.json` object. Afterward, `.json_normalize()` was able to convert this list of `.json` objects into a dataframe.

![Screenshot 2023-05-15 at 12 27 24 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/242dc8e9-e54f-4394-931d-d401fdb8ced6)

Note that the `date` column is in `13`-digit format. I converted these to `datetime`.

![Screenshot 2023-05-15 at 12 30 30 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/cb3cb41c-5ac6-4580-a295-85b767434f1c)

## My puzzle rating history <a name='history'></a>

My rating history was downloaded directly from https://lichess.org/api/user/tclark/rating-history as a `.json` file. My puzzle rating history was encoded as a list of points at index `13` of this file. This list was read into a dataframe as below.

![Screenshot 2023-05-15 at 12 33 01 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/b5bbaf3e-d418-4cdf-9e33-48d1407843cc)

The `month` column had `January` corresponding to `0`, which I found strange—so, I added `1` to each entry in `month`.

![Screenshot 2023-05-15 at 12 33 46 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/dd2eea08-97e1-461c-b862-32b8f416a1c1)


