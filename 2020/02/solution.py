'''
--- Day 2: Password Philosophy ---
Your flight departs in a few days from the coastal airport; the easiest way down to the coast from here is via toboggan.

The shopkeeper at the North Pole Toboggan Rental Shop is having a bad day. "Something's wrong with our computers; we can't log in!" You ask if you can take a look.

Their password database seems to be a little corrupted: some of the passwords wouldn't have been allowed by the Official Toboggan Corporate Policy that was in effect when they were chosen.

To try to debug the problem, they have created a list (your puzzle input) of passwords (according to the corrupted database) and the corporate policy when that password was set.

For example, suppose you have the following list:

1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a given letter must appear for the password to be valid. For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

In the above example, 2 passwords are valid. The middle password, cdefg, is not; it contains no instances of b, but needs at least 1. The first and third passwords are valid: they contain one a or nine c, both within the limits of their respective policies.

How many passwords are valid according to their policies?

EXAMPLE:
least_number_of_times - most_number_of_times letter: password
1-3 a: abcde    # valid 
1-3 b: cdefg    # invalid
2-9 c: ccccccccc # valid
'''

from pathlib import Path
import os, random

here = Path(__file__).parent.resolve()
os.chdir(here)


# password_list = os.path.join(here, "input.txt")
# with open(password_list, 'r') as f:
#     password_lines = f.readlines()
#     password_lines = [x.strip() for x in password_lines]

# print(password_lines)

# for line in password_lines:
#     print(line)

test_case =['1-3 a: abcde','1-3 b: cdefg','2-9 c: ccccccccc']

def password_policy_checker(password_key):
    pass_key = password_key 
    key_len = len(pass_key)
    min_count = pass_key[0] 
    max_count = pass_key[2]
    letter = pass_key[4]
    password = ''
    for i in range(7, key_len):
        password += pass_key[i]
        print(password)
    count = 0
    for l in password:
        if l == letter:
            count += 1
        print(l)
        print(count)    
    pass


for t in test_case:
    password_policy_checker(t)