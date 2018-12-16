"""
See my average spending per day over a specific time period or to specific users/businesses
"""

import psycopg2 as pg2

con = pg2.connect(database='venmo', user='isdb')
con.autocommit = True
cur = con.cursor()

print("Returns average income of Starbucks over the timespan 2013-07-01 - 2015-11-10")
print("")
# 10.50 is amount, user_id = 1
query = '''
    SELECT sum(coalesce(p.amount, 0)) / abs(DATE_PART('day', '2013-07-01'::timestamp - '2015-11-10'::timestamp)::integer)
      FROM Payments as p
           JOIN Transactions as t on t.transaction_id = p.transaction_id
           LEFT JOIN Businesses as b on b.u_id = t.t_id
           JOIN Individuals as i on i.u_id = t.t_id
     WHERE (t.timestamp between '2013-07-01' and '2015-11-10') AND
           (b.biz_name = 'Starbucks' or i.username = 'test');
'''
cur.execute(query)
rows = cur.fetchall()
for row in rows:
    print(row)