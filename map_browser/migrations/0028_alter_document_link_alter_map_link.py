# Generated by Django 4.0.3 on 2022-10-18 14:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        (
            'map_browser',
            '0027_map_link_alter_document_doc_file_alter_document_link_and_more',
        ),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='link',
            field=models.URLField(
                blank=True, null=True, verbose_name='Link do dokumentu'
            ),
        ),
        migrations.AlterField(
            model_name='map',
            name='link',
            field=models.URLField(
                blank=True, null=True, verbose_name='Link do dokumentu'
            ),
        ),
    ]
