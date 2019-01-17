README FILE: 

VenmoDB, Fall 2018 
Creators: Max Kornyev, Alex Nelson, Annie Spahn 

SETUP: 

Running initialize.sql will call the create file, populate the database, and create some essential triggers.

in terminal, run: psql -d Postgres -U user -f initialize.sql

User stories are reflected in the .py files.

             run: python query_name.py

Running show_all before and after calling a .py file will reflect appropriate changes in the Database.

             run:  psql -d Postgres -U user -f show_all.sql
