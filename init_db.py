import sqlite3

connection = sqlite3.connect('database.db')


with open('schema.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()

cur.execute("INSERT INTO posts (title, content) VALUES (?, ?)",
            ('First Post', 'Content for the first post')
            )

cur.execute("INSERT INTO posts (title, content) VALUES (?, ?)",
            ('Second Post', 'Content for the second post')
            )

# Insert dummy data into the 'Item' table
cur.execute("INSERT INTO Item (itemName, itemType) VALUES (?, ?)", ('Book1', 'books'))
cur.execute("INSERT INTO Item (itemName, itemType) VALUES (?, ?)", ('Magazine1', 'periodicals'))
cur.execute("INSERT INTO Item (itemName, itemType) VALUES (?, ?)", ('CD1', 'recordings'))

# Insert dummy data into the 'Author' table
cur.execute("INSERT INTO Author (authorLastName, authorFirstName) VALUES (?, ?)", ('Doe', 'John'))
cur.execute("INSERT INTO Author (authorLastName, authorFirstName) VALUES (?, ?)", ('Smith', 'Jane'))
cur.execute("INSERT INTO Author (authorLastName, authorFirstName) VALUES (?, ?)", ('Brown', 'Alice'))

# Insert dummy data into the 'ItemAuthor' table
# Assuming you have corresponding item and author IDs
cur.execute("INSERT INTO ItemAuthor (itemID, authorID) VALUES (?, ?)", (1, 1))  # Book1 by John Doe
cur.execute("INSERT INTO ItemAuthor (itemID, authorID) VALUES (?, ?)", (2, 2))  # Magazine1 by Jane Smith
cur.execute("INSERT INTO ItemAuthor (itemID, authorID) VALUES (?, ?)", (3, 3))  # CD1 by Alice Brown

connection.commit()
connection.close()