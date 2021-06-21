const tableBody = document.getElementById('table-content')

$.ajax({
  type:'GET',
  url: 'table-view',
  // data: {'subject': $('#teacher_subjects').val(),'section': $('#class_section').val()},
  success: function(response){
    data = JSON.parse(response.data)
    data.forEach(el=>{
      // console.log(el.fields)
      tableBody.innerHTML += "<tr>"+
      "<td>"+el.fields.first_name+"</td>"+
      "<td>"+el.fields.last_name+"</td>"+
      "<td><a onclick='oncWrittenWork("+el.pk+")' data-toggle='modal' data-target='#DetailsModal'>"+el.fields.written_work_grade+"</a></td>"+
      "<td>"+el.fields.performance_task_grade+"</td>"+
      "<td>"+el.fields.initial_grade+"</td>"+
      "<td>"+el.fields.transm_grade+"</td>"+
      "</tr>"
      // console.log(el.pk)
    });
  }

});



function oncWrittenWork(id){
  const modalBody = document.getElementById("modal-content")
  // let ww_counter = 0
  // console.log(id)
  const res = [id]
  // console.log(res)
  modalBody.innerHTML = "<button onclick='addWrittenGrade("+res+")'>Add Grade</button><button onclick=saveWrittenWorkGrades("+id+")>save</button>"

}

function addWrittenGrade(res){
  // console.log(res)
  // const nmodalBody = document.getElementById("modal-content")
  // var i = 0;
  $("#modal-content").append("<p class='ww_input'>input grade:</p><input type='text'>")
  var list = $('.ww_input');

  for ( var i = 0; i < list.length; i++){
    list[i].setAttribute("class","ww_1"+i);
  };
  // ww_counter =+ 1
   // nmodalBody.innerHTML = "<button></save>"
  // console.log(ww_counter)
  // console.log(res[1])
}

function saveWrittenWorkGrades(id){

}