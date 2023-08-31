from django.test import TestCase
from django.urls import reverse
from django.contrib.auth.models import User
from .models import Map  # Import your Map model


class MapListViewTestCase(TestCase):
    @classmethod
    def setUpTestData(cls):
        # Create test users and maps
        cls.user = User.objects.create_user(username='testuser', password='testpassword')
        cls.map1 = Map.objects.create(full_title='Map 1', is_active=True)
        cls.map2 = Map.objects.create(full_title='Map 2', is_active=False)

    def test_map_list_view_uses_correct_template(self):
        response = self.client.get(reverse('przegladaj-mapy'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'map_browser/map_list.html')

    def test_map_list_view_context(self):
        response = self.client.get(reverse('przegladaj-mapy'))
        self.assertEqual(response.status_code, 200)
        self.assertTrue('map_list' in response.context)
        self.assertTrue('title' in response.context)

    def test_map_list_view_without_authentication(self):
        response = self.client.get(reverse('przegladaj-mapy'))
        self.assertEqual(response.status_code, 200)
        self.assertQuerysetEqual(
            response.context['map_list'],
            Map.objects.filter(is_active=True),
            transform=lambda x: x
        )

    def test_map_list_view_with_authentication(self):
        self.client.login(username='testuser', password='testpassword')
        response = self.client.get(reverse('przegladaj-mapy'))
        self.assertEqual(response.status_code, 200)
        self.assertQuerysetEqual(
            response.context['map_list'],
            Map.objects.all(),
            transform=lambda x: x
        )

    def test_map_list_view_filter_by_title(self):
        response = self.client.get(reverse('przegladaj-mapy'), {'title': 'Map 1'})
        self.assertEqual(response.status_code, 200)
        self.assertQuerysetEqual(
            response.context['map_list'],
            Map.objects.filter(full_title__icontains='Map 1', is_active=True),
            transform=lambda x: x
        )