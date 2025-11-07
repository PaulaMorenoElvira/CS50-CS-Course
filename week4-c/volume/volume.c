// Modifies the volume of an audio file

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// Number of bytes in .wav header
const int HEADER_SIZE = 44;

int main(int argc, char *argv[])
{
    // Check command-line arguments
    if (argc != 4)
    {
        printf("Usage: ./volume input.wav output.wav factor\n");
        return 1;
    }

    // Open files and determine scaling factor
    FILE *input = fopen(argv[1], "r");
    if (input == NULL)
    {
        printf("Could not open file.\n");
        return 1;
    }

    FILE *output = fopen(argv[2], "w");
    if (output == NULL)
    {
        printf("Could not open file.\n");
        return 1;
    }

    float factor = atof(argv[3]);

    //TODO: Copy header from input file to output file
    // Utilizamos este data type uint8_t para leer el header, que representa 8 bits
    uint8_t header[HEADER_SIZE];
    fread(header, HEADER_SIZE, 1, input);
    fwrite(header, HEADER_SIZE, 1, output);

    // TODO: Read samples from input file and write updated data to output file
    //Con el int16_t podemos leer dos bits a la vez, que es el tamaño de nuestro audio file
    int16_t temp;
    while(fread(&temp, sizeof(int16_t), 1, input) != 0)
    {
        // El output sera xfactor veces mas alto que el input
        temp *= factor;
        fwrite(&temp, sizeof(int16_t), 1, output);
    }

    // Close files
    fclose(input);
    fclose(output);
}
