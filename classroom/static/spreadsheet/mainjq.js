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



//history datatable settings
function tablesettingsmodal(){
        $('#modal-table').DataTable({
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


//datatable settings
function tablesettings(tdestroy=false,tablename='#applicantTable'){
    if(tdestroy == true){
        table = $(tablename).DataTable().destroy()
        table = $(tablename).DataTable({
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
        table = $(tablename).DataTable().destroy()
        table = $(tablename).DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
            "order": [[ 4, "desc" ]], //or desc (for descending)
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
            if (response["permission"] == true){
                tableContent.prepend(`<tr>
                <td>${value["username"]}</td>
                <td>${value["title"]}</td>
                <td>${value["description"]}</td>
                <td>${value["file"].split('/')[1]}</td>
                <td>${value["created"]}</td>
                <td><a href='download/${value["file"]}' class="nav-link"><button value=${value["id"]} type="button" class="btn btn-success download-btn" id="action-button${value['id']}"><i class="fa fa-download"></i>&nbsp;Download</button></a></td>
                </tr>`)
                $(`#action-button${value['id']}`).on('click', function(){
                alert(`${value["file"].split('/')[1]} will be downloaded.`)
                })
                historydata()
                $('#history-btn').show()
            }
            else{
                tableContent.prepend(`<tr>
                <td>${value["username"]}</td>
                <td>${value["title"]}</td>
                <td>${value["description"]}</td>
                <td>${value["file"].split('/')[1]}</td>
                <td>${value["created"]}</td>
                </tr>`)
                $('.action-perm').remove()
                $('#history-area').remove()
            }

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



//show modal valid info button
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
            $('#history-btn').show()
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
            $('#history-btn').hide()

        }
        })
    }
    else if(message == 'warning'){
        $("#btn-info").html(`<button type="button" class="btn btn-info" id="${message}-btn" data-toggle="modal" data-target="#exampleModal">Show Valid Extension</button>`)
        const url = ['https://www.efilecabinet.com/wp-content/uploads/2019/03/csv-01.png']
        modalBody.empty()
        $('#exampleModalLabel').text('Please save to .csv format.')
        for (let urlval of url){
            modalBody.append(`<p><img src="${url}" width="100%"></p>`)
        }
    }
    else{
        $("#btn-info").empty()
    }

}



//adding table data
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




//history modal
function historydata(){
    $('#history-area').html('<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#historymodal" id="history-btn"><i class="fa fa-fax"></i>&nbsp;Download History</button>')
    $('#history-btn').on('click', function(){
        $.ajax({
            type: 'GET',
            url: 'history',
            success: function(response){
                console.log(response)
                $('#historylabel').text('Download Information:')
                modalThead.empty()
                modalTcontent.empty()
                for (let head of response['tablehead']){
                    modalThead.append(`<th>${head.toUpperCase()}</th>`)
                }
                for (let tabledata of response['table']){
                    if (tabledata['status'] == "MISSING"){
                        modalTcontent.prepend(`<tr>
                        <td>${tabledata['username']}</td>
                        <td><span class="badge badge-warning">${tabledata['status']}</span></td>
                        <td>${tabledata['file']}</td>
                        <td>${tabledata['created']}</td>
                        </tr>`)
                    }
                    else{
                        modalTcontent.prepend(`<tr>
                        <td>${tabledata['username']}</td>
                        <td><span class="badge badge-success">${tabledata['status']}</span></td>
                        <td>${tabledata['file']}</td>
                        <td>${tabledata['created']}</td>
                        </tr>`)
                    }
                }
                tablesettingsmodal()
            },
            error: function(error){
                console.log(error)
            }
            })
    })

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
