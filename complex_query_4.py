"""
See how many transactions are made by users that are friends
"""



import psycopg2 as pg2

con = pg2.connect(database='venmo', user='isdb')
con.autocommit = True
cur = con.cursor()


print("Returns how many users that paid business uid 1 are friends")

# business_id=1
query = '''

    DROP VIEW IF EXISTS friend_uids;
    
    CREATE VIEW friend_uids AS
    SELECT u_id1, u_id2
      FROM Friends
     WHERE u_id1 IN (
       SELECT DISTINCT u_id
         FROM Transactions AS t
        WHERE t_id = 2
     ) AND u_id2 IN (
       SELECT DISTINCT u_id
         FROM Transactions AS t
        WHERE t_id = 2);
    
    SELECT count(transaction_id)
      FROM Transactions
     WHERE u_id IN (SELECT s1.u_id1
                      FROM friend_uids s1
                     UNION
                    SELECT s2.u_id2
                      FROM friend_uids s2)
       AND t_id = 2;
'''
cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)