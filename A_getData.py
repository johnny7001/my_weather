from selenium import webdriver
import pandas as pd
import time

url = 'https://www.cwb.gov.tw/V8/C/C/Statistics/monthlymean.html'
opt = webdriver.ChromeOptions()
user_agent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Mobile Safari/537.36'
opt.add_argument('--user-agent=%s' % user_agent)
driver = webdriver.Chrome('chromedriver', options=opt)
driver.get(url)

ele_select = driver.find_element_by_xpath('//*[@id="Location"]/option[1]') #選擇下拉選單欄位: 台灣
ele_select.click()
time.sleep(1)

ele2_select = driver.find_element_by_xpath('//*[@id="Item"]/option[6]') #選擇下拉選單欄位: 氣溫
# ele2_select = driver.find_element_by_xpath('//*[@id="Item"]/option[4]') #選擇下拉選單欄位: 最高氣溫
time.sleep(1)
ele2_select.click()
time.sleep(1)
html = driver.page_source


df = pd.read_html(html)
df = df[0]
df = pd.DataFrame(df)
df.rename(columns={'Unnamed: 0':'地點'}, inplace=True)

df.to_csv('表單資料/A1_df.csv', encoding='utf-8')

# df.to_csv('表單資料/A3_df.csv', encoding='utf-8')


driver.close()

