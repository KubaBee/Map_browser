from map_browser.models import (
    Map,
    Archive,
    People,
    Languages,
    PublicationPlaces,
    SubjectTypes,
)
import openpyxl
from django.contrib.auth.models import User


def get_fn_ln(instance, row, fn_col, ln_col):
    if row[fn_col].value is not None or row[ln_col].value is not None:
        if row[fn_col].value is None:
            fn = ''
        else:
            fn = row[fn_col].value
        if row[ln_col].value is None:
            ln = ''
        else:
            ln = row[ln_col].value
        if row[fn_col].value is not None and row[ln_col].value is not None:
            fn = row[fn_col].value
            ln = row[ln_col].value

        if instance == 'user':
            obj, created = User.objects.get_or_create(
                username=fn + ln, password='Testing4321', first_name=fn, last_name=ln
            )
        elif instance == 'author':
            obj, created = People.objects.get_or_create(first_name=fn, last_name=ln)
        elif instance == 'place':
            obj, created = PublicationPlaces.objects.get_or_create(
                country_name=fn, city_name=ln
            )
        else:
            obj = None
        return obj


def get_archive(row, starting_col):
    nazwa_zespolu = row[starting_col].value
    jednostka_arch = row[starting_col + 1].value
    nr_karty = row[starting_col + 2].value
    nazwa_arch = row[starting_col + 7].value
    list_of_items = [nazwa_arch, jednostka_arch, nazwa_zespolu, nr_karty]
    if (
        nazwa_arch is not None
        or nazwa_zespolu is not None
        or jednostka_arch is not None
        or nr_karty is not None
    ):
        fixed_list = ['' for x in list_of_items if x is None]
        archive, created = Archive.objects.get_or_create(
            archive_name=list_of_items[0],
            archive_unit=list_of_items[1],
            archive_team=list_of_items[2],
            archive_number=list_of_items[3],
        )
        return archive
    return None


def upload_excel_to_postgres():
    book = openpyxl.load_workbook('Sample/MetadaneKartografia1.xlsx')
    sheet = book.active

    for row in sheet.iter_rows(2, 53):

        filename = row[1].value.split('/')[5] + '.jpg'
        thumbnail = row[1].value.split('/')[5] + '_copy.jpg'
        archive = get_archive(row, 33)
        corrector = get_fn_ln('author', row, 17, 18)
        pub_place = get_fn_ln('place', row, 21, 20)
        full_title = row[9].value if row[9].value is not None else ''
        short_title = row[10].value if row[10].value is not None else ''
        pub_address = row[19].value if row[19].value is not None else ''
        creation_year = row[22].value if row[22].value is not None else ''
        scale = row[23].value if row[23].value is not None else ''
        subject = row[24].value if row[24].value is not None else ''
        creation_type = row[25].value if row[25].value is not None else ''
        description = row[32].value if row[32].value is not None else ''
        source_txt = row[36].value if row[36].value is not None else ''
        keyword_subject = row[37].value if row[37].value is not None else ''
        keyword_name = row[38].value if row[38].value is not None else ''
        keyword_geo = row[39].value if row[39].value is not None else ''
        additional_notes = row[41].value if row[41].value is not None else ''

        # creating map object and adding all values
        current_map, created = Map.objects.get_or_create(
            filename=filename,
            thumbnail=thumbnail,
            archive_id=archive,
            corrector_id=corrector,
            full_title=full_title,
            short_title=short_title,
            publishing_address=pub_address,
            publication_place=pub_place,
            created_at=creation_year,
            scale=scale,
            subject=subject,
            creation_type=creation_type,
            description=description,
            source_text=source_txt,
            keyword_subject=keyword_subject,
            keyword_name=keyword_name,
            keyword_geo=keyword_geo,
            additional_notes=additional_notes,
        )
        current_map.save()

        # Adding Map Creators and Authors
        creators = [
            get_fn_ln('user', row, 2, 3),
            get_fn_ln('user', row, 4, 5),
            get_fn_ln('user', row, 6, 7),
        ]
        authors = [
            get_fn_ln('author', row, 11, 12),
            get_fn_ln('author', row, 13, 14),
            get_fn_ln('author', row, 15, 16),
        ]
        not_empty_creators = [x for x in creators if x is not None]
        not_empty_authors = [x for x in authors if x is not None]
        current_map.creator.add(*not_empty_creators)
        current_map.authors.add(*not_empty_authors)

        # Adding multiple languages
        lang = [
            x.strip().capitalize()
            for x in [row[29].value, row[30].value, row[31].value]
            if x is not None
        ]
        lang_obj = []
        for single in lang:
            single, created = Languages.objects.get_or_create(language_name=single)
            lang_obj.append(single)
        current_map.language_id.add(*lang_obj)

        # Adding multiple subject types
        subject_type = [
            x.strip().capitalize()
            for x in [row[26].value, row[27].value, row[28].value]
            if x is not None
        ]
        subject_type_obj = []
        for single in subject_type:
            single, created = SubjectTypes.objects.get_or_create(name=single)
            subject_type_obj.append(single)

        current_map.subject_type.add(*subject_type_obj)


upload_excel_to_postgres()
