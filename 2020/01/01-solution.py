'''
--- Day 1: Report Repair ---
After saving Christmas five years in a row, you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them stars. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

To save your vacation, you need to get all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

For example, suppose your expense report contained the following:

1721
979
366
299
675
1456
In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

Your puzzle answer was 100419.

--- Part Two ---
The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.

In your expense report, what is the product of the three entries that sum to 2020?

Your puzzle answer was 265253940.

'''
from pathlib import Path
import os, random

here = Path(__file__).parent.resolve()
os.chdir(here)


expense_report = os.path.join(here, "input.txt")

with open(expense_report, 'r') as f:
    expense_lines = f.readlines()
    expense_lines = [x.strip() for x in expense_lines]

def calculate_expense_2020_part1(list_input, sum):
    for i in list_input:
        for j in list_input:
            # this was weird to me, because I thought using i + j would work since it 
            # did in the test case, but I had to explicitly give int() to the variables to ensure I didn't get type errors
            # this worked with test_case because they are already recognized as int
            if int(i) + int(j) == int(sum):
                print(f'located a combination that matches:\n{i} + {j} == {sum}')
                result = int(i) * int(j)
                print(f'result: {result}')
                return result
    pass

def calculate_expense_2020_part2(list_input, sum):
    for i in list_input:
        for j in list_input:
            for k in list_input:
                if int(i) + int(j) + int(k) == int(sum):
                    print(f'located a combination that matches:\n{i} + {j} + {k} == {sum}')
                    result = int(i) * int(j) * int(k)
                    print(f'result: {result}')
                    return result
    pass


def test_case(test_input, test_answer, sum, part):
        if part == 1:
            test = calculate_expense_2020_part1(test_input, sum)
            if test == test_answer:
                test_result = 'test success'
                print(test_result)
            else:
                test_result = 'test fail'
                print(test_result)
            return test_result
        if part == 2:
            test = calculate_expense_2020_part2(test_input, sum)
            if test == test_answer:
                test_result = 'test success'
                print(test_result)
            else:
                test_result = 'test fail'
                print(test_result)
            return test_result
        

test_part_1 = test_case([1721, 979, 366, 299, 675, 1456], 514579, 2020, 1)
test_part_2 = test_case([1721, 979, 366, 299, 675, 1456], 241861950, 2020, 2)
calculate_expense_2020_part1(expense_lines, 2020)
calculate_expense_2020_part2(expense_lines, 2020)
