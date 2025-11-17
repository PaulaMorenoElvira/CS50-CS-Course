
# LET'S LEARN GERMAN

edx username: paulamoreno09
GitHub username: PaulaMorenoElvira

#### Video Demo: [(https://youtu.be/pAXm4XLuW1Q)]

#### Description:

This project consists of a web to study German through the use of flashcards.

The main programming languages used in this project are: Flask, CSS, HTML, SQL.

The main components of this web are:

-	The app.py file, with all our functions.

-	The folder called templates: which contains the 5 html files used in the web ( index.html, study.html, add.html, choose_category.html, and edit.html).

-	The folder called static: which contains the image (libros.jpg) shown in the main page, and the style.css file used to design the style of the web.

-	And lastly the database with the vocabulary that the user will study. Our database  consists of a table that has four columns: id, category, german_word, and translation.


The step-by-step functioning of the program is:

In the main page, index.html we are shown two options: we can either add new vocabulary to our database or to study vocabulary that currently exists in our database.

If we click study, we will be redirected to the choose_category.html file, in which we are shown different categories of vocabulary, the user will then choose what category of vocabulary he/she wants to study at the moment. If we don’t want to study at the moment, we can always click the back button, which will immediately redirect us back to the main page.

If the user chooses a category to study, he will be redirected to the study.html file, in this file we can see many things. AT the top of the page, just below the name of the category that the user has chosen, we see 2 buttons: show german and show translation.

By clicking the show german button, all the flash cards will show their german words, they are already showing the german word by default. But if we click show translation, all the cards will now show their Spanish meaning. Aside from this, we can also click on each flash card indivisually as we study, to see the german word or the translation.

At the bottom of the page we see 2 additional buttons, the other categories button, which if we click it will take us once again to the choose_category.html file, so that we can study another category. And we also have the back button, which takes us to the main page.

Once again starting from the main page, if we click the add vocabulary button, we will be directed to the add.html file. And in this page we see 4 white boxes. If we want to add a new word to our database we will first select the category to which the new word belongs, or simply write a new category in the box below, if it does not belong to an existing category. In the third white box, we will write the word in german, and in the fourth white box we will write the translation of the word. Once this is done, we will click the save button to properly store the word into our database.

If what we want isn’t to add a new word but to edit an already existing one, we will click on edit. This will take us to the edit.html file. In this page we habe a white box in which we will write the german word that we want to edit. The word must be written in german, if we write the translation it will not work. The search will also work without writing the article in case it is a noun.

Once we write the word, we will click the below button of search, and our web will show us a table of words in our database that coincide with the word we just searched for. The resulting table shows the word in german, its translation, and lastly we have a column which gives us the option to delete the word.

This delete burtton is useful for when we have repeated or misspelled words in our database. If we click the button, we will be asked if we are sure that we want to delete that word, and to confirm the deletion, or to cancel the action.

Once we are done with the editing of our database we can once again go back to the main page by clicking the back button.
