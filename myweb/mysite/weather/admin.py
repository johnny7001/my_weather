from django.contrib import admin
from .models import TaiwanTem, TaiwanHigh
# Register your models here.
class PostTaiwanTem(admin.ModelAdmin):
    list_display = ('city', 'jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aus', 'sep', 'oct', 'nov', 'dece', 'avg', 'sta_period')

admin.site.register(TaiwanTem, PostTaiwanTem)

class PostTaiwanHigh(admin.ModelAdmin):
    list_display = ('city', 'jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aus', 'sep', 'oct', 'nov', 'dece', 'avg', 'sta_period')

admin.site.register(TaiwanHigh, PostTaiwanHigh)