import pandas as pd
from sqlalchemy import create_engine
import pymysql

def insert_csv(): #將csv插入mysql
    engine = create_engine('mysql+pymysql://root:123456789@localhost:3306/weather')
    # 讀取本地CSV檔案
    # df = pd.read_csv('表單資料/A1_df.csv', header=None)
    df = pd.read_csv('表單資料/A3_df.csv', header=None)
    df = df.iloc[1:,1:]
    #將欄位名稱改為英文, 盡量避免編碼問題
    df.columns = ['City', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aus', 'Sep', 'Oct', 'Nov', 'Dece', 'Avg', 'Sta_period']
    print(df)

    # 將DataFrame儲存為MySQL中的資料表，不儲存index列
    # df.to_sql('taiwan_tem', con=engine, if_exists='replace', index=False)
    df.to_sql('taiwan_high', con=engine, if_exists='replace', index=False)
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

def alter_column(): #新增id欄位, #修改欄位型態
#新增id欄位
    sql_id = "alter table taiwan_high add id int not null auto_increment primary key first;"
    conn_mysql(sql_id)
#修改欄位型態
    month_col = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aus', 'Sep', 'Oct', 'Nov', 'Dece', 'Avg']
    for col in month_col:
        sql = "alter table taiwan_high modify {} float;".format(col)
        conn_mysql(sql)




