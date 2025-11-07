#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

// Points assigned to each letter of the alphabet
int POINTS[] = {1,3,3,2,1,4,2,4,1,8,5,1,3,1,1,3,10,1,1,1,1,4,4,8,4,10};

int compute_score(string word);

int main(void)
{
    // Obtener la palabra de los jugadores
    string play1 =get_string("Player 1: ");
    string play2 =get_string("Player 2: ");

    // Obtener puntuacion de cada palabra
    int score1 = compute_score(play1);
    int score2 = compute_score(play2);

    // Imprimir resultado de la ronda

    if (score1 > score2)
    {
        printf("Player 1 wins!\n");
    }
    else if (score1 < score2)
    {
        printf("Player 2 wins!\n");
    }
    else
    {
        printf("Tie!\n");
    }
}

int compute_score(string word)
{
    int score = 0;

    // Loop through each letter in the word
    for (int i = 0; i < strlen(word); i++)
    {
        // Uppercase and lowercase should have the same value in scrabble
        // The letter 65 in ASCII is number 0 in array (for uppercase)
        // EX: In ASCII A = 97 and in array A = 0

        if (isupper(word[i]))
        {
            score += POINTS[word[i]- 65];
        }

        // for lowercase we should substract 97

        if (islower(word[i]))
        {
            score += POINTS[word[i]- 97];
        }
    }
    return score;
}
