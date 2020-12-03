'''
--- Day 3: Toboggan Trajectory ---
With the toboggan login problems resolved, you set off toward the airport. While travel by toboggan might be easy, it's certainly not safe: there's very minimal steering and the area is covered in trees. You'll need to see which angles will take you near the fewest trees.

Due to the local geology, trees in this area only grow on exact integer coordinates in a grid. You make a map (your puzzle input) of the open squares (.) and trees (#) you can see. For example:

..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
These aren't the only trees, though; due to something you read about once involving arboreal genetics and biome stability, the same pattern repeats to the right many times:

..##.........##.........##.........##.........##.........##.......  --->
#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
.#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
.#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....  --->
.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
.#........#.#........#.#........#.#........#.#........#.#........#
#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
#...##....##...##....##...##....##...##....##...##....##...##....#
.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
You start on the open square (.) in the top-left corner and need to reach the bottom (below the bottom-most row on your map).

The toboggan can only follow a few specific slopes (you opted for a cheaper model that prefers rational numbers); start by counting all the trees you would encounter for the slope right 3, down 1:

From your starting position at the top-left, check the position that is right 3 and down 1. Then, check the position that is right 3 and down 1 from there, and so on until you go past the bottom of the map.

The locations you'd check in the above example are marked here with O where there was an open square and X where there was a tree:

..##.........##.........##.........##.........##.........##.......  --->
#..O#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
.#....X..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
..#.#...#O#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
.#...##..#..X...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
..#.##.......#.X#.......#.##.......#.##.......#.##.......#.##.....  --->
.#.#.#....#.#.#.#.O..#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
.#........#.#........X.#........#.#........#.#........#.#........#
#.##...#...#.##...#...#.X#...#...#.##...#...#.##...#...#.##...#...
#...##....##...##....##...#X....##...##....##...##....##...##....#
.#..#...#.#.#..#...#.#.#..#...X.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
In this example, traversing the map using this slope would cause you to encounter 7 trees.

Starting at the top-left corner of your map and following a slope of right 3 and down 1, how many trees would you encounter?
'''

from pathlib import Path
import os, re

here = Path(__file__).parent.resolve()
os.chdir(here)


puzzle_input = os.path.join(here, "input.txt")
with open(puzzle_input, 'r') as f:
    puzzle_lines = f.readlines()
    puzzle_lines = [x.strip() for x in puzzle_lines]

test_input = [
    "..##.......",
    "#...#...#..",
    ".#....#..#.",
    "..#.#...#.#",
    ".#...##..#.",
    "..#.##.....",
    ".#.#.#....#",
    ".#........#",
    "#.##...#...",
    "#...##....#",
    ".#..#...#.#",
    ]


tree_count = 0

map_space = 0

if map_space == "#":
    tree_count += 1
    pass

def move_toboggan(starting_point: tuple, slope_parameters: tuple, map):
    new_x = starting_point[0] + slope_parameters[0]
    new_y = starting_point[1] + slope_parameters[1]
    new_coordinates = (new_x, new_y)
    print(f'Starting coordinates: {starting_point}')
    print(f'Slope parameters: {slope_parameters}')

    row_count = len(map)
    current_position = starting_point
    current_row = current_position[0]

    while row_count >= current_row:
        new_position = 
        print(current_row)

    # for row in range(row_count):
    #     if current_row >= (row_count - 1):
    #         print('breaking')

    # def tree_mapper(map):
    #     tree_count = 0
    #     def space_analyzer(space):
    #         if space == "#":
    #             print(f'This space contains a tree')
    #             tree = 0
    #             return tree
    #         else:
    #             print(f'This space does not contain a tree')
    #             tree = 1
    #             return tree
    #         pass

        

    #     r_count = 1
    #     for row in map:
    #         row_length = len(row)
    #         for column in map:
    #             column_length = len(column) 
    #             for j in range(column_length):  
    #                 for i in range(row_length):
    #                     map_space = map[i][j]
    #                     print(map_space)
    #                     map_space
    #                     current_position = (i, j)
    #                     print(f"Current position: {current_position}")
    #                     is_tree = space_analyzer(map_space)
    #                     if is_tree == 0:
    #                         tree_count +=1
 
    #                 r_count += 1



        # return tree_count

    print(tree_mapper(map))

    print(f"New coordinates: {new_coordinates}")
    return new_coordinates

move_toboggan((0,0), (3,1), test_input)

print(test_input[0][0])
