from django.test import TestCase
from django.core.files.uploadedfile import SimpleUploadedFile
from django.contrib.auth.models import User
from PIL import Image
import os
from io import BytesIO

from map_browser.models import Map, Document, make_thumbnail, upload_thumbnail_path


class ThumbnailTest(TestCase):
    def setUp(self):
        # Create a user for testing
        self.user = User.objects.create_user(username='testuser', password='testpass')

        # Create a map instance
        self.map_instance = Map.objects.create(
            filename=SimpleUploadedFile("map.jpg", b"file_content"),
            is_active=True,
            creator=[self.user],
        )

        # Create a document instance
        self.document_instance = Document.objects.create(
            title="Test Document",
            doc_file=SimpleUploadedFile("document.pdf", b"file_content"),
            is_active=True,
            creator=[self.user],
        )

    def test_make_thumbnail_map(self):
        # Call make_thumbnail for a Map instance
        self.assertTrue(make_thumbnail(self.map_instance))

        # Check if the thumbnail field is not None
        self.assertIsNotNone(self.map_instance.thumbnail)

    def test_make_thumbnail_document(self):
        # Call make_thumbnail for a Document instance
        self.assertTrue(make_thumbnail(self.document_instance))

        # Check if the thumbnail field is not None
        self.assertIsNotNone(self.document_instance.thumbnail)

    def test_upload_thumbnail_path_map(self):
        # Call upload_thumbnail_path for a Map instance
        path = upload_thumbnail_path(self.map_instance, "image.jpg")

        # Check if the path is constructed correctly
        expected_path = os.path.join("thumbnails", f"{self.map_instance.pk}.jpg")
        self.assertEqual(path, expected_path)

    def test_upload_thumbnail_path_document(self):
        # Call upload_thumbnail_path for a Document instance
        path = upload_thumbnail_path(self.document_instance, "image.jpg")

        # Check if the path is constructed correctly
        expected_path = os.path.join("doc_thumbnails", f"{self.document_instance.pk}_copy.jpg")
        self.assertEqual(path, expected_path)

    def test_save_map_with_thumbnail(self):
        # Create a map instance with a thumbnail
        map_instance = Map.objects.create(
            filename=SimpleUploadedFile("map.jpg", b"file_content"),
            is_active=True,
            creator=[self.user],
            thumbnail=SimpleUploadedFile("thumbnail.jpg", b"file_content"),
        )

        # Check if saving the map instance is successful
        self.assertTrue(map_instance.id is not None)

    def test_save_document_with_thumbnail(self):
        # Create a document instance with a thumbnail
        document_instance = Document.objects.create(
            title="Test Document",
            doc_file=SimpleUploadedFile("document.pdf", b"file_content"),
            is_active=True,
            creator=[self.user],
            thumbnail=SimpleUploadedFile("thumbnail.jpg", b"file_content"),
        )

        # Check if saving the document instance is successful
        self.assertTrue(document_instance.id is not None)