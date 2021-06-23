const alertBox = document.querySelector("#alert-box")
const msgBox = document.querySelector("#msg-box")
const form = document.querySelector("#p-form")
const tableContent = document.querySelector("#table-content")

//form values
const title = document.querySelector("#id_title")
const description = document.querySelector("#id_description")
const file = document.querySelector("#id_file")
//csrf value
const csrf = document.getElementsByName("csrfmiddlewaretoken")

const url = ""

function TableData(refresh=false){
$.ajax({
    type: 'GET',
    url: url,
    success: function(response){
        console.log(refresh)
        for (let value of response["table"]){
            tableContent.innerHTML += `
            <tr>
            <td>${value["title"]}</td>
            <td>${value["description"]}</td>
            <td>${value["file"]}</td>
            <td>${value["created"]}</td>
            <td><button value=${value["id"]} type="button" class="btn btn-secondary" id="action-button">Details</button></td>
            </tr>
            `
        }
    },
    error: function(error){
            console.log(error)
    },
})
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
            console.log(response["status"])

            setTimeout(()=>{
                title["value"] = ""
                description["value"] = ""
                file["value"] = ""
                msgBox.innerHTML = `<div class="alert alert-${response['message']}" role="alert"><h4 class="alert-heading">${response["status"]["file"][0]}</h4></div>`
            }, 1000)

            setTimeout(()=>{
                msgBox.innerHTML = ""
            }, 8000)

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

TableData()




