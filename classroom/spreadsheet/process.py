from django.conf import settings
from grading_management.models import *
from .models import *
import csv, json, os, time



def convertTocsv(file=None, myval=False, save=True):
    file_path = os.path.join(settings.MEDIA_ROOT, str(file))
    csvpath = file_path
    csvfile = open(csvpath)
    csvreader = csv.DictReader(csvfile)
    if myval:
        rval = {
            "data": [],
            "key": []
        }

        for data in csvreader:
            rval["data"].append(data)
            for key,value in data.items():
                if key not in rval["key"]:
                    rval["key"].append(key)
        return rval
    else:
        cleaned_data = [
        ]
        try:
            for data in csvreader:
                dict_val = {}
                for key,value in data.items():
                    dict_val.update({str(key).strip():str(value).strip()})
                cleaned_data.append(dict_val)
            if save is False:
                for data in cleaned_data:
                    for key, value in data.items():
                        if key not in getstudentfield():
                            return False
                return True
            else:
                for data in cleaned_data:
                    students.objects.create(**data)
                return True
        except Exception as e:
            print(str(e))
            return False


def getstudentfield():
    field_val = students._meta.get_fields()
    field_exception = ["id"]
    field_data = []
    for i in list(field_val):
        val = str(i).split('.')[-1]
        if val not in field_exception:
            field_data.append(val)

    return field_data



def getdownloadhistoryfield():
    field_val = DownloadHistoryModel._meta.get_fields()
    field_exception = ["id"]
    field_data = []
    for i in list(field_val):
        val = str(i).split('.')[-1]
        if val not in field_exception:
            field_data.append(val)

    return field_data



def getlatestrow(title=False, description=False, file=False, created=False, id=False):
    latest_id = UploadFileModel.objects.last()
    latest_data = UploadFileModel.objects.get(id=int(str(latest_id)))
    if file:
        return latest_data.file
    elif title:
        return latest_data.title
    elif description:
        return latest_data.description
    elif created:
        return latest_data.created
    elif id:
        return latest_data.id
    return latest_data

def getstudentdata():
    studentdata = list(students.objects.values()[0:10])
    rval = {
        "data": [],
        "key": []
    }

    for data in studentdata:
        del data['id']
        rval["data"].append(data)
        for key,value in data.items():
            if key not in rval["key"] and key != 'id':
                rval["key"].append(key)

    print("this is the student data: ", rval['data'])
    return rval



def savedatainfo(upload=False, history=False, **data):
    print('this is the username: ', data["username"])
    if upload:
        latest_id = UploadFileModel.objects.last()
        latest_data = UploadFileModel.objects.get(id=int(str(latest_id)))
        latest_data.username = data["username"]
        latest_data.save()
    if history:
        DownloadHistoryModel.objects.create(**data)
    return True


if __name__ == "__main__":
    file = "files/AdminLTE_3__DataTables_8GWQdeH.csv"
    convertTocsv(file)
