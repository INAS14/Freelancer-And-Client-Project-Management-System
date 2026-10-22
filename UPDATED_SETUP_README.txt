FreelanceHub - updated dual portals

Client: http://127.0.0.1:8000/client/register/ and /client/login/
Freelancer: http://127.0.0.1:8000/freelancer/register/ and /freelancer/login/
Each has its own dashboard URL; both use one Django project and shared database.

Windows: open terminal in freelancehub_work, then:
  py -m pip install -r requirements.txt
  set DB_ENGINE=sqlite3
  py manage.py migrate
  py manage.py runserver
SQLite is a convenient local demo; to use PostgreSQL, do NOT set DB_ENGINE=sqlite3. Set DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT before running migrations. Existing PostgreSQL data is not included in this ZIP. Do not switch databases expecting users to carry over.

Email: in cmd set EMAIL_NOTIFICATIONS_ENABLED=true, EMAIL_HOST_USER=youraddress@gmail.com, EMAIL_HOST_PASSWORD=your_gmail_app_password and DEFAULT_FROM_EMAIL=youraddress@gmail.com. Never share or commit passwords. If disabled, in-app notifications are saved but real email is not sent.

Login supports username OR email + original password. Existing accounts should log in, not register again. For two simultaneous accounts, use normal Chrome and Incognito (sessions are shared across normal tabs).

Workflow: client posts project, freelancer accepts, freelancer starts work and updates progress, submits for review, client approves or requests changes. Project notifications and messages are saved in database.

This archive does not contain your original PostgreSQL data or SMTP credentials. Test email with valid Gmail app password.
