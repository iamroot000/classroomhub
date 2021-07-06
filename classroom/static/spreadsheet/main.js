const alertBox = document.querySelector("#alert-box")
//const msgBox = document.querySelector("#msg-box")
const msgBox = document.querySelector("#exampleModalLabel")
const form = document.querySelector("#p-form")
const tableContent = document.querySelector("#table-content")

//form values
const title = document.querySelector("#id_title")
const description = document.querySelector("#id_description")
const file = document.querySelector("#id_file")
//csrf value
const csrf = document.getElementsByName("csrfmiddlewaretoken")


//modal
const modalBody = document.querySelector("#modal-body")
const modalSave = document.querySelector("#modal-save")
const modalShow = document.querySelector("#modal-show")
const modalClose = document.querySelector("#modal-close")
//modal table
const modalTcontent = document.querySelector("#modal-table-content")
const modalThead = document.querySelector("#modal-table-head")


const url = ""
const confirm_rul = "confirm/"

String.prototype.shuffle = function () {
    var a = this.split(""),
        n = a.length;

    for(var i = n - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }
    return a.join("");
}

function tablesettings(){
//$('#applicantTable').DataTable({
//        "paging": true,
//        "lengthChange": false,
//        "searching": false,
//        "ordering": true,
//        "info": true,
//        "autoWidth": false,
//        "responsive": true,
//        "order": [[ 3, "desc" ]], //or desc (for descending)
//        "columnDefs" : [{"targets":1, "type":"date"}],
//    })
}


function TableData(refresh=false){
$.ajax({
    type: 'GET',
    url: url,
    success: function(response){
        console.log(refresh)
        for (let value of response["table"]){
            tableContent.innerHTML += `<tr>
            <td>${value["title"]}</td>
            <td>${value["description"]}</td>
            <td>${value["file"]}</td>
            <td>${value["created"]}</td>
            <td><button value=${value["id"]} type="button" class="btn btn-secondary" id="action-button${value['id']}">Details</button></td>
            </tr>`
        }
    },
    error: function(error){
            console.log(error)
    },
})
}



function GetInfo(){

}




file.addEventListener("change", function(){
    const file_data = file.files[0]
    const url = URL.createObjectURL(file_data)
    console.log(url)
//    msgBox.innerHTML = `<img src="${url}" width="100%">`

})


form.addEventListener("submit", function(e){
    e.preventDefault()
    const fd = new FormData()
    console.log(fd)
    fd.append('csrfmiddlewaretoken', csrf[0]["value"])
    fd.append('title', title["value"])
    fd.append('description', description["value"])
    fd.append('file', file["files"][0])
    console.log(fd)
    $.ajax({
        type: 'POST',
        url: url,
        enctype: 'multipart/form-data',
        data: fd,
        success:  function(response){
            console.log(response)
            modalThead.innerHTML = ""
            modalTcontent.innerHTML = ""
            const thedata = response["converteddata"]["data"]
            const theheader = response["converteddata"]["key"]
//            adding of table data
            for (let key of theheader){
                console.log("This is the header: "+key)
                modalThead.innerHTML += `<th>${key}</th>`
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
                    while (true){
                        _random = String(Math.floor((Math.random() * 9999) + datalast)+String(csrf[0]["value"].shuffle()))
                        if (_randomlist.includes(_random)){
                            _random = String(Math.floor((Math.random() * 9999) + datalast)+String(csrf[0]["value"].shuffle()))
                        }
                        else{
                            break
                        }
                    }
                    for (let i of _dataval){
                        console.log("CONDITIONAL "+(i == data[datafirstkey]))
//                        if (_dataval.indexOf(i) == datafirst && i == datafirstval){
                        if (i == data[datafirstkey]){
                            console.log("This is the left row: "+i)
                            modalTcontent.innerHTML += `<tr id='modal-table-row-${_random}'>`
                        }

                        console.log("This is the content of row: "+i)
                        const modalTrow =  document.querySelector(`#modal-table-row-${_random}`)
                        modalTrow.innerHTML += `<td>${i}</td>`

                        console.log((_dataval.indexOf(i) == datalast),(i == datalastval), _dataval.indexOf(i),datalastval, i)
//                        if (_dataval.indexOf(i) == datalast && i == datalastval){
//                        if (i == data[datalastkey]){
                        if (_dataval.lastIndexOf(i) == datalast){
                            console.log("This is the right row: "+i)
                            modalTcontent.innerHTML += "</tr>"
                        }
                    }
                    _randomlist.push(_random)
            }

//            adding of table data
            setTimeout(()=>{
                title["value"] = ""
                description["value"] = ""
                file["value"] = ""
                msgBox.innerHTML = `<div class="alert alert-${response['message']}" role="alert"><h4 class="alert-heading">${response["status"]["file"][0]}</h4></div>`
            }, 100)

            modalShow.removeEventListener("submit", function(e){
                e.preventDefault()
            }, )

            modalClose.removeEventListener("submit", function(e){
                e.preventDefault()
                msgBox.innerHTML = ""
            }, )

        },
        error: function(error){
            msgBox.innerHTML = `<div class="alert alert-danger" role="alert">${error["data"]}</div>`
            console.log(error["data"])
        },
        cache: false,
        contentType: false,
        processData: false,
    })

})



tablesettings()
TableData()




