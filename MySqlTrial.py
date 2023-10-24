import mysql.connector
from mysql.connector import errorcode

def get_tables():
    
    Tables = {}

    Tables['Trades'] = (
        "CREATE TABLE `trades` ("
        "  `TradeId` INT NOT NULL AUTO_INCREMENT,"
        "  `Ticker` varchar(5) NOT NULL,"
        "  `Buy` decimal(8,2) NOT NULL,"
        "  `DateBuy` datetime NOT NULL,"
        "  `Sell` decimal(8,2) NOT NULL,"
        "  `DateSell` datetime NOT NULL,"
        "  `Profit` decimal(8,2) NOT NULL,"
        "  PRIMARY KEY (`TradeId`)"
        ") ENGINE=InnoDB")

    Tables['StockInfo'] = (
        "CREATE TABLE `stockinfo` ("
        "  `Ticker` varchar(5) NOT NULL,"
        "  `Company` varchar(14) NOT NULL,"
        "  `Sector` varchar(14) NOT NULL,"
        "  PRIMARY KEY (`Ticker`)"
        ") ENGINE=InnoDB")

    Tables['StockData'] = (
        "CREATE TABLE `stockdata` ("
        " `StockId` INT NOT NULL AUTO_INCREMENT,"
        " `Ticker` varchar(5) NOT NULL,"
        "  `Price` decimal(8,2) NOT NULL,"
        " `Volume` INT NOT NULL,"
        " `MarketCap` BIGINT NOT NULL,"
        "  `Date` datetime NOT NULL,"
        "  PRIMARY KEY (`StockId`)"
        ") ENGINE=InnoDB")
    
    return Tables


#Function creates tables in database
def create_Table(Tables):
    cnx = mysql.connector.connect(user= 'bga5780', database= 'bga5780')
    cursor = cnx.cursor()
    DB_NAME = 'bga5780'
    try:
        cursor.execute("USE {}".format(DB_NAME))
    except mysql.connector.Error as err:
        print("Database {} does not exists.".format(DB_NAME))
        print(err)
        exit(1)
        
    for table_name in Tables:
        table_description = Tables[table_name]
        try:
            print("Creating table {}: ".format(table_name), end='')
            cursor.execute(table_description)
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_TABLE_EXISTS_ERROR:
                print("Table Exists")
            else:
                print(err.msg)
        else:
            print("OK")
            
    cursor.close()
    cnx.close()
    
create_Table(get_tables())