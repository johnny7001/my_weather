from flask import Flask
from flask import request
from flask import render_template
import sqlite3 as sql

app = Flask(__name__,
            static_folder='static',
            static_url_path='/static'
    )

@app.route('/')
def get_weather():
    if request.args.get('sel_table') != None:
        con = sql.connect("test.db")
        con.row_factory = sql.Row
        get_tablenme = request.args.get('sel_table') # 選擇 table
        tablename = 'taiwan_tem' if get_tablenme == '氣溫' else 'taiwan_high'

        # 選擇下拉選單, 三個月份的欄位
        get_month1 = request.args.get('sel_month1')
        get_month2 = request.args.get('sel_month2')
        get_month3 = request.args.get('sel_month3')

        cur = con.cursor()
            # 假如有一個欄位沒有選擇
        if get_month1 == '請選擇...' or get_month2 == '請選擇...' or get_month3 == '請選擇...':
            cur.execute("select * from {}".format(tablename))
            rows = cur.fetchall()
            return render_template("weather.html", rows=rows, get_tablenme=get_tablenme,
                                   get_month1=get_month1, get_month2=get_month2, get_month3=get_month3)
        else:
            # 只顯示選取欄位的月份溫度
            cur.execute("select {}, {}, {}, {}, {} from {}".format('city',
                                                                       get_month1, get_month2, get_month3,
                                                                       'Sta_period', tablename))

            rows = cur.fetchall()

            #計算選取月份的平均溫度
            con.row_factory = None
            cur = con.cursor()
            cur.execute("select avg({}), avg({}), avg({}) from {}".format(get_month1, get_month2, get_month3, tablename))
            avg_rows = cur.fetchall()[0]

            month1_v1 = '%.2f' % int(avg_rows[0])
            month2_v2 = '%.2f' % int(avg_rows[1])
            month3_v3 = '%.2f' % int(avg_rows[2])

            #計算同地點三個月份的平均溫度
            cur.execute("select {}, {}, {} from {}".format(get_month1, get_month2, get_month3, tablename))
            m_list = [] #將同地點不同月份的溫度平均後彙整成一個list
            for r in cur.fetchall():  # r = (m1, m2, m3)
                m1 = float(r[0])
                m2 = float(r[1])
                m3 = float(r[2])
                avg = '%.2f' % ((m1 + m2 + m3) / 3)
                m_list.append(avg)

            return render_template("weather.html", rows=rows, get_tablenme=get_tablenme,
                                   month1_v1=month1_v1,month2_v2=month2_v2, month3_v3=month3_v3,
                                   get_month1=get_month1, get_month2=get_month2, get_month3=get_month3,
                                   m_list=m_list)
    else:
        con = sql.connect("test.db")
        con.row_factory = sql.Row
        cur = con.cursor()
        cur.execute("select * from taiwan_tem")
        rows = cur.fetchall()
        get_month1 = '請選擇...'
        get_month2 = '請選擇...'
        get_month3 = '請選擇...'
        return render_template("weather.html", rows=rows,
                               get_month1=get_month1, get_month2=get_month2, get_month3=get_month3)

#啟動網站伺服器, 可指定 port
app.run(port=5000)