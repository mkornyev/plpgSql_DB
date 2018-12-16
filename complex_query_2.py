"""
Transfer money to/from my bank account
"""

print("Uid1 transfers $10 to their bank account")

import psycopg2 as pg2

con = pg2.connect(database='venmo', user='isdb')
con.autocommit = True
cur = con.cursor()

# 10.50 is amount, user_id = 1
query = '''
    UPDATE Users
    SET venmo_balance = venmo_balance - 10.50
    WHERE u_id = 1;
    
    INSERT INTO Transfers
    VALUES (1, NOW()::timestamp, 10.50);
    
    UPDATE BankAccounts
    SET balance = balance + 10.50
    FROM User_Accounts
    WHERE User_Accounts.account_number = BankAccounts.account_number AND
          User_Accounts.u_id = 1;
    
'''

cur.execute(query)
