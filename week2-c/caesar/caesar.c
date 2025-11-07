#include <cs50.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, string argv[])
{
    // Validar que la key este bien (no sea letra o numeors separados)

    //Solo no hay dos comand line arguments: ./cesar y key(numerica) da error
    if (argc != 2)
    {
        printf("Usage ./ceasar key\n");
        return 1;
    }

    // Si la key no es un numero, es una letra o palabra, nos da error
    for (int i = 0, n = strlen(argv[1]); i < n; i++)
    {
        if (isdigit(argv[1][i]) == 0)
        {
           printf("Usage ./ceasar key\n");
           return 1;
        }
    }

    // La key ahora es una string '6' y hay que pasarlo a int, 6
    int key = atoi(argv[1]);

    // Si la key es mas grande que la len del abecedaria le restamos la len del abecedario para que vuelva a empezar a contar desde el ppo
    while (key > 26)
    {
        key = key - 26;
    }

    // Obtener el input del usuario (plaintext)
    string plain  = get_string("Plaintext: ");

    // Codificar el input del usuario (ciphertext)
    printf("Ciphertext: ");
    int temp = 0;

    for (int i = 0, n = strlen(plain); i < n; i++)
    {
        // Si es una letra lo encriptamos (tanto upper como lower se tiene que mantener en la encriptacion)
        if (isalpha(plain[i]))
        {
            if (isupper(plain[i]))
            {
                temp = plain[i] + key;
                if (temp > 90) // valor mas alto de las letras mayusculas, habria que volver a la A que es 65
                {
                    printf("%c", temp - 26); // 26, xq hay 26 letras en el abecedario entonces hay que volver al principio
                }
                else
                {
                    printf("%c", temp);
                }
            }
            else
            {
                temp = plain[i] + key;

                // Ahora lo mismo pero con el rango de las lowercase
                if (temp > 122) // valor mas alto de las letras mayusculas, habria que volver a la A que es 97
                {
                    printf("%c", temp - 26); // 26, xq hay 26 letras en el abecedario entonces hay que volver al principio
                }
                else
                {
                    printf("%c", temp);
                }
            }
        }

        // If it is numerical or punctuation no lo encriptamos
        else
        {
            printf("%c", plain[i]);
        }
    }
    printf("\n");
}
