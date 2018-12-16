"""
See which bank accounts need to be charged overage fees and by how much
"""
print("")
print("All overdrawn accounts: ")
print("")
print("(Account No, Overage)")

import psycopg2 as pg2

con = pg2.connect(database='venmo', user='isdb')
con.autocommit = True
cur = con.cursor()

query = '''
    SELECT account_number, (overage_percent * abs(balance)) as charge_amount
      FROM BankAccounts
     WHERE balance < 0;
'''
cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)



