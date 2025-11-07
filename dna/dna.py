import csv
import sys

def main():

    # Check for command-line usage
    if len(sys.argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt\n")
        sys.exit(1)

    # Read database file into a variable
    rows = []
    with open(sys.argv[1], "r") as file:
        reader = csv.DictReader(file)
        # print(reader.fieldnames) # header row, wherein each string is the name of some field
        for row in reader:
            rows.append(row)

    # Read DNA sequence file into a variable
    with open(sys.argv[2], "r") as seq_file:
        sequence = seq_file.read()

    # Find longest match of each STR in DNA sequence
    str_counts = {}
    for key in rows[0].keys():
        if key == "name": # Se salta la columna "name", porque no es una secuencia de ADN
            continue
        str_counts[key] = longest_match(sequence, key) # calcula cuántas veces seguidas se repite esa secuencia

    # Check database for matching profiles
    # Recorre cada persona del CSV y compara sus valores con los obtenidos del ADN
    for row in rows:
        match = True
        for key in row.keys():
            if key == "name":
                continue

            if int(row[key]) != str_counts[key]:
                match = False
                break

        # Si match == True, significa que el ADN coincide completamente con esa persona:
        if match:
            print(row["name"])
            return

    print("No match")


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
