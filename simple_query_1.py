import psycopg2 as pg2

con = pg2.connect(database='venmo', user='isdb')  
con.autocommit = True
cur = con.cursor()



#Pay a user, effectively updating all balances
print('Story 1: Annie (Uid 5) Pays starbucks 50 dollars')
print('')

query = '''
INSERT INTO Transactions
VALUES (2, 5, 2, current_timestamp); 

INSERT INTO Payments(transaction_id, amount)
VALUES (2, 50); 
'''
cur.execute(query)

#Request a user 
print('Story 1: Max (Uid 3) requests $5.50 from Annie, and Annie apprroves the request')
print('')


#Make a transaction and approve it 
query = '''
INSERT INTO Transactions(transaction_id, u_id, t_id, timestamp)
VALUES (3, 5, 3, current_timestamp);
INSERT INTO Requests(transaction_id, amount, approved)
VALUES (3, 5.50, False);
UPDATE Requests SET approved = true WHERE transaction_id = 3;'''

cur.execute(query)


