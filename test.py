from map_browser.models import People
from PIL import Image

image = Image.open(r'media/maps/1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg.jpg')

MAX_SIZE = (458*2, 312*2)

image.thumbnail(MAX_SIZE)

image.save('media/maps/1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg_copy.jpg')
image.show()