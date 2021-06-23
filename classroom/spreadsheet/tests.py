from django.test import TestCase

# Create your tests here.
from django.conf import settings
import csv, json, os



def convertTocsv(file=None):
    file_path = os.path.join(settings.MEDIA_ROOT, file)
    csvpath = file_path
    jsonpath = file_path.replace(".csv", ".json")

    data = {}
    csvfile = open(csvpath)
    csvreader = csv.DictReader(csvfile)
    for csvrow in csvreader:
        print(csvrow)


if __name__ == "__main__":
    file = "files/AdminLTE_3__DataTables_8GWQdeH.csv"
    convertTocsv(file)
