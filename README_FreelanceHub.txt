FREELANCEHUB — DJANGO + POSTGRESQL
=================================

This project uses Python, Django, PostgreSQL, HTML, CSS and JavaScript.
The Django admin site is the web interface for adding/editing records. pgAdmin
is used to create/manage the PostgreSQL database itself. Data added in Django
Admin is saved to PostgreSQL when the settings below are configured correctly.

1. REQUIREMENTS
- Python installed
- PostgreSQL and pgAdmin installed and running

2. CREATE DATABASE IN pgAdmin
- Open pgAdmin and connect to your PostgreSQL server.
- Right-click Databases > Create > Database.
- Database name: freelancehub_db
- Save. Use the PostgreSQL user you own/control (commonly postgres).
- Remember that user's password; do not share it or commit it to GitHub.

3. OPEN THE PROJECT IN VS CODE
Open a terminal in the folder containing manage.py. Create and activate a venv:
  py -m venv venv
  .\venv\Scripts\activate
Install packages:
  python -m pip install -r requirements.txt

4. SET POSTGRESQL CONNECTION (PowerShell)
Replace the example password with the password for your local PostgreSQL user:
  $env:DB_NAME='freelancehub_db'
  $env:DB_USER='postgres'
  $env:DB_PASSWORD='YOUR_POSTGRES_PASSWORD'
  $env:DB_HOST='127.0.0.1'
  $env:DB_PORT='5432'
  $env:DJANGO_SECRET_KEY='replace-with-a-long-random-secret-key'
These environment variables apply to this terminal session. Set them again
when you open a new terminal, or configure them safely in your local environment.

5. CREATE TABLES AND ADMIN LOGIN
Run in this order:
  python manage.py check
  python manage.py migrate
  python manage.py createsuperuser
  python manage.py runserver

6. OPEN THE SITE
Home page:       http://127.0.0.1:8000/
Project list:    http://127.0.0.1:8000/projects/
Django Admin:    http://127.0.0.1:8000/admin/
Log in to /admin/ using the superuser created above.

7. ADD DATA THROUGH DJANGO ADMIN (like the screenshots)
- First open Users and add a user for the client.
- Open Client profiles > Add; choose that user and enter Company name.
- Add a separate user for the freelancer.
- Open Freelancer profiles > Add; choose that user and enter skills/experience.
- Open Projects > Add; select the client and optionally the freelancer, then
  enter title, description, required skills, budget, deadline and status. Save.
- Open /projects/ in the website. The records are stored in PostgreSQL and
  will appear according to the logged-in user's role and the project's status.

You can also view the tables in pgAdmin under Databases > freelancehub_db >
Schemas > public > Tables. Right-click a table and choose View/Edit Data to
inspect records. Prefer Django Admin for adding/editing application records,
because it uses Django validation and relationships.

TROUBLESHOOTING
- 'password authentication failed': check DB_USER and DB_PASSWORD.
- 'database does not exist': create freelancehub_db in pgAdmin first.
- 'connection refused': make sure PostgreSQL service is running and port is 5432.
- 'No module named psycopg': run python -m pip install -r requirements.txt.
- After model changes, run python manage.py makemigrations then migrate.

SECURITY
Do not upload passwords, real user data, or your local secret key to GitHub.
This is a development project; before deployment, configure secure environment
variables, production settings, and HTTPS.


INTERACTIVE WORKSPACE UPDATE
----------------------------
The project list now includes:
- Live search by project title, description, and required skills.
- Status filtering and sorting by newest, budget, or deadline.
- Project summary cards for total, open, and active projects.
- A live progress bar and progress slider for the assigned freelancer and project owner.
- Progress updates saved through a CSRF-protected Django POST endpoint.

To run:
1. Extract this ZIP.
2. Create/activate your Python virtual environment.
3. Install dependencies: pip install -r requirements.txt
4. Configure PostgreSQL credentials with DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, and DB_PORT environment variables.
5. Create the database in PostgreSQL.
6. Run: python manage.py migrate
7. Run: python manage.py runserver
8. Open http://127.0.0.1:8000/

Note: This environment did not have Django installed, so a live Django server/database integration test could not be run here. Python source compilation passed. Keep your actual database credentials private and configure them in environment variables.
