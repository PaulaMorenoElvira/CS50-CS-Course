from cs50 import get_int

# First ask the user for a number no greater than 8
number = get_int("Height: ")
while (number > 8 or number <= 0):
    number = get_int("Height: ")

# If the number is valid we make the piramid
# When number <= 8:
for i in range(1, number + 1):
    print(" " * (number - i) + "#" * (i))
