#include <stdio.h>
#include <cs50.h>

int main(void)
{// program that recreates a pyramid, using hashes as bricks
    int h = 0; // hay que inicializar antes que sino el while no funciona

    // The user specifies the height of the piramid
    while (h < 1 || h > 8)
    {
        h = get_int("Height: ");
    }

    //draw the piramid
    for (int i = 0; i < h; i++)
    {
        // Imprimir espacios (decrecen en cada fila)
        for (int j = 0; j < h - i - 1; j++)
        {
            printf(" ");
        }

        // Imprimir hashtags (aumentan en cada fila)
        for (int k = 0; k <= i; k++)
        {
            printf("#");
        }

        // Nueva línea
        printf("\n");
    }
}
