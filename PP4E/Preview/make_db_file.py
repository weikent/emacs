"""
Save in-memory database object to a file with custom formatting;
assume 'endrec.', 'enddb.', and '=>' are not used in the data;
assume db is dict of dict; warning: eval can be dangerous - it 
runs strings as code; could alse eval() record dict all at once;
Could alse dbfile.write(key + '\n') vs print(key, file=dbfile);
"""

dbfilename = 'people-file'
ENDDB = 'enddb.'
ENDREC = 'endrec.'
RECSEP = '=>'

def storeDbase(db, dbfilename=dbfilename):
    "formatted dump of database to flat file"
    dbfile = open(dbfilename, 'w')
    for key in db:
        print(key, file=dbfile)
#        dbfile.write(key + '\n')
        for (name, value) in db[key].items():
            print(name + RECSEP + repr(value), file=dbfile)
#            dbfile.write(name + RECSEP + repr(value) + '\n')
        print(ENDREC, file=dbfile)
#        dbfile.write(ENDREC + '\n')
    print(ENDDB, file=dbfile)
#    dbfile.write(ENDDB + '\n')
    dbfile.close()



def loadDbase(dbfilename=dbfilename):
    "parse data to reconstruct database"
    dbfile = open(dbfilename)
    import sys
    sys.stdin = dbfile
    db = {}
    key = input()
    while key != ENDDB:
        rec = {}
        field = input()
        while field != ENDREC:
            name, value = field.split(RECSEP)
            rec[name] = eval(value)
            field = input()
        db[key] = rec
        key = input()
    return db


if __name__ == '__main__':
    from initdata import db
    storeDbase(db)

