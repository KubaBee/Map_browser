# Generated by Django 4.0.3 on 2022-04-02 19:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('map_browser', '0014_alter_map_scale'),
    ]

    operations = [
        migrations.CreateModel(
            name='SubjectTypes',
            fields=[
                (
                    'id',
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name='ID',
                    ),
                ),
                ('name', models.CharField(blank=True, max_length=50)),
            ],
        ),
        migrations.RemoveField(
            model_name='map',
            name='creation_type',
        ),
        migrations.AddField(
            model_name='map',
            name='creation_type',
            field=models.ManyToManyField(
                blank=True, null=True, to='map_browser.subjecttypes'
            ),
        ),
    ]
