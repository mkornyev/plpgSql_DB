
-- ShowAll Script 


-- Final Project, Show Databse 
-- Database Design & Development, Fall 2018 
-- Creators: Max Kornyev, Alex Nelson, Annie Spahn 

-- ============================================================
\connect postgres
\connect venmo;

--Flush and print all tables 
\echo ''
\echo '---------------------------------'
\echo '     Printing All Tables:'
\echo '---------------------------------'
\echo ''
\echo 'Bank Accounts: '
SELECT * FROM BankAccounts;
\echo '---------------------------------'
\echo 'Businesses: '
SELECT * FROM Businesses;
\echo '---------------------------------'
\echo 'Comments: '
SELECT * FROM Comments;
\echo '---------------------------------'
\echo 'Friends: '
SELECT * FROM Friends;
\echo '---------------------------------'
\echo 'Individuals: '
SELECT * FROM Individuals;
\echo '---------------------------------'
\echo 'Payments: '
SELECT * FROM Payments;
\echo '---------------------------------'
\echo 'Requests: '
SELECT * FROM Requests;
\echo '---------------------------------'
\echo 'Transactions: '
SELECT * FROM Transactions;
\echo '---------------------------------'
\echo 'User Accounts: '
SELECT * FROM User_Accounts;
\echo '---------------------------------'
\echo 'User Info: '
SELECT * FROM User_Info;
\echo '---------------------------------'
\echo 'Users: '
SELECT * FROM Users;
\echo '---------------------------------'


\echo 'DB Echo Done!'





