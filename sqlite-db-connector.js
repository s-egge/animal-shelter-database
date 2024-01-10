// Get an instance of mysql we can use in the app
var sqlite3 = require('sqlite3').verbose();

// Path to database
var db = new sqlite3.Database(
        'animal-shelter-database.db'
    );

// Export it for use in our application
module.exports.db = db;