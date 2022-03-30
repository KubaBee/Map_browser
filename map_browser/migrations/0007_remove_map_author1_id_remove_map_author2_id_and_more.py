# Generated by Django 4.0.3 on 2022-03-21 18:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('map_browser', '0006_map_filename'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='map',
            name='author1_id',
        ),
        migrations.RemoveField(
            model_name='map',
            name='author2_id',
        ),
        migrations.RemoveField(
            model_name='map',
            name='author3_id',
        ),
        migrations.AddField(
            model_name='map',
            name='authors',
            field=models.ManyToManyField(to='map_browser.people'),
        ),
    ]
