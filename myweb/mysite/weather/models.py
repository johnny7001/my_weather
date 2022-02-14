from django.db import models

# �۰ʥͦ���Ʈwmodels�ҫ�pyt
# python manage.py inspectdb tablename

# �N�ئn���ҫ��פJ
# python manage.py inspectdb > app/models.py

class TaiwanHigh(models.Model):
    city = models.CharField(max_length=50)
    jan = models.FloatField()
    feb = models.FloatField()
    mar = models.FloatField()
    apr = models.FloatField()
    may = models.FloatField()
    jun = models.FloatField()
    jul = models.FloatField()
    aus = models.FloatField()
    sep = models.FloatField()
    oct = models.FloatField()
    nov = models.FloatField()
    dece = models.FloatField()
    avg = models.FloatField()
    sta_period = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'taiwan_high'


class TaiwanTem(models.Model):
    city = models.CharField(max_length=50)
    jan = models.FloatField()
    feb = models.FloatField()
    mar = models.FloatField()
    apr = models.FloatField()
    may = models.FloatField()
    jun = models.FloatField()
    jul = models.FloatField()
    aus = models.FloatField()
    sep = models.FloatField()
    oct = models.FloatField()
    nov = models.FloatField()
    dece = models.FloatField()
    avg = models.FloatField()
    sta_period = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'taiwan_tem'
