$(document).ready(function(){

//main variable
const url = ""
const confirm_rul = "confirm/"
const alertBox = $("#alert-box");
const msgBox = $("#msg-box")
//const msgBox = $("#exampleModalLabel")
const form = $("#p-form")
const tableContent = $("#table-content")
//form values
const title = $("#id_title")
const description = $("#id_description")
const file = $("#id_file")
//csrf value
const csrf = $("input[name=csrfmiddlewaretoken]")
//modal
//const modalTable = $("#modal-table")
const modalBody = $("#modal-body")
const modalSave = $("#modal-save")
const modalShow = $("#modal-show")
const modalClose = $("#modal-close")
//modal table
const modalTcontent = $("#modal-table-content")
const modalThead = $("#modal-table-head")
//other variables
const tabletitle = 'Summary <span class="label label-default">Information:</span>'





//datatable settings
function tablesettings(tdestroy=false){
    if(tdestroy == true){
        table = $('#applicantTable').DataTable().destroy()
        table = $('#applicantTable').DataTable({
            "paging": false,
            "lengthChange": true,
            "searching": false,
            "ordering": false,
            "info": false,
            "autoWidth": false,
            "responsive": true,
            "retrieve": true,

        })
    }
    else{
        table = $('#applicantTable').DataTable().destroy()
        table = $('#applicantTable').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
            "order": [[ 3, "desc" ]], //or desc (for descending)
            "columnDefs" : [{"targets":1, "type":"date"}],
            "draw": 1,
            "recordsTotal": 10,
            "recordsFiltered": 10,
            "bLengthChange": true,
            "lengthMenu": [ [10, 15, 25, 50, 100, -1], [10, 15, 25, 50, 100, "All"] ],
            "iDisplayLength": 10,
            "bInfo": false,
            "responsive": true,
            "bAutoWidth": false,
            "retrieve": true,
        })
    }


}

//get table info
function tabledata(tdestroy=false){
$.ajax({
    type: 'GET',
    url: url,
    success: function(response){
        console.log("This is the lengh of table response: ", response["table"])
        $('#table-title').html(tabletitle)
        tableContent.empty()
        for (let value of response["table"]){
            tableContent.prepend(`<tr>
            <td>${value["title"]}</td>
            <td>${value["description"]}</td>
            <td>${value["file"]}</td>
            <td>${value["created"]}</td>
            <td><button value=${value["id"]} type="button" class="btn btn-secondary" id="action-button${value['id']}">Details</button></td>
            </tr>`)
        }
    if (tdestroy == true){
        tablesettings(tdestroy=true)
    }
    else{
        tablesettings()
    }
    },
    error: function(error){
            console.log(error)
    },
})
}



//show valid info button
function showdetails(message=null,object){
    const response = object
    if(message == 'danger'){
        $("#btn-info").html(`<button type="button" class="btn btn-info" id="${message}-btn">Show Valid Format</button>`)
        $(`#${message}-btn`).on('click', function(){
        if($(this).text() == "Back"){
            $('#table-title').html(tabletitle)
            $(`#${message}-btn`).text("Show Valid Format")
            modaltabledata(object=response,tshow=false)
            $('.table-HF').find('.table-HF-row2').remove()
            $('.table-HF-row2').empty()
            $('.table-HF-row').show()
            $('#table-content').empty()
            $('#table-content').show()
            $(".body-tables").empty()
            tabledata()
        }
        else{
            $('#table-title').html('Valid Data <span class="label label-default">Information:</span>')
            $(`#${message}-btn`).text("Back")
            modaltabledata(object=response,tshow=true)
            $('#applicantTable_filter').remove()
            $('#applicantTable_length').remove()
            $('#applicantTable_paginate').remove()
            $('#applicantTable_info').remove()

        }
        })
    }
    else if(message == 'warning'){
        $("#btn-info").html(`<button type="button" class="btn btn-info" id="${message}-btn" data-toggle="modal" data-target="#exampleModal">Show Valid Extension</button>`)
        const url = ['https://www.efilecabinet.com/wp-content/uploads/2019/03/csv-01.png']
        modalBody.empty()
        for (let urlval of url){
            modalBody.append(`<p><img src="${url}" width="100%"></p>`)
        }
    }
    else{
        $("#btn-info").empty()
    }

}



//adding modal table data
function modaltabledata(object,tshow=false){
    console.log(object)
    modalThead.empty()
    modalTcontent.empty()
    const response = object
    const thedata = response["studentdata"]["data"]
    const theheader = response["studenthead"]
    console.log("this is the student data: ", thedata)
    if (tshow == true){
        $('.table-HF').append(`<tr class="table-HF-row2" class="table-success"></tr>`)
        $('.table-HF-row').hide()
        $('#table-content').hide()
    }
    for (let key of theheader){
        $('.table-HF-row2').append(`<th class="table-success">${key}</th>`)
//        modalThead.append(`<th>${key}</th>`)
    }

    for (let data of thedata){
            const _datakey = []
            const _dataval = []
            const _randomlist = []
            for (let [_key, _value] of Object.entries(data)){
                _datakey.push(_key)
                _dataval.push(_value)
            }
            const datafirst = 0
            const datalast = theheader.length - 1
            const datafirstval = _dataval[datafirst]
            const datalastval = _dataval[datalast]
            const datafirstkey = _datakey[datafirst]
            const datalastkey = _datakey[datalast]
            for (let i of _dataval){
                if (i == data[datafirstkey]){
                    $('#table-content2').append(`<tr>`)
//                    modalTcontent.append(`<tr>`)
                }
                $('#table-content2').append(`<td>${i}</td>`)
//                modalTcontent.append(`<td>${i}</td>`)

                if (_dataval.lastIndexOf(i) == datalast){
                    $('#table-content2').append(`</tr>`)
//                    modalTcontent.append("</tr>")
                }
            }
    }


}


//call file form
file.on('change', function(){

})

//form
form.on('submit', function(e){
    e.preventDefault()
    const fd = new FormData()
    fd.append('csrfmiddlewaretoken', csrf.val())
    fd.append('title', title.val())
    fd.append('description', description.val())
    fd.append('file', file[0].files[0])
    $.ajax({
        type: 'POST',
        url: url,
        enctype: 'multipart/form-data',
        data: fd,
        success:  function(response){
//            modaltabledata(response)
            $('#table-title').html(tabletitle)
            $('.table-HF').find('.table-HF-row2').remove()
            $('.table-HF-row2').empty()
            $('.table-HF-row').show()
            $('#table-content').empty()
            $('#table-content').show()
            $(".body-tables").empty()
            console.log($(".body-tables").val())
            setTimeout(()=>{
                title.val('')
                description.val('')
                file.val('')
                msgBox.html(`<div align="center" class="alert alert-${response['message']}" role="alert"><h4 class="alert-heading">${response["status"]["file"][0]}</h4></div>`)
            }, 100)
            setTimeout(()=>{
                msgBox.empty()
            }, 5000)
            tabledata()
            showdetails(message=response['message'],object=response)
            },
        error: function(error){
        msgBox.html(`<div class="alert alert-danger" role="alert">${error["data"]}</div>`)
        console.log(error["data"])
        },
        cache: false,
        contentType: false,
        processData: false,
    })

})


tabledata()


});
