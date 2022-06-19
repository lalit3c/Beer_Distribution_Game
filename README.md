# Beer_Distribution_Game

### Sprint 4
- Frontend:
	- Created Costumizing Games page (/CostumizingGames) 
	- Created the Game Screen page (/GameScreen)
	- Fixed Sign up page (/SignUp)
	- Created Instructor Settings page (/settings)
	- Fixed 'Learn More' button on the homepage
- Testing:
	- Created test for the costumizing games page. 
	- Note: Other tests for all the other pages were done by the previous sprints. 
- Backend:		
	- Fixed Sign up page (it was not creating users)


Note: This project's file structure was not conventional. There were two projects created with React. One can be found in `beer_game\server\templates\index\src` and the other one in `beer_game\server\templates\player\src`. Both projects contained completely different UIs. Because of time limitation we decided to continue our work with the first project, since it followed a better logic and had a more appealing UI. 

To run the project please go to `beer_game\server\templates\index\src` and run the following command:

```
npm run start
```

---

## Table of Contents

<!-- TOC -->

- [Beer Game](#beer-game)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Software requirements](#software-requirements)
  - [Architecture](#architecture)
  - [Setup and Deployment](#setup-and-deployment)
    - [Setup frontend](#setup-frontend)
    - [Setup backend](#setup-backend)
  - [Running the application](#running-the-application)
  - [File structure](#file-structure)
  - [Tests](#tests)
    - [Run frontend tests](#run-frontend-tests)
    - [Run backend tests](#run-backend-tests)
  - [Documentation](#documentation)
    - [Generate frontend documentation](#generate-frontend-documentation)
    - [Generate backend documentation](#generate-backend-documentation)
  - [Individual contributions](#individual-contributions)
    - [Sprint 3 - 13/4/2021](#sprint-3)

<!-- /TOC -->

# Introduction



The previous code base the landing page of the website immplemented and routing to some react components (like demonstration of game settings)

Our main focus was to complete the frontend of the project and to provide primitive backend features like user sign-up and user sign-in. We used compiled ReactJS code for the frontend of the project, and Django as the backend of our application. We used MySQL for the database.

# Software Requirements

Software requirements have already been explained in first assignment but, again for convenience, a general overiew of our goal, what it offers and what it should also offer for the next sprint are:

- The user can either be an instructor or a player.
- A student can sign themselves to the application and then an instructor can find them on the service and add them to games.
- A host can select one of the available games pause it, and change the game parameters if the game is not paused.
- To host a game, an instructor must register himself/herself using the Sign Up page.
- Once the game starts, the player screen is split up in 4 quadrants with each quadrant serving a specific purpose.
- The user will be able to access “What it is” and “How to Play” sections for additional information regarding the supply-chain game.

## Architecture

| Component      | Implementation        |
| -------------- | --------------------- |
| Database       | MySQL                 |
| Backend        | Python with Django    |
| Frontend       | Compiled React.js     |
| Communication  | HTTP Requests         |

# File Structure

The work done in this sprint is located the beer_game directory and the mysql_setup directory. The old code base is simply the code base that we had inherited from the proevious sprint and can be used to compare the improvements made in this sprint

<pre>
    <code>
       \--beer_game (the code for this sprint)
        \--beer_game
          |-- settings.py (contains all the files related to server configuration, like the database used, cors_whitelist etc.)
          | -- urls.py (contains the routing information to differents app in the django server. Server is the only app at this point in time)
        \--server (the app which handles all our functionalities up to this point)
          \--templates (the HTML, CSS, JS and JS bundles served from the website are contained here, the static files used by the pages are also inside on their own static folder)
            \--index (a react project that creates an SPA for the index page)
              \-- src (the source code for this project, which has to be built before the server is launched using npm run build)
            \--instructor (a react project that creates an SPA for the instructors)
               \-- src (the source code for this project, which has to be built before the server is launched using npm run build)
            \--player (a react project that creates an SPA for the players)
               \-- src (the source code for this project, which has to be built before the server is launched using npm run build)
            \--game_screen (contains the HTML, CSS and JS code for the game screen)
          |-- admin.py (register the models that you create here if you want to manipulate them on the admin page of the web application)
          |-- forms.py (create your own forms and use them for various purposes like validation of data)
          |-- models.py (create your ORMs here)
          |-- urls.py (decide which functions should run if a specific route is visited)
          |--views.py (write the functions that define you application logic here)
          |-- testmodels.py and test_urls.py (files containing test cases for the database semnatics and feasible status codes across the routes once the server is running)
       \--mysql_setup (all the files needed to use MySQL as django's database)
       \--requirements.txt (project dependencies)
       \-- Backend_Documentation.pdf (documentation explaining how the backend works)
       \--frontend_compiler.sh (Bash script to simply frontend compilation)
    </code>
</pre>

# Setup and Deployment

### Setup frontend

- Download Node.js from the official [website](https://nodejs.org/en/).
- Recommendation: Use npm verion 6.14.10
```bash
nvm install 6.14.10 
nvm use 6.14.10
````
- The frontend will be served by the django server itself, and the react code for the frontend is in the **beer_game/server/templates** directory
- Compile the frontend react code using the frontend_compiler.sh script. (It will compile the react code in the beer_game/server/templates directory to HTML, CSS, and JS  so that the django server can start serving it and also make neccessary adjustments along the way so that the frontend and the backend can securely communicate with eachother.)
```bash
chmod +x frontend_compiler.sh
./frontend_compiler.sh
```

### Setup backend

- Make sure you have python and pip3 virtualenv installed
- Create a virtual environment using pip3 virtualenv module. Activate the virtual environment and install the requirements for the backend.

````bash
virtualenv serverenv
source serverenv/bin/activate
sudo apt install python3-dev
sudo apt install python3-dev libmysqlclient-dev default-libmysqlclient-dev
pip install -r requirements.txt
````

- Install MySQL server in your computer, if not installed
```bash
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
````

- Create a user that django uses in your computer's MySQL database
```bash
cd mysql_setup
sudo mysql -u root -p 
source database_config.sql

````

- Setup the django server. Make sure that when the server runs it runs on localhost:8000

```bash
cd beer_game
python3 manage.py makemigrations
python3 manage.py makemigrations server
python3 manage.py migrate
````

# Running the Application

- To run the application do the following

```bash
cd beer_game
python3 manage.py runserver localhost:8000
```

-Make sure that the server runs at **localhost:8000** to prevent authentication-related issues

# Tests

### Run frontend tests

Run test for each react js bundle used on the project.

```bash
cd beer_game/server/templates


# Test for the index react JS bundle
cd index       
npm test 


# Test for the instructor react JS bundle
cd ../instructor     
npm test

# Test for the player react JS bundle
cd ../instructor     
npm test
```

For testing the game_screen template, refer to the Game_Screen_Documentation located in beer_game/server/templates/game_screen
### Run backend tests

```bash
cd beer_game/
python3 manage.py test
````
---

# Documentation

### Generate frontend documentation

Change into the `frontend` directory. Run the documentation script.

```bash
cd beer_game/server/templates

# Generate documentation for the index react JS bundle
cd index       
npm run doc

# Generate documentation for the instructor react JS bundle
cd ../instructor     
npm run doc

# Generate doucmentation for the player react JS bundle
cd ../instructor     
npm run doc
```
Documentation for the game_screen can be found at beer_game/server/templates/game_screen

### Backend documentation

Provided in backend_documentation.pdf

# Individual contribution

## Sprint 3
Parts of the code was reused from the code of our members' in previous sprint and adapted. We used the landing page that we inherited from the previous sprint. 

Tuan Pham and Subigya Paudel

- Frontend:
	- Completed signed-in views
	- Implemented authentication and signing-up of users and give feedback when invalid data is entered.
	- Connecting with the backend, making server calls
   	
- Backend:
	- Created the backend for storing data and serving React JS bundles to a browser.
	- Created a general user object and a mapping object that determines whether the user is a player or an instructor.
	- Made django forms to create new users
	- Implemented authenticated views (Instructor View(Create new game, edit games, pause games, create default game,  mystudents etc)), player views(my_games, and game screen, etc)

- Tests:
	- Backend tests are contained in the folder /beer_game/server/tests. Comprises of test suites for the database structure (chained deletion of all user data, check the test_models.py for more details), route responses (test_url.py) , and user creation (test_forms.py)

	- Frontend tests for each react js bundle using jest (tests for the previous sprint failed to run)
	- **Refer to the testing section above for details to run the tests**
	
Due to time limit, we have only developed basic testing with few test cases for the components mentioned above. UI test cases and routing test cases are complex and can not be correctly tested without prior unification of both backend and frontend communication.

## Sprint 2

- Petri Gjoni : Main page+ Login/Signup page(only the interface) + README + documentation(JsDocs/comments, found inside the source files) + unit testing using enzyme.
- Eunhye Kim : Supply Chain page(What it is) + Settings for the game(Customizing games) 

The previous project was a simple html page containing only redirected pages with no visuality, creativity and no functionality. Given the missing points, we decided to swithc to React.js from scratch. We added different pages explained above, a brand new catchy interface , unit testing , and JsDocs documentation.
Still since the project was too much undeveloped we took our time to work on the front end.

---



