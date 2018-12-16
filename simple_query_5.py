import psycopg2 as pg2

con = pg2.connect(database='venmo', user='isdb')  
con.autocommit = True
cur = con.cursor()



#Pay a user, effectively updating all balances
print('Story 1: Annie (Uid 5) Pays starbucks 1.99')
print('')

query = '''
INSERT INTO Transactions
VALUES (10, 5, 2, current_timestamp); 

INSERT INTO Payments(transaction_id, amount)
VALUES (10, 1.99); 
'''
cur.execute(query)