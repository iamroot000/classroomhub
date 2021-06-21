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
  const res = [id]
  modalBody.innerHTML = "<button onclick='addWrittenGrade("+res+")'>Add Grade</button><button onclick=saveWrittenWorkGrades("+id+")>save</button>"

}

function addWrittenGrade(res){
  $("#modal-content").append("<p class='ww_p'>1</p><input class='ww_input' type='text'>")
  var list = $('.ww_input');
  var val_list = [];
  for ( var i = 1; i < list.length; i++){
    list[i].setAttribute("id","ww_"+i);
    var x = "#ww_"+i;
    $(x).html(i+1);
    // console.log($(x).val)
    // val_list.push('');
  };

  // var vals = $('.ww_input').map(function(){
  //   return $(this).attr('value');
  // }).toArray();
  // var vals = $('.ww_input'), 
  // saveWrittenWorkGrades(vals)
  console.log(val_list)

}

function saveWrittenWorkGrades(id){


  console.log(vals)
}