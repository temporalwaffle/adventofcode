

def get_puzzle_input ():
    with open('input.txt') as f:
        puzzle_data = f.read()
    return puzzle_data

def compute_captcha (puzzle_input):
    puzzle_data = puzzle_input
    for digit in puzzle_data:
        digit = current
        if current == previous:
            print(digit, "+", previous) 
    pass


def main ():
    compute_captcha(get_puzzle_input())
    pass

main()