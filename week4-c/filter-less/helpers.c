#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    // Calcular el avg value de colores en cada pixel
    // Si el valor de cada pixel es igual en los tres colores se convierte en grayscale
    int avg = 0;

    // Calculamos el avg iterando por cada pixel de la imagen
    // Para acceder al valor del color usamos typedef struct BYTE  rgbtBlue
    for(int i = 0; i < height; i++)
    {
        for(int j = 0; j < width; j++)
        {
            // La suma y division nos va a dar un float, que redondeamos y conver
            avg = (int) round((image[i][j].rgbtBlue + image[i][j].rgbtGreen + image[i][j].rgbtRed) / 3.0);

            image[i][j].rgbtBlue = avg;
            image[i][j].rgbtGreen = avg;
            image[i][j].rgbtRed = avg;
        }
    }
    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    // Loop over all pixels
    int sepiaRed = 0; int sepiaGreen = 0; int sepiaBlue = 0;

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            // Compute sepia values we need to round the float results and convert to integer
            sepiaRed = (int) round(.393 * image[i][j].rgbtRed + .769 * image[i][j].rgbtGreen + .189 * image[i][j].rgbtBlue);
            sepiaGreen = (int) round(.349 * image[i][j].rgbtRed + .686 * image[i][j].rgbtGreen + .168 * image[i][j].rgbtBlue);
            sepiaBlue = (int) round(.272 * image[i][j].rgbtRed + .534 * image[i][j].rgbtGreen + .131 * image[i][j].rgbtBlue);

            // Para evitar errores, en el que el valor es mayor que el maximo
            if (sepiaRed > 255)
            {
                sepiaRed = 255;
            }

            if (sepiaGreen > 255)
            {
                sepiaGreen = 255;
            }

            if (sepiaBlue > 255)
            {
                sepiaBlue = 255;
            }

            // Update pixel with sepia values
            image[i][j].rgbtRed = sepiaRed;
            image[i][j].rgbtGreen = sepiaGreen;
            image[i][j].rgbtBlue = sepiaBlue;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE temp[height][width];

    int ourWidth = 0;

    // Si la width es un valor par
    if (width % 2 == 0)
    {
        // No hace falta que analicemos todos los pixeles, como solo vamos a reflejar
        // con calcular la mitad nos vale
        ourWidth = width / 2;
    }
    else // si es impar
    {
        ourWidth = width / 2 + 1;
    }

    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < ourWidth; j++)
        {
            // Swap pixels
            temp[i][j] = image[i][j];
            image[i][j] = image[i][width -1 -j];
            image[i][width -1 -j] = temp[i][j];
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE temp[height][width];

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            float tempRed = 0, tempGreen = 0, tempBlue = 0;
            int pixelCount = 0;

            for (int local_i = i - 1; local_i <= i + 1; local_i++)
            {
                for (int local_j = j - 1; local_j <= j + 1; local_j++)
                {
                    if (local_i >= 0 && local_i < height && local_j >= 0 && local_j < width)
                    {
                        tempRed += image[local_i][local_j].rgbtRed;
                        tempGreen += image[local_i][local_j].rgbtGreen;
                        tempBlue += image[local_i][local_j].rgbtBlue;

                        pixelCount++;
                    }
                }
            }
            // update the pixel value to have the avg
            temp[i][j].rgbtRed = round(tempRed / pixelCount);
            temp[i][j].rgbtGreen = round(tempGreen / pixelCount);
            temp[i][j].rgbtBlue = round(tempBlue / pixelCount);
        }
    }
    // Copy blurred pixels back to the original imag
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j] = temp[i][j];
        }
    }

    return;
}
