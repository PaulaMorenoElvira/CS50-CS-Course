from flask import Flask, render_template, request, redirect
import sqlite3

app = Flask(__name__)

# Inicialización de la base de datos
def init_db():
    conn = sqlite3.connect("vocabulary.db")
    db = conn.cursor()
    db.execute("""
        CREATE TABLE IF NOT EXISTS vocabulary (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            category TEXT NOT NULL,
            german TEXT NOT NULL,
            translation TEXT NOT NULL
        )
    """)
    conn.commit()
    conn.close()

init_db()

# Página principal
@app.route("/")
def index():
    return render_template("index.html")

# Añadir vocabulario
@app.route("/add", methods=["GET", "POST"])
def add():
    conn = sqlite3.connect("vocabulary.db")
    db = conn.cursor()

    if request.method == "POST":
        category = request.form["category"]
        german = request.form["german"]
        translation = request.form["translation"]
        new_category = request.form.get("new_category")  # nueva categoría si se escribe

        # Si se ha escrito una categoría nueva, usarla
        if new_category:
            category = new_category

        # Si no se elige ninguna categoría dar ERROR
        if not category:
            conn.close()
            return "Error: You must choose or create a category."

        db.execute("INSERT INTO vocabulary (category, german, translation) VALUES (?, ?, ?)",
                   (category, german, translation))
        conn.commit()
        conn.close()
        return redirect("/add")

    # Cargar categorías para el <select>
    db.execute("SELECT DISTINCT category FROM vocabulary")
    categories = [row[0] for row in db.fetchall()]
    conn.close()

    return render_template("add.html", categories = categories )

# Editar el vocabulario de la base de datos
@app.route('/edit', methods=['GET', 'POST'])
def edit():
    results = []
    query = ""
    conn = sqlite3.connect("vocabulary.db")
    conn.row_factory = sqlite3.Row  # esto permite acceder a columnas por nombre
    db = conn.cursor()

    if request.method == 'POST':
        query = request.form.get('search_word', '')
        results = db.execute(
            "SELECT * FROM vocabulary WHERE german LIKE ?",
            ('%' + query + '%',)
        ).fetchall()

    conn.close()

    return render_template('edit.html', results=results, query=query)

# Funcion para eliminar una palabra de la bse de datos
@app.route('/delete/<int:id>', methods=['POST'])
def delete(id):
    conn = sqlite3.connect("vocabulary.db")
    db = conn.cursor()
    db.execute("DELETE FROM vocabulary WHERE id = ?", (id,))
    conn.commit()
    conn.close()
    return redirect('/edit')

#  Estudiar vocabulario
@app.route("/study", methods=["GET", "POST"])
def study():
    conn = sqlite3.connect("vocabulary.db")
    db = conn.cursor()

    # Si el usuario envía una categoría (desde el formulario)
    if request.method == "POST":
        category = request.form["category"]
        db.execute("SELECT id, german, translation FROM vocabulary WHERE category = ?", (category,))
        words = db.fetchall()
        conn.close()
        return render_template("study.html", words=words, category=category)

    # Si entra por primera vez, mostramos la lista de categorías
    db.execute("SELECT DISTINCT category FROM vocabulary")
    categories = [row[0] for row in db.fetchall()]
    conn.close()
    return render_template("choose_category.html", categories=categories)

if __name__ == "__main__":
    app.run(debug=True)


