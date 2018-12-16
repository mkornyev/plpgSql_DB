{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 README FILE: \
\
Final Project: Venmo\
Database Design & Development, Fall 2018 \
Creators: Max Kornyev, Alex Nelson, Annie Spahn \
\
SETUP: \
\
Running initialize.sql will call the create file, populate the database, and create some essential triggers. \
\
in terminal, run: psql -d Postgres -U user -f initialize.sql\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0
\cf0 \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 User stories are reflected in the .py files. \
\
  	        run: python query_name.py\
\
Running show_all before and after calling a .py file will reflect appropriate changes in the Venmo Database. \
\
                   run:  psql -d Postgres -U user -f show_all.sql}