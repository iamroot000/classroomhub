from classroom.celery import app
import time

def servertasks():
    test = app.send_task('celery_test.testing', args=['/home/ubuntu/Desktop/'], kwargs={})
    data = test.get()
    test.forget()
    return data
