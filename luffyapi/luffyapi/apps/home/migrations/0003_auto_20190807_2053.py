# Generated by Django 2.2.4 on 2019-08-07 12:53

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_auto_20190807_0851'),
    ]

    operations = [
        migrations.CreateModel(
            name='NavInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('orders', models.IntegerField(verbose_name='显示顺序')),
                ('is_show', models.BooleanField(default=False, verbose_name='是否上架')),
                ('is_delete', models.BooleanField(default=False, verbose_name='逻辑删除')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name='修改时间')),
                ('name', models.CharField(max_length=150, verbose_name='导航名称')),
                ('link', models.CharField(max_length=150, verbose_name='导航链接地址')),
                ('opt', models.SmallIntegerField(choices=[(1, '头部导航'), (2, '脚部导航')], default=1, verbose_name='导航位置')),
            ],
            options={
                'verbose_name': '导航',
                'verbose_name_plural': '导航',
                'db_table': 'ly_nav',
            },
        ),
        migrations.AddField(
            model_name='bannerinfo',
            name='create_time',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now, verbose_name='创建时间'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='bannerinfo',
            name='update_time',
            field=models.DateTimeField(auto_now=True, verbose_name='修改时间'),
        ),
    ]
