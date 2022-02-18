import pandas as pd
from sqlalchemy import create_engine
import pymysql

def insert_csv(country, tem): #將csv插入mysql
    engine = create_engine('mysql+pymysql://root:123456789@localhost:3306/weather')
    # 讀取本地CSV檔案
    df = pd.read_csv('表單資料/Adf_{}_{}.csv'.format(country, tem), header=None)
    df = df.iloc[1:,1:]
    #將欄位名稱改為英文, 盡量避免編碼問題
    df.columns = ['City', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aus', 'Sep', 'Oct', 'Nov', 'Dece', 'Avg', 'Sta_period']

    # 將DataFrame儲存為MySQL中的資料表，不儲存index列
    # df.to_sql('taiwan_tem', con=engine, if_exists='replace', index=False)
    df.to_sql('{}_{}'.format(country, tem), con=engine, if_exists='replace', index=False)
    print("Write to MySQL successfully!")

def conn_mysql(sql): #建立mysql連線並執行sql指令
    try:
        conn = pymysql.connect(host='localhost', user='root', password='123456789', db='weather')
        cursor = conn.cursor()
        cursor.execute(sql)
        conn.commit()
        cursor.close()
        print("執行成功")
    except:
        print('執行失敗')

def alter_column(country, tem): #新增id欄位, #修改欄位型態
#新增id欄位
    sql_id = "alter table {}_{} add id int not null auto_increment primary key first;".format(country, tem)
    conn_mysql(sql_id)
#修改欄位型態
    month_col = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aus', 'Sep', 'Oct', 'Nov', 'Dece', 'Avg']
    for col in month_col:
        sql = "alter table {}_{} modify {} float;".format(country, tem, col)
        conn_mysql(sql)



