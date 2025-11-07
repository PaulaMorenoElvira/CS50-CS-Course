from cs50 import get_string

# Ask the user for text
text = get_string("Text: ")

# Count the number of letters, words, and sentences in the text
letters = 0
words = 1
sentences = 0

for char in text:
    # Si el caracter actual no es puntuacion ni espacio, es una letra
    if char.isalpha():
        letters += 1

    # Si el caracter es un espacio, indica que ha terminado una palabra, empezamos con words = 1 xq sino la ultima palabra no se va a contar
    if char == " ":
        words += 1

    # Si el character es un punto o esclamacion/interrrogacion, es una nueva frase
    if char == "." or char == "!" or char == "?":
        sentences += 1

# Calculate the grade with Coleman-Liau index
# L = average number of letters per 100 words, and S is the average number of sentences per 100 words

L = (letters * 100) / words
S = (sentences * 100) / words

grade = round(0.0588 * L - 0.296 * S - 15.8)


# Print the grade
if grade < 1:
    print("Before Grade 1")

elif grade > 16:
    print("Grade 16+")

else:
    print("Grade ", grade)

