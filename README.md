# Animal Shelter Database

A webpage for a fictional animal shelter to interact with relevant data.

## Table of Contents

1. [Introduction](#introduction)
2. [Usage](#usage)
3. [Features](#website-features)
4. [Technologies Used](#technologies-used)
5. [Setup Instructions](#setup-instructions)
6. [Hosting](#hosting)

## Introduction

This webpage was created to practice implementing MySQL. It's a website for a fictional Animal Shelter that was designed to assist them in managing information related to their animals and patrons (people who adopt and foster animals from them). The website provides a clean and intuitive interface for all CRUD operations they would need: viewing, adding, updating, and deleting information. 

## Usage

- Navigate through the website using the provided navigation links.
- Use the forms to add animals, patrons, adoption/foster status and medical records.
- View and edit existing information using the provided interfaces.
- Delete records.
  
## Website Features

- **Animal Management**: Store and manage information about animals, including their name, species, breed, age, gender, and adoption/foster status.

- **Patrons**: Keep track of fosters and adopters and their contact information.

- **Vaccines**: Record vaccines that the shelter administers and the number of doses available.
  
- **Vaccines Administered**: Displays the vaccines that have been administered to each animal along with their date given and expiration date.

- **Prescriptions**: Record the current prescriptions and frequency for the animals.

- **Fosters and Adoptions**: Keep track of fosters and adopttions and the animals and patrons they are associated with.

## Technologies Used

- HTML and CSS: Structuring and styling the web pages for a user-friendly experience.

- JavaScript: Implementing interactive features and functionalities on the website as well as communicating with the server to send updates to the database and retrieve info to populate the webpage.

- Node.js: Serving the website and handling server-side operations such as retrieving info from the database and sending database updates.

- Handlebars: Templating library for dynamically rendering web pages.

- MySQL: Database management system for storing and retrieving data. The database schema is defined in the SQL script `animal_shelter_DDL.sql` along with some starter data.

## Setup Instructions

To set up the website locally, follow these steps:

1. Clone the repository: `git clone https://github.com/s-egge/animal-shelter-database.git`
2. Navigate to the project directory: `cd <project-directory>`
3. Install the required dependencies: `npm install`
4. Configure the MySQL database connection in the `db-connector.js` file.
5. Set up the database schema using the provided SQL script: `animal_shelter_DDL.sql`.
6. Start the server: `npm start`
7. Access the website locally: Open your web browser and go to `http://localhost:27469`

## Hosting

The webpage is currently hosted on Oracle Cloud via their free tier. It can be accessed [here](http://146.235.204.101:27469/).
