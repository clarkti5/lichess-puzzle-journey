# Data Collection and Processing Overview
> See [`puzzle_journey_data_collection_processing.ipynb`](https://github.com/clarkti5/lichess-puzzle-journey/blob/main/Data%20Collection%20and%20Processing/puzzle_journey_data_collection_processing.ipynb) for details.

## Contents
1. [Lichess puzzle database](#database)
3. [My puzzle activity](#activity)
4. [My puzzle rating history](#history)

## Lichess puzzle database <a name=database></a>

The Lichess puzzle database was downloaded from [https://database.lichess.org/#puzzles](https://database.lichess.org/#puzzles) on March 22, 2023. The data was in the form of a compressed `.csv` using [`zstd`](https://github.com/facebook/zstd) compression. This file was decompressed in command line and converted to a `pandas` dataframe using `.read_csv()`.

![Screenshot 2023-05-15 at 12 06 50 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/69b31948-1022-499a-9db3-f736f213520a)

The data initially contained no headers, so we added headers in line with the [database documentation](https://database.lichess.org/#puzzles).

![Screenshot 2023-05-15 at 12 08 26 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/a12ce0eb-5a74-4e00-8f8a-2f691a877fe6)

Checking for missing or null values, we found quite a few in the `Opening_Tags` column.

![Screenshot 2023-05-15 at 12 09 14 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/4296ea8e-5b1e-4233-a1ee-14ecbbbe7a92)

This was to be expected, though—opening tags are only set for puzzles occuring before move `20` since a tactic occuring within the first `20` moves of a game likely has features strongly influenced by the opening played, whereas puzzles occuring later may not be as strongly influenced by the opening.

Finally, we added a column for `Puzzle_Length` that counts the number of moves in the puzzle from it's starting position. The first move in the `Moves` column sets up the position to present to the player, so `Puzzle_Length` is `1` less than the number of moves in `Moves`.

![Screenshot 2023-05-15 at 12 14 08 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/4daea186-f16a-45a3-a72c-21b7a830c68a)

Note that the number of moves the *player* must make is actually half of the number of moves in the `Moves` column, or

>$$\dfrac{\text{Puzzle Length} + 1}{2}.$$

## My puzzle activity <a name=activity></a>

I used a personal token generated from https://lichess.org/account/oauth/token to access my puzzle activity from the Lichess API at https://lichess.org/api/puzzle/activity.

![Screenshot 2023-05-15 at 12 21 36 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/d4cbdc88-a2d1-4f89-8e89-6d01ab482477)
![Screenshot 2023-05-15 at 12 22 08 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/00dd40c6-2c93-48da-af85-ffb51d0ce6e0)
![Screenshot 2023-05-15 at 12 22 31 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/32a9f363-f2a0-4839-9b5e-66e26f6c0538)

The response is a `.ndjson` filed, i.e. a new-line delimited `json` file. I had trouble getting `pandas` to read this, so I frist split the response text into a list, to which I applied `json.loads()` to parse each element as a `.json` object. Afterward, `.json_normalize()` was able to convert this list of `.json` objects into a dataframe.

![Screenshot 2023-05-15 at 12 27 24 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/74e2f0fc-3be8-4811-80b8-4ca075a02191)

Note that the `date` column is in `13`-digit format. I converted these to `datetime`.

![Screenshot 2023-05-15 at 12 30 30 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/f60b1578-f856-4000-9304-f64d1a11c309)

## My puzzle rating history <a name=history></a>

My rating history was downloaded directly from https://lichess.org/api/user/tclark/rating-history as a `.json` file. My puzzle rating history was encoded as a list of points at index `13` of this file. This list was read into a dataframe as below.

![Screenshot 2023-05-15 at 12 33 01 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/b5c79f38-d735-46fc-a2f0-1aad3462b508)

The `month` column had `January` corresponding to `0`, which I found strange—so, I added `1` to each entry in `month`.

![Screenshot 2023-05-15 at 12 33 46 PM](https://github.com/clarkti5/lichess-puzzle-journey/assets/50031286/a5eb2324-da6a-4fe4-aa02-10cbe9008a8f)
