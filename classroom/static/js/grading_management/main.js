const tableBody = document.getElementById('table-content')

$.ajax({
  type:'GET',
  url: 'table-view',
  success: function(response){
    data = JSON.parse(response.data)
    data.forEach(el=>{
      tableBody.innerHTML += "<tr>"+
      "<td>"+el.fields.first_name+"</td>"+
      "<td>"+el.fields.last_name+"</td>"+
      "<td><a onclick='oncWrittenWork("+el.pk+")'>"+el.fields.written_work_grade+"</a></td>"+
      "<td>"+el.fields.performance_task_grade+"</td>"+
      "<td>"+el.fields.initial_grade+"</td>"+
      "<td>"+el.fields.transm_grade+"</td>"+
      "</tr>"
    });
  }

});



function oncWrittenWork(id){
  $('#DetailsModal').modal({'backdrop': 'static'});
  const modalBody = document.getElementById("modal-content")
  modalBody.innerHTML = "<input id='pk' type='hidden' value='"+id+"'><button type='button' onclick='addWrittenGrade("+id+")'>Add Grade</button><button type='submit' onclick='saveWrittenWorkGrades("+id+")'>save</button>"

}

function addWrittenGrade(res){
  $("#modal-content").append("<p class='ww_p'>1</p><input class='ww_input' name='grade_0' type='text'>")
  var list = $('.ww_p');
  var list2 = $('.ww_input');
  // var val_list = [];
  for ( var i = 1; i < list.length; i++){
    var count = i+1
    list[i].setAttribute("id","ww_"+i);
    list2[i].setAttribute("name","grade_"+i)
    var x = "#ww_"+i;
    $(x).html(i+1);

  };


}

function saveWrittenWorkGrades(id){
  var rVal = {};
  var nList = [];
  $('#form-modal').on('submit', function(e){
    e.preventDefault();
    var queryString = $('#form-modal').serializeArray();
    // var stringfyQ = JSON.stringfy(queryString)
    queryString.forEach(v=>{
      console.log(v);
      nList.push(v['value'])
    });
    console.log(nList)
      $.ajax({
        type: 'POST',
        url: 'save-raw-ww',
        data: { 'ww': nList,
                'id': id },
        success: function(response){
          // $('#DetailsModal').modal('hide');
          alert(response)
          location.reload();
        }
      });
  });
}
