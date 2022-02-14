from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
from .models import TaiwanHigh, TaiwanTem
from django.http import HttpResponseRedirect #導轉
from django.db.models import Avg, Sum
from django.db.models import Q #多條件查詢

def weather(request):
    if 'sel_table' in request.GET:
        tablename = request.GET['sel_table'] # 抓取下拉選單的值, type = string
        # 任選三個月的資料
        month1 = request.GET['sel_month1']
        month2 = request.GET['sel_month2']
        month3 = request.GET['sel_month3']

        if tablename == '氣溫' and month1 != '請選擇...' and month2 != '請選擇...' and month3 != '請選擇...': # 氣溫 and 任選三個月份
            df = TaiwanTem.objects.values('city', 'sta_period', month1, month2, month3)
            # 計算所有地點單月的平均溫度
            month1_avg = df.aggregate(Avg(month1))['{}__avg'.format(month1)] #下拉選單1
            month2_avg = df.aggregate(Avg(month2))['{}__avg'.format(month2)] #下拉選單2
            month3_avg = df.aggregate(Avg(month3))['{}__avg'.format(month3)] #下拉選單3

            # 計算地點三個月的平均溫度
            loc_list = []
            loc1 = TaiwanTem.objects.values_list(month1, flat=True)
            loc1 = list(loc1)
            loc2 = TaiwanTem.objects.values_list(month2, flat=True)
            loc2 = list(loc2)
            loc3 = TaiwanTem.objects.values_list(month3, flat=True)
            loc3 = list(loc3)

            loc_length = len(loc1)
            for i in range(loc_length):
                loc_avg = '%.2f' % ((loc1[i] + loc2[i] + loc3[i]) / 3)
                # 計算後的平均溫度重組成一個list
                loc_list.append(loc_avg)


            return render(request, 'weather.html',
                          {'tem': df, 'tablename': tablename, 'month1': month1, 'month2': month2, 'month3': month3,
                           'month2_avg': '%.2f' % month2_avg, 'month3_avg': '%.2f' % month3_avg,
                           'month1_avg':'%.2f' % month1_avg, 'loc_list':loc_list})

        elif tablename == '最高氣溫' and month1 != '請選擇...' and month2 != '請選擇...' and month3 != '請選擇...': # 最高氣溫 and 任選三個月份
            df = TaiwanHigh.objects.values('city', 'sta_period', month1, month2, month3)
            #計算所有地點單月的平均溫度
            month1_avg = df.aggregate(Avg(month1))['{}__avg'.format(month1)] #下拉選單1
            month2_avg = df.aggregate(Avg(month2))['{}__avg'.format(month2)] #下拉選單2
            month3_avg = df.aggregate(Avg(month3))['{}__avg'.format(month3)] #下拉選單3

            loc_list = []
            loc1 = TaiwanHigh.objects.values_list(month1, flat=True)
            loc1 = list(loc1)
            loc2 = TaiwanHigh.objects.values_list(month2, flat=True)
            loc2 = list(loc2)
            loc3 = TaiwanHigh.objects.values_list(month3, flat=True)
            loc3 = list(loc3)

            loc_length = len(loc1)
            for i in range(loc_length):
                loc_avg = '%.2f' % ((loc1[i] + loc2[i] + loc3[i]) / 3)
                loc_list.append(loc_avg)

            return render(request, 'weather.html',
                          {'tem': df, 'tablename': tablename, 'month1': month1, 'month2': month2, 'month3': month3,
                           'month2_avg': '%.2f' % month2_avg, 'month3_avg': '%.2f' % month3_avg,
                           'month1_avg': '%.2f' % month1_avg, 'loc_list': loc_list})

        elif tablename == '氣溫' and month1 == '請選擇...' and month2 == '請選擇...' and month3 == '請選擇...':  # 氣溫 and 都沒有選
            df = TaiwanTem.objects.all()
            return render(request, 'weather.html',
                          {'tem': df, 'tablename': tablename, 'month1': month1, 'month2': month2, 'month3': month3})

        elif tablename == '最高氣溫' and month1 == '請選擇...' and month2 == '請選擇...' and month3 == '請選擇...':  # 最高氣溫 and 都沒有選
            df = TaiwanHigh.objects.all()
            return render(request, 'weather.html',
                          {'tem': df, 'tablename': tablename, 'month1': month1, 'month2': month2, 'month3': month3})
        else:
            return HttpResponseRedirect('/weather/')  # 若未確實選擇三個月份則會跳轉回weather.html, 避免error
    else:
        df_tem = TaiwanTem.objects.all()  # 預設顯示
        return render(request, 'weather.html', {'tem': df_tem})




