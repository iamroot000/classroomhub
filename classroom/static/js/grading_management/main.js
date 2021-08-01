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
      "<td><a onclick='oncPerformanceTask("+el.pk+")'>"+el.fields.performance_task_grade+"</td>"+
      "<td>"+el.fields.initial_grade+"</td>"+
      "<td>"+el.fields.transm_grade+"</td>"+
      "</tr>"
    });
  }

});


function oncPerformanceTask(id){
  $('#DetailsModal').modal({'backdrop': 'static'});
  const modalBody = document.getElementById("modal-content")
  modalBody.innerHTML = "<input id='pk' type='hidden' value='"+id+"'><button id='addpt1' type='button'>Add Grade</button><button type='submit' onclick='savePerformanceTask("+id+")'>save</button>"
  +"<div class='row' id='sub_s'></div>"
  // <div class='col-sm'>Level 2: .col-8 .col-sm-6</div><div class='col-sm'>Level 2: .col-8 .col-sm-6</div><div class='col-sm'>Level 2: .col-8 .col-sm-6</div>
  var nDict = {};
  $.ajax({
    type: 'GET',
    url: 'modal-ww',
    success: function (response){
      data = JSON.parse(response.data)
      $.each(data, function(key, value){
        nDict[value['pk']] = value['fields']
        var ww_r_c = value['fields']['raw_performance_task']
        var nww_r_c = ww_r_c.slice(1,-1)
        var new_list = nww_r_c.split(',')
        for (var i in new_list){
          var pt_s = new_list[i].trim().slice(1,-1)
          // console.log(pt_s)
          var append_ww = $("#sub_s").append("<div class='col-sm' id='div_"+pt_s+"'>"+pt_s+"</div>")
        }
        $("#addpt1").attr("onclick","addPerformanceTask("+ new_list +")")
      });
    }
  });
}

function addPerformanceTask(...tlist){
  var newst = '';
  for (var i in tlist){
    var a_pt = tlist[i].trim()
    var new_apt = "#div_"+a_pt;
    console.log(new_apt)
    // $(new_apt).append("<div class='col-sm'><p class='ww_p'>Enter Grade:</p><input class='pt_input' name='grade' type='text'></div>")
    // $("#modal-content").append("<div class='row'><p class='ww_p'>"+new_apt+"</p></div>")
    newst += "<p class='ww_p'>Enter Grade:</p><input class='pt_"+new_apt+"' name='pt_"+new_apt+"' type='text'>"
  }
  console.log(newst)
  $("#modal-content").append("<div class='row'>"+newst+"</div>")
}

function oncWrittenWork(id){
  $('#DetailsModal').modal({'backdrop': 'static'});
  const modalBody = document.getElementById("modal-content")
  modalBody.innerHTML = "<input id='pk' type='hidden' value='"+id+"'><button type='button' onclick='addWrittenGrade()'>Add Grade</button><button type='submit' onclick='saveWrittenWorkGrades("+id+")'>save</button>"
  var nDict = {};
  $.ajax({
    type: 'GET',
    url: 'modal-ww',
    success: function (response){
      data = JSON.parse(response.data)
      // console.log(data)
      $.each(data, function(key, value){
        nDict[value['pk']] = value['fields']
        ww_r_c = value['fields']['raw_written_work']
        // var nww_r_c = string(ww_r_c)
        // console.log(ww_r_c.trim('[]'))
        var nww_r_c = ww_r_c.slice(1,-1)
        list_ww = nww_r_c.split(',')
        // console.log(list_ww)
        for (var i in list_ww){
          var ww = list_ww[i].trim().slice(1,-1)
          var append_ww = $("#modal-content").append("<p class='ww_p'>Enter Grade:</p><input class='ww_input' name='grade' type='text' value='"+ww+"'>")
        }
      });
      // console.log(nDict)
    }
  });
}

function addWrittenGrade(){
  $("#modal-content").append("<p class='ww_p'>Enter Grade:</p><input class='ww_input' name='grade' type='text'>")
  // var list = $('.ww_p');
  // var list2 = $('.ww_input');
  // var val_list = [];
  // for ( var i = 1; i < list.length; i++){
  //   var count = i+1
    // list[i].setAttribute("id","ww_"+i);
    // list2[i].setAttribute("name","grade_"+i)
    // var x = "#ww_"+i;
    // $(x).html(i+1);

  // };
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

function savePerformanceTask(id){
  var rVal = {};
  var nList = [];
  $('#form-modal').on('submit', function(e){
    e.preventDefault();
    var queryString = $('#form-modal').serializeArray();
    // var stringfyQ = JSON.stringfy(queryString)
    queryString.forEach(v=>{
      // console.log(v);
      var vname = v['name']
      var vvalue = v['value']
      nList.push("["+vname+":"+vvalue+"]")
      // rVal[vname] = vvalue;
    });
    // console.log(rVal)
    // var nrVal = list(rVal);
    console.log(nList)
      $.ajax({
        type: 'POST',
        url: 'save-raw-pt',
        // dataType: 'json',
        data: { 'pt': nList,
                'id': id },
        success: function(response){
          // $('#DetailsModal').modal('hide');
          alert(response)
          location.reload();
        }
      });
  });
}