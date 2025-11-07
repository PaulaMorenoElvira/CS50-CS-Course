from cs50 import get_float

# Ask the user for change
change = get_float("Change: ")

# The change cannot be a negative value
while change < 0:
    change = get_float("Change: ")

# The only coins available are quarters (25¢), dimes (10¢), nickels (5¢), and pennies (1¢).

# Convert dollars to cents (and round to avoid float precision errors)
cents = round(change * 100)

# Coin counters
quarters = cents // 25 # El // es una division entera (sin decimales), es decir, cuantas monedas de 25 me valen para el change
cents %= 25            # El % (modulo) es lo que resta de la division es decir los centimos que me quedan x devolver

dimes = cents // 10
cents %= 10

nickels = cents // 5
cents %= 5

pennies = cents # Como hemos ido quitandonos monedas antes, los centimos que queden seran tan pequeños q se pueden devolver en pennies

num_coins = quarters + dimes + nickels + pennies

# Total number of coins given to customer
print(num_coins)

