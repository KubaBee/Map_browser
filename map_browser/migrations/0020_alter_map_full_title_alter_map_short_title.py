# Generated by Django 4.0.3 on 2022-04-03 10:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('map_browser', '0019_alter_map_created_at_alter_map_publishing_address'),
    ]

    operations = [
        migrations.AlterField(
            model_name='map',
            name='full_title',
            field=models.CharField(blank=True, max_length=500),
        ),
        migrations.AlterField(
            model_name='map',
            name='short_title',
            field=models.CharField(blank=True, max_length=200),
        ),
    ]
