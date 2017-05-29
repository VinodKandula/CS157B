import json
import uuid
from cassandra.cluster import Cluster

def import_data(table_name, json_filename):
    cluster = Cluster()
    session = cluster.connect()
    insert_statement = 'INSERT INTO %s JSON %s' % (table_name, '%s')

    with open(json_filename) as data_file:
        i = 0
        for line in data_file:
            i = i + 1
            if(i > 3927911):
                corrected_line = line.strip().replace('\n', '\\n')
                session.execute(insert_statement,[corrected_line])
    cluster.shutdown()

def import_data_without_primary_key(table_name, json_filename, name_of_id):
    cluster = Cluster()
    session = cluster.connect()
    insert_statement = 'INSERT INTO %s JSON %s' % (table_name, '%s')

    with open(json_filename) as data_file:
        for line in data_file:
            corrected_line = json.loads(line.strip().replace('\n','\\n'))
            corrected_line[name_of_id] = str(uuid.uuid1())
            corrected_line = json.dumps(corrected_line)
            session.execute(insert_statement,[corrected_line])
    cluster.shutdown()

if __name__ == '__main__':
    print("Importing review data...")
    import_data('yelp.review','review.json')
    print("Finished importing review data")
    '''
    print( "Importing business data...")
    import_data('yelp.business', 'business.json')
    print("Finished importing business data.")

    print("Importing review data...")
    import_data('yelp.review','review.json')
    print("Finished importing review data.")

    print("Importing user data...")
    import_data('yelp.user','user.json')
    print("Finished importing user data.")

    print("Importing tip data...")
    import_data_without_primary_key('yelp.tip', 'tip.json', 'tip_id')
    print("Finished importing tip data.")

    print("Importing checkin data...")
    import_data_without_primary_key('yelp.checkin','checkin.json', 'checkin_id')
    print("Finished importing checkin data.")
'''
