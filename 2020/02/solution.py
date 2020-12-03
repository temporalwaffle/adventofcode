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

Your puzzle answer was 434.

The first half of this puzzle is complete! It provides one gold star: *

--- Part Two ---
While it appears you validated the passwords correctly, they don't seem to be what the Official Toboggan Corporate Authentication System is expecting.

The shopkeeper suddenly realizes that he just accidentally explained the password policy rules from his old job at the sled rental place down the street! The Official Toboggan Corporate Policy actually works a little differently.

Each policy actually describes two positions in the password, where 1 means the first character, 2 means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of "index zero"!) Exactly one of these positions must contain the given letter. Other occurrences of the letter are irrelevant for the purposes of policy enforcement.

Given the same example list from above:

1-3 a: abcde is valid: position 1 contains a and position 3 does not.
1-3 b: cdefg is invalid: neither position 1 nor position 3 contains b.
2-9 c: ccccccccc is invalid: both position 2 and position 9 contain c.
How many passwords are valid according to the new interpretation of the policies?


'''

from pathlib import Path
import os, re

here = Path(__file__).parent.resolve()
os.chdir(here)


password_list = os.path.join(here, "input.txt")
with open(password_list, 'r') as f:
    password_lines = f.readlines()
    password_lines = [x.strip() for x in password_lines]


test_case =['1-3 a: abcde','1-3 b: cdefg','2-9 c: ccccccccc']


def password_audit(input_list):
    def password_policy_checker(password_key, policy):
        def old_policy():
            # split input value using regex sample input: '1-3 a: abcde'
            # sample output: ['1', '3', 'a', 'abcde']
            pass_key = re.split(r'-|\s|: ', password_key)
            min_count = pass_key[0] 
            max_count = pass_key[1]
            letter = pass_key[2]
            password = pass_key[3]
            count = 0
            for l in password:
                if l == letter:
                    count += 1
                    pass
            if count < int(min_count) or count > int(max_count):
                print("this password is invalid")
                return 1
            if count >= int(min_count) and count <= int(max_count):
                print("this password is valid")
                return 0
            pass
        def new_policy():
            # split input value using regex sample input: '1-3 a: abcde'
            # sample output: ['1', '3', 'a', 'abcde']
            pass_key = re.split(r'-|\s|: ', password_key)
            pos_1 = int(pass_key[0]) - 1
            pos_2 = int(pass_key[1]) - 1
            letter = pass_key[2]
            password = pass_key[3]    
            if password[pos_1] == letter and password[pos_1] != password[pos_2]:
                print("this password is valid")
                return 0   
            elif password[pos_2] == letter and password[pos_1] != password[pos_2]:
                print("this password is valid")
                return 0   
            else:
                print("this password is invalid")
                return 1
            pass
        if policy == "new":
            return new_policy()
        elif policy == "old":
            return old_policy()

    valid_password_count = 0
    invalid_password_count = 0
    for i in input_list:
        password = password_policy_checker(i, "new")
        if password == 0:
            valid_password_count += 1
        elif password == 1:
            invalid_password_count += 1
    return valid_password_count, invalid_password_count

print(password_audit(password_lines))

test