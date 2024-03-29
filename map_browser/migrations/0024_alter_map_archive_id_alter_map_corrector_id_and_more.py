# Generated by Django 4.0.3 on 2022-08-01 17:38

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('map_browser', '0023_alter_map_filename_alter_map_thumbnail'),
    ]

    operations = [
        migrations.AlterField(
            model_name='map',
            name='archive_id',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=models.SET('N/A'),
                to='map_browser.archive',
            ),
        ),
        migrations.AlterField(
            model_name='map',
            name='corrector_id',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=models.SET('N/A'),
                related_name='%(class)s_corrector',
                to='map_browser.people',
            ),
        ),
        migrations.AlterField(
            model_name='map',
            name='publication_place',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=models.SET('N/A'),
                to='map_browser.publicationplaces',
            ),
        ),
        migrations.CreateModel(
            name='Document',
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
                ('title', models.CharField(max_length=250, verbose_name='Tytuł')),
                (
                    'description',
                    models.TextField(blank=True, verbose_name='Opis dokumentu'),
                ),
                ('added_at', models.DateTimeField(auto_now_add=True)),
                (
                    'created_at',
                    models.CharField(
                        blank=True, max_length=150, verbose_name='Data powstania'
                    ),
                ),
                (
                    'keyword_name',
                    models.CharField(
                        blank=True,
                        max_length=500,
                        verbose_name='Słowa kluczowe imienne',
                    ),
                ),
                (
                    'keyword_subject',
                    models.CharField(
                        blank=True,
                        max_length=500,
                        verbose_name='Słowa kluczowe rzeczowe',
                    ),
                ),
                (
                    'keyword_geo',
                    models.CharField(
                        blank=True,
                        max_length=500,
                        verbose_name='Słowa kluczowe geograficzne',
                    ),
                ),
                (
                    'is_statistic_data',
                    models.BooleanField(
                        blank=True, verbose_name='Czy znajdują się dane statystyczne?'
                    ),
                ),
                (
                    'is_map',
                    models.BooleanField(
                        blank=True, verbose_name='Czy znajdują się mapy tekstowe?'
                    ),
                ),
                ('link', models.URLField(verbose_name='Link do dokumentu')),
                (
                    'volume',
                    models.IntegerField(blank=True, verbose_name='Liczba/objętość'),
                ),
                (
                    'doc_format',
                    models.CharField(
                        blank=True, max_length=150, verbose_name='Forma dokumentu'
                    ),
                ),
                (
                    'source_type',
                    models.CharField(
                        blank=True, max_length=150, verbose_name='Typ źródła'
                    ),
                ),
                (
                    'archive_id',
                    models.ForeignKey(
                        blank=True,
                        on_delete=models.SET('N/A'),
                        to='map_browser.archive',
                        verbose_name='Archiwum',
                    ),
                ),
                (
                    'authors',
                    models.ManyToManyField(
                        null=True, to='map_browser.people', verbose_name='Autorzy'
                    ),
                ),
                (
                    'creator',
                    models.ManyToManyField(
                        to=settings.AUTH_USER_MODEL,
                        verbose_name='Osoba wprowadzająca dane',
                    ),
                ),
                (
                    'language_id',
                    models.ManyToManyField(
                        blank=True, to='map_browser.languages', verbose_name='Język/i'
                    ),
                ),
                (
                    'receiver',
                    models.ManyToManyField(
                        blank=True,
                        related_name='receiver_id',
                        to='map_browser.people',
                        verbose_name='Adresat',
                    ),
                ),
                (
                    'source_reference',
                    models.ManyToManyField(
                        blank=True,
                        to='map_browser.map',
                        verbose_name='Odwołanie do mapy źródłowej',
                    ),
                ),
            ],
        ),
    ]
