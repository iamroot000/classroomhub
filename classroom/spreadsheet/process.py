from django.conf import settings
from grading_management.models import *
import csv, json, os, time



def convertTocsv(file=None):
    file_path = os.path.join(settings.MEDIA_ROOT, str(file))
    csvpath = file_path
    jsonpath = file_path.replace(".csv", ".json")
    csvfile = open(csvpath)
    csvreader = csv.DictReader(csvfile)
    for data in csvreader:
        students.objects.create(last_name=data["last_name"],
                                        first_name=data["first_name"],
                                        q1_grade=data["q1_grade"],
                                        q2_grade=data["q2_grade"],
                                        q3_grade=data["q3_grade"],
                                        q4_grade=data["q4_grade"],
                                        initial_grade=data["initial_grade"],
                                        transm_grade=data["transm_grade"],
                                        subject=data["subject"],
                                        section=data["section"],
                                        performance_task_grade=data["performance_task_grade"],
                                        written_work_grade=data["written_work_grade"]
                                        )






if __name__ == "__main__":
    file = "files/AdminLTE_3__DataTables_8GWQdeH.csv"
    convertTocsv(file)
