try:
    from .dev_settings import *
except:
    from .prod_settings import *
