const tableBody = document.getElementById('table-content')

$.ajax({
  type:'GET',
  url: 'table-view',
  success: function(response){
    data = JSON.parse(response.data)
    data.forEach(el=>{
      console.log(el.fields)
      tableBody.innerHTML += "<tr>"+
      "<td>"+el.fields.lastname+"</td>"+
      "<td>"+el.fields.firstname+"</td>"+
      "<td>"+el.fields.lrn_id+"</td>"+
      "<td>"+el.fields.esc_id+"</td>"+
      "<td>"+el.fields.qvr_id+"</td>"+
      "<td>"+el.fields.status_registrar+"</td>"+
      "<td>"+el.fields.status_guidance+"</td>"+
      "<td>"+el.fields.status_finance+"</td>"+
      "<td><div class='btn-group'><button type='button' class='btn btn-block btn-default btn-sm' data-toggle='modal' data-target='#DetailsModal' onclick='toModal(this.value)' value='"+el.pk+"'>View</button>"+
      "<button id='approved_id' class='btn btn-block btn-success btn-sm'  value='"+el.pk+"' onclick='toApprove(this.value)'>Approve</button>"+
      "<button id='declined_id' class='btn btn-block btn-error btn-sm'  value='"+el.pk+"' onclick='toDecline(this.value)'>Decline</button></div></td>"+
      "</tr>"

    });
  }

});

function celery_test(){
  $.ajax({
    type:'POST',
    url: 'celery',
    success: function(response){
      alert(response)
    }
  });
}

function toApprove(id){
  $.ajax({
    type:'POST',
    url: 'approved',
    data: {'id':id},
    success: function(response){
      alert(response)
      location.reload();
    }
  });
}

function toDecline(id){
  $.ajax({
    type:'POST',
    url: 'declined',
    data: {'id':id},
    success: function(response){
      alert(response)
      location.reload();
    }
  });
}

function toModal(id){
  const modalBody = document.getElementById("modal-content")
  var nDict = {};
  $.ajax({
    type:'GET',
    url: 'modal-view',
    success:function(response){
      data = JSON.parse(response.data)
      $.each(data, function(key, value){
        nDict[value['pk']]= value['fields']
      });
      console.log(nDict[id]);
      console.log(nDict[id]['firstname']);
      modalBody.innerHTML = "<p>Firstname:</p><input type='text' id='md_firstname'><p>Lastname:</p><input type='text' id='md_lastname'><p>LRN:</p><input type='text' id='md_lrn'><p>QVR ID:</p><input type='text' id='md_qvr'><p>ESC ID:</p><input type='text' id='md_esc'>";
      document.getElementById('md_firstname').value = nDict[id]['firstname'];
      document.getElementById('md_lastname').value = nDict[id]['lastname'];
      document.getElementById('md_lrn').value = nDict[id]['lrn_id'];
      document.getElementById('md_qvr').value = nDict[id]['qvr_id'];
      document.getElementById('md_esc').value = nDict[id]['esc_id'];

    },
    error: function(error){
    }
  });
}

