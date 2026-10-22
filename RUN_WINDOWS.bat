@echo off
cd /d "%~dp0"
if not exist .venv (py -m venv .venv)
call .venv\Scripts\activate.bat
python -m pip install -r requirements.txt
if errorlevel 1 pause & exit /b 1
python manage.py migrate
if errorlevel 1 (echo Check PostgreSQL credentials, or set DB_ENGINE=sqlite3 for local demo & pause & exit /b 1)
python manage.py runserver
pause
