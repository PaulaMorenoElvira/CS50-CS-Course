#include <stdio.h>
#include <cs50.h>

// Prototipos de funciones
int get_cents(void);
int calculate_quarters(int cents);
int calculate_dimes(int cents);
int calculate_nickels(int cents);
int calculate_pennies(int cents);

int main(void)
{
    // Obtener el número de centavos
    int cents = get_cents();

    // Calcular número de quarters
    int quarters = calculate_quarters(cents);
    cents = cents - quarters * 25;

    // Calcular número de dimes
    int dimes = calculate_dimes(cents);
    cents = cents - dimes * 10;

    // Calcular número de nickels
    int nickels = calculate_nickels(cents);
    cents = cents - nickels * 5;

    // Calcular número de pennies
    int pennies = calculate_pennies(cents);
    cents = cents - pennies * 1;

    // Sumar total de monedas
    int coins = quarters + dimes + nickels + pennies;

    // Imprimir resultado
    printf("%i\n", coins);
}

// Pedir al usuario el cambio que debe
int get_cents(void)
{
    int cents;
    do
    {
        cents = get_int("Change owed: ");
    }
    while (cents < 0);
    return cents;
}

// Calcular quarters
int calculate_quarters(int cents)
{
    int quarters = 0;
    while (cents >= 25)
    {
        cents -= 25;
        quarters++;
    }
    return quarters;
}

// Calcular dimes
int calculate_dimes(int cents)
{
    int dimes = 0;
    while (cents >= 10)
    {
        cents -= 10;
        dimes++;
    }
    return dimes;
}

// Calcular nickels
int calculate_nickels(int cents)
{
    int nickels = 0;
    while (cents >= 5)
    {
        cents -= 5;
        nickels++;
    }
    return nickels;
}

// Calcular pennies
int calculate_pennies(int cents)
{
    int pennies = 0;
    while (cents >= 1)
    {
        cents -= 1;
        pennies++;
    }
    return pennies;
}
