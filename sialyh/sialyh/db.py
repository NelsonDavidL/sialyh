import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SQLITE = {
    'default':{
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db/sqlite/db.sqlite3'),
    }
}

POSTGRESQL = {
    'default':{
        'ENGINE':'django.db.backends.postgresql_psycopg2',
        'NAME':'sialyh',
        'USER':'postgres',
        'PASSWORD':'postgres',
        'HOST':'localhost',
        'DATABASE_PORT':'5432',
    }
}

MYSQL = {
    'default':{
    'ENGINE':'django.db.backends.mysql',
    'NAME':'sialyh',
    'USER': 'root',
    'PASSWORD': 'adminadmin',
    'HOST':'localhost',
    'PORT':'3306',
    }
}
