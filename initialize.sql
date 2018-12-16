
--Init Script


-- Final Project, Database Init
-- Database Design & Development, Fall 2018 
-- Creators: Max Kornyev, Alex Nelson, Annie Spahn 

-- ============================================================

\connect postgres

-- Create Database 
DROP DATABASE IF EXISTS venmo;

CREATE database venmo;
\connect venmo;

-- Create tables 
\i create.sql 

\echo ''
\echo '---------------------------------'
\echo '         Create Done'
\echo '---------------------------------'
\echo ''

-- Copies 13 Tables
\copy Users(u_id, venmo_balance) FROM 'csv_files/Users.csv' csv header
\copy User_Info(username, fname, lname, email) FROM 'csv_files/User_Info.csv' csv header
\copy Individuals(u_id, username) FROM 'csv_files/Individuals.csv' csv header
\copy Businesses(u_id, biz_name) FROM 'csv_files/Businesses.csv' csv header
\copy Friends(u_id1, u_id2) FROM 'csv_files/Friends.csv' csv header
\copy BankAccounts(account_number, balance, overage_percent)	FROM 'csv_files/BankAccounts.csv'  csv header
\copy User_Accounts(u_id, account_number) FROM 'csv_files/User_Accounts.csv' csv header
\copy Transfers(u_id, timestamp, amount) FROM 'csv_files/Transfers.csv' csv header

\copy Transactions FROM 'csv_files/Transactions.csv' csv header
\copy Comments(transaction_id, text) FROM 'csv_files/Comments.csv' csv header
\copy Payments(transaction_id, amount) FROM 'csv_files/Payments.csv' csv header
\copy Requests(transaction_id, amount, approved) FROM 'csv_files/Requests.csv' csv header

-- Initially Empty ^
-- Initially Empty ^
-- Initially Empty ^
-- Initially Empty ^
-- Initially Empty ^
-- Initially Empty ^

\echo ''
\echo '---------------------------------'
\echo '         Load Done'
\echo '---------------------------------'
\echo ''

\echo ''
\echo '---------------------------------'
\echo '         Creating Triggers'
\echo '---------------------------------'
\echo ''



----- Some Necessary Triggers: -----

--============ Payment table trigger ============-- 
DROP FUNCTION IF EXISTS fn_update_balance();

CREATE FUNCTION fn_update_balance()
RETURNS TRIGGER 
LANGUAGE plpgsql AS
$$
BEGIN
	-- Update receiver balance 
	UPDATE Users
	   SET venmo_balance = venmo_balance + (new.amount)
	 WHERE u_id = (SELECT t.t_id
	 				 FROM Transactions as t
	 				 JOIN Payments as p on t.transaction_id = p.transaction_id
	 				WHERE new.transaction_id = t.transaction_id);
	 -- Update sender balance 
	 UPDATE Users as u
	   SET venmo_balance = venmo_balance - (new.amount)
	 WHERE u_id = (SELECT t.u_id
	 		     	 FROM Transactions as t
	 				 JOIN Payments as p on t.transaction_id = p.transaction_id
	 				WHERE new.transaction_id = t.transaction_id);
	RETURN null; 
END
$$;

DROP TRIGGER IF EXISTS tr_update_balance ON Payments CASCADE; 
CREATE TRIGGER tr_update_balance
AFTER INSERT ON Payments
FOR EACH ROW
EXECUTE PROCEDURE fn_update_balance(); 




--============ Requests table trigger ============-- 
DROP FUNCTION IF EXISTS fn_update_payments(); 

CREATE FUNCTION fn_update_payments()
RETURNS TRIGGER 
LANGUAGE plpgsql AS
$$
BEGIN
	-- Insert rows into payments given approved = true  
	IF new.approved
	THEN INSERT INTO Payments(transaction_id, amount)
		  VALUES (new.transaction_id, new.amount);
	END IF; 
	RETURN null; 
END
$$;

DROP TRIGGER IF EXISTS tr_update_payments ON Requests CASCADE; 
CREATE TRIGGER tr_update_payments
AFTER UPDATE OR INSERT ON Requests
FOR EACH ROW
EXECUTE PROCEDURE fn_update_payments(); 

\echo ''
\echo '-----------------------'
\echo ''
\echo 'Init Done, Enjoy VenmoDB!'
\echo ''
\echo 'Run the show_all.sql script before executing the first query'
\echo 'Then, execute all the queries sequentially, starting with the simple, then the complex'
\echo 'The transactions will make the most sense given hardcoded values'
\echo ''
\echo '-----------------------'
-- ============================================================
  
