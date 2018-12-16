import psycopg2 as pg2

# Connect to an existing database
con = pg2.connect(database='venmo', user='isdb')
con.autocommit = True
# Open a cursor to perform database operations
cur = con.cursor()

# add a comment to a venmo transaction
# can only be run after the transaction table has been populated

def add_comment(comment_id, trans_id, message):
    query = '''
        INSERT INTO Comments
        VALUES(%s,%s,%s);
        
        '''
    cmd = cur.mogrify(query, [comment_id, trans_id, message])
    cur.execute(cmd)
    print('Added a comment on transaction 1')



if __name__ == "__main__":
    trans_id = 1
    message = 'thanks for paying me!'
    add_comment(2, trans_id, message)