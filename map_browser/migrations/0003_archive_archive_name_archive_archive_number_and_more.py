# Generated by Django 4.0.3 on 2022-03-20 19:05

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('map_browser', '0002_archive_languages_people_publicationplaces_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='archive',
            name='archive_name',
            field=models.CharField(blank=True, max_length=40),
        ),
        migrations.AddField(
            model_name='archive',
            name='archive_number',
            field=models.CharField(blank=True, max_length=40),
        ),
        migrations.AddField(
            model_name='archive',
            name='archive_team',
            field=models.CharField(blank=True, max_length=40),
        ),
        migrations.AddField(
            model_name='archive',
            name='archive_unit',
            field=models.CharField(blank=True, max_length=40),
        ),
        migrations.AddField(
            model_name='languages',
            name='language_code',
            field=models.CharField(blank=True, max_length=4),
        ),
        migrations.AddField(
            model_name='languages',
            name='language_name',
            field=models.CharField(blank=True, max_length=30),
        ),
        migrations.AddField(
            model_name='map',
            name='additional_notes',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='map',
            name='archive_id',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to='map_browser.archive',
            ),
        ),
        migrations.AddField(
            model_name='map',
            name='author1_id',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name='%(class)s_first',
                to='map_browser.people',
            ),
        ),
        migrations.AddField(
            model_name='map',
            name='author2_id',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name='%(class)s_second',
                to='map_browser.people',
            ),
        ),
        migrations.AddField(
            model_name='map',
            name='author3_id',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name='%(class)s_third',
                to='map_browser.people',
            ),
        ),
        migrations.AddField(
            model_name='map',
            name='corrector_id',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name='%(class)s_corrector',
                to='map_browser.people',
            ),
        ),
        migrations.AddField(
            model_name='map',
            name='created_at',
            field=models.DateTimeField(
                auto_now_add=True, default=django.utils.timezone.now
            ),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='map',
            name='creation_type',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AddField(
            model_name='map',
            name='creator',
            field=models.ForeignKey(
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to=settings.AUTH_USER_MODEL,
            ),
        ),
        migrations.AddField(
            model_name='map',
            name='description',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='map',
            name='filename',
            field=models.FilePathField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='map',
            name='full_title',
            field=models.CharField(blank=True, max_length=200),
        ),
        migrations.AddField(
            model_name='map',
            name='keyword_geo',
            field=models.CharField(blank=True, max_length=200),
        ),
        migrations.AddField(
            model_name='map',
            name='keyword_name',
            field=models.CharField(blank=True, max_length=200),
        ),
        migrations.AddField(
            model_name='map',
            name='keyword_subject',
            field=models.CharField(blank=True, max_length=200),
        ),
        migrations.AddField(
            model_name='map',
            name='language_id',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to='map_browser.languages',
            ),
        ),
        migrations.AddField(
            model_name='map',
            name='publication_place',
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to='map_browser.publicationplaces',
            ),
        ),
        migrations.AddField(
            model_name='map',
            name='publishing_address',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AddField(
            model_name='map',
            name='scale',
            field=models.IntegerField(blank=True, default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='map',
            name='short_title',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AddField(
            model_name='map',
            name='subject',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AddField(
            model_name='map',
            name='subject_type',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AddField(
            model_name='publicationplaces',
            name='city_name',
            field=models.CharField(blank=True, max_length=40),
        ),
        migrations.AddField(
            model_name='publicationplaces',
            name='country_name',
            field=models.CharField(blank=True, max_length=40),
        ),
        migrations.AlterField(
            model_name='people',
            name='first_name',
            field=models.CharField(blank=True, max_length=30),
        ),
        migrations.AlterField(
            model_name='people',
            name='last_name',
            field=models.CharField(blank=True, max_length=30),
        ),
    ]
