"""
See venmo withdrawals and deposits

"""


import psycopg2 as pg2

con = pg2.connect(database='venmo', user='isdb')
con.autocommit = True
cur = con.cursor()

print("After Annie transfers 1000 to her venmo account, and Max overdraws")

query = '''
UPDATE BankAccounts
SET balance = (balance - 1000)
WHERE account_number = 1000377241; 

UPDATE Users
SET venmo_balance = (venmo_balance + 1000)
WHERE u_id = 5;

UPDATE BankAccounts
SET balance = (balance - 4000)
WHERE account_number = 1592784900; 

UPDATE Users
SET venmo_balance = (venmo_balance + 4000)
WHERE u_id = 3;

SELECT abs(amount),
       CASE
         WHEN amount > 0 THEN 1
         ELSE 0 END AS is_deposit,
       CASE
         WHEN amount <= 0 THEN 1
         ELSE 0 END AS is_withdrawal
  FROM Transfers;
'''
cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)