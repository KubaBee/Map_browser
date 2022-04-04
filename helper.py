import gdown
import os
from pathlib import Path
import re
import psycopg2
import openpyxl
from pathlib import Path
from PIL import Image


def download_images():

    text = """https://drive.google.com/file/d/1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg/view?usp=sharing
https://drive.google.com/file/d/1LqOGQWqHrxRTzz5besNgkv3gWLqIS0vO/view?usp=sharing
https://drive.google.com/file/d/1voYIurZMGyYMAlFj2SJG-d_ufN8dZyQQ/view?usp=sharing
https://drive.google.com/file/d/1FLIKDC9_e7FloeTiGdUvAoe5ZXSFGbi7/view?usp=sharing
https://drive.google.com/file/d/1H745Iz4vzRJVAyLu9JZG678qjg2u7hyK/view?usp=sharing
https://drive.google.com/file/d/1b4Dne8muw16rEE9qU3e1-dN9et5H2H-s/view?usp=sharing
https://drive.google.com/file/d/12konZdBtMZ1nMpQIAwXGj9Ho-1dZSzXw/view?usp=sharing
https://drive.google.com/file/d/1bQSTP0r-aoRbYkjUtpk6Bdp99MtnNASg/view?usp=sharing
https://drive.google.com/file/d/1C9qAALloCYU2k9sVxHtibZtRo0OmuA4w/view?usp=sharing
https://drive.google.com/file/d/1MPS4f1CWOG3E2I9zqzX3cFeND05IVmBO/view?usp=sharing
https://drive.google.com/file/d/1GoYAQQ1b0uuH_iOvU_abZXhcuts3acXf/view?usp=sharing
https://drive.google.com/file/d/1ynRfnx7QptCMIt_q4XFd1kcXdryldSP2/view?usp=sharing
https://drive.google.com/file/d/14Xdi6q7m_W18g7L0J2_a-UVahlAdaQFJ/view?usp=sharing
https://drive.google.com/file/d/1wB0xU_DD5FmRxvGRPie-jA80MJ1M2cw-/view?usp=sharing
https://drive.google.com/file/d/1yhgoi1jtLzhq2FmGYKvYfRnYX-WCz5H_/view?usp=sharing
https://drive.google.com/file/d/14R4j7UEpK0bzS3DUAuzNnQfz2hTfUKJ-/view?usp=sharing
https://drive.google.com/file/d/1qFsaLOTTVUkFcQidzsCEO1csbL9-SjA1/view?usp=sharing
https://drive.google.com/file/d/1S0-Bw_k93Pea0m0UhXFV9oyc3i30kQ2n/view?usp=sharing
https://drive.google.com/file/d/1hRcAkJzBZ9sOKIW5XrkFA_6M2kj907CQ/view?usp=sharing
https://drive.google.com/file/d/1NJXX6muvnRGgw5hJUAzW5kqVaKHcNVAE/view?usp=sharing
https://drive.google.com/file/d/1Yntg0yApgMSzJD6prn4TnOYiGrhk-U0Z/view?usp=sharing
https://drive.google.com/file/d/1j3yfU2yjEZ4q9g37lYe1PSda2NHA9pss/view?usp=sharing
https://drive.google.com/file/d/18qhsMLJXMmqgEnnrBhFjx1El1BPoeV4C/view?usp=sharing
https://drive.google.com/file/d/1RZ-AINxdw2DBaveArdGhxr04sSYlFw_P/view?usp=sharing
https://drive.google.com/file/d/1m2a2KCNDdn_OgCfn11rVYQFskl_1e9L2/view?usp=sharing
https://drive.google.com/file/d/1WkjPYruEHs-0sBhT0CgAjvoV3RbfqRkP/view?usp=sharing
https://drive.google.com/file/d/1gB_U1of3C6dZHn3GuhhmfpcqaLaAPond/view?usp=sharing
https://drive.google.com/file/d/1hrtJwd_n50BbOW3LmUSRHBhox020Xx1Z/view?usp=sharing
https://drive.google.com/file/d/11WLlDlCEEE2qVmtMFfivH5ZlcP3Vt2Zi/view?usp=sharing
https://drive.google.com/file/d/1Aq2yGf_lu2UpqB99IPMOx2EU3rDd0TIR/view?usp=sharing
https://drive.google.com/file/d/1XnpiaoXgJxuzgmSR3lR0fi7BS29plIeV/view?usp=sharing
https://drive.google.com/file/d/1hvulai1cPgp1pqxuHYm7cNd-KszBpKO8/view?usp=sharing
https://drive.google.com/file/d/1Ib7uPHNEjtyXl8Or3mK1gDjwxokcAD3r/view?usp=sharing
https://drive.google.com/file/d/1mm5LQ7jSijXbmOaBOVFPcWqmYq0R7-t6/view?usp=sharing
https://drive.google.com/file/d/1jxOCjv4vAtwZCOLnnwjseXY5ii-FPx9-/view?usp=sharing
https://drive.google.com/file/d/12UnPfMY86-khkdF4u5orDRCixwS_E-yX/view?usp=sharing
https://drive.google.com/file/d/15tit5BKNRlTvYBgb_tK9XiNYjt0S8SCV/view?usp=sharing
https://drive.google.com/file/d/1k0qShA2HKg-w8sEd2_rOVQM6WaZMHNZ8/view?usp=sharing
https://drive.google.com/file/d/1dmirt85xe4oACzQtMtWE-Zn-0Ul8MGvk/view?usp=sharing
https://drive.google.com/file/d/1jmnVwI4TlgWLITIKWhcdRLE8M_8rHUzr/view?usp=sharing
https://drive.google.com/file/d/17HXvGMonyJANUXQfvJ1ivdz_5IwcW8nJ/view?usp=sharing
https://drive.google.com/file/d/1feADX0lwLKF05l9QsqQFm-Pu4LnqrvLN/view?usp=sharing
https://drive.google.com/file/d/1QuEvNoXt0BZqXfbla06cSGyTqZ0EDqSy/view?usp=sharing
https://drive.google.com/file/d/1kk9tJI-lyVsfOOI3DV-JaYgzv9D1xv3f/view?usp=sharing
https://drive.google.com/file/d/1xVWY4dURE2fixm1Zg4VbQ7ChD8aArVDk/view?usp=sharing
https://drive.google.com/file/d/1QvHT0kjn3OhuY_SH_7EgaU8y7lF5G7N8/view?usp=sharing
https://drive.google.com/file/d/1Hx7H48BtD_OAZOYlAHnuawxreyHRwd8Q/view?usp=sharing
https://drive.google.com/file/d/1HNUM8FcdaLjl1XlaF8aZSq88DkHYFjOy/view?usp=sharing
https://drive.google.com/file/d/1HOc57xqNQy6TrLKAIIkqvYpIQO2waZBB/view?usp=sharing
https://drive.google.com/file/d/1CrXvqjG71WEmIB1IK-dOQ5ZZlYdaarHE/view?usp=sharing
https://drive.google.com/file/d/1knakHHFR-xt_qT4pMvA0fGeq_Zg069ee/view?usp=sharing
https://drive.google.com/file/d/1xi7-kVjySUH8G2TpjZuKx4vhN9ZoBKhD/view?usp=sharing
"""

    list_of_links = text.split('\n')

    output = os.path.join(os.getcwd(), 'media/maps')

    if Path(output).is_dir():
        for count, element in enumerate(list_of_links):
            splitted = list_of_links[count].split('/')
            gdown.download('https://drive.google.com/uc?id='+splitted[5], output + os.sep + splitted[5] + ".jpg",
                           quiet=False)


def resize_images():
    MAX_SIZE = (458 * 2, 312 * 2)
    Image.MAX_IMAGE_PIXELS = None

    for filename in os.listdir(r'C:/Users/1kuba/OneDrive/Pulpit/inz/media/maps'):
        image = Image.open(r'C:/Users/1kuba/OneDrive/Pulpit/inz/media/maps/' + filename)
        image.thumbnail(MAX_SIZE)
        splited_img = filename.split('.')
        image.save(r'C:/Users/1kuba/OneDrive/Pulpit/inz/media/thumbnails/' + splited_img[0] + '_copy.jpg')
        print(filename)


resize_images()