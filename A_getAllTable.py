from selenium import webdriver
from selenium.webdriver.support.ui import Select
import pandas as pd
import time
from B_insertAllTable import insert_csv, alter_column
url = 'https://www.cwb.gov.tw/V8/C/C/Statistics/monthlymean.html'
opt = webdriver.ChromeOptions()
user_agent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Mobile Safari/537.36'
opt.add_argument('--user-agent=%s' % user_agent)
driver = webdriver.Chrome('chromedriver', options=opt)
driver.get(url)

ele_select = Select(driver.find_element_by_xpath('//*[@id="Location"]')) #抓取國家下拉選單內的所有值
select_col1 = len(ele_select.options)

# 抓取 option 的 value 值
ele1_list = []
for v in ele_select.options:
    ele1_list.append(v.get_attribute('value'))

# 抓取 option 的 value 值
ele2_select = Select(driver.find_element_by_xpath('//*[@id="Item"]')) #抓取氣溫種類下拉選單內的所有值
select_col2 = len(ele2_select.options)
ele2_list = []
for v in ele2_select.options:
    ele2_list.append(v.get_attribute('value'))

# 爬取所有選項的表單
for country in range(1, select_col1 + 1): #選擇國家
    ele_select = driver.find_element_by_xpath('//*[@id="Location"]/option[{}]'.format(country))
    ele_select.click()
    time.sleep(1)
    for tem in range(1, select_col2 + 1): #選擇氣溫種類
        ele2_select = driver.find_element_by_xpath('//*[@id="Item"]/option[{}]'.format(tem))
        ele2_select.click()
        time.sleep(1)

        html = driver.page_source
        df = pd.read_html(html)
        df = df[0]
        df = pd.DataFrame(df)
        df.rename(columns={'Unnamed: 0':'地點'}, inplace=True)
        df.to_csv('表單資料/Adf_{}_{}.csv'.format(ele1_list[country-1], ele2_list[tem-1]), encoding='utf-8')
        time.sleep(1) #怕被擋，所以sleep

        #插入mysql
        insert_csv(country=ele1_list[country-1], tem=ele2_list[tem-1])

        ##新增id欄位, #修改欄位型態
        alter_column(country=ele1_list[country-1], tem=ele2_list[tem-1])
driver.close()

