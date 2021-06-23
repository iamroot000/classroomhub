from django import forms
from .models import UploadFileModel

class UploadFileForm(forms.ModelForm):
    title = forms.CharField(max_length=30, label="Title")
    description = forms.CharField(max_length=100, widget=forms.Textarea(attrs={'rows':5, 'cols': 16, 'placeholder': "Description Here"}), label="Description")
    file = forms.FileField()

    class Meta:
        model = UploadFileModel
        fields = [
            'title',
            'description',
            'file'
        ]

    def clean_file(self):
        file = self.cleaned_data.get("file")
        _file = str(file).replace(' ', '_').split('.')
        if _file[-1].lower() == 'csv':
            return file
        else:
            raise forms.ValidationError("Invalid Format")
