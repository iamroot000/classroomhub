const tableBody = document.getElementById('table-content')

$.ajax({
  type:'GET',
  url: 'table-view',
  success: function(response){
    data = JSON.parse(response.data)
    data.forEach(el=>{
      console.log(el.fields)
      // tableBody.innerHTML += "<tr>"+
      // "<td>"+el.fields.lastname+"</td>"+
      // "<td>"+el.fields.firstname+"</td>"+
      // "<td>"+el.fields.lrn_id+"</td>"+
      // "<td>"+el.fields.esc_id+"</td>"+
      // "<td>"+el.fields.qvr_id+"</td>"+
      // "<td>"+el.fields.status_registrar+"</td>"+
      // "<td>"+el.fields.status_guidance+"</td>"+
      // "<td>"+el.fields.status_finance+"</td>"+
      // "<td><div class='btn-group'><button type='button' class='btn btn-block btn-default btn-sm' data-toggle='modal' data-target='#DetailsModal' onclick='toModal(this.value)' value='"+el.pk+"'>View</button>"+
      // "<button id='approved_id' class='btn btn-block btn-success btn-sm'  value='"+el.pk+"' onclick='toApprove(this.value)'>Approve</button>"+
      // "<button id='declined_id' class='btn btn-block btn-error btn-sm'  value='"+el.pk+"' onclick='toDecline(this.value)'>Decline</button></div></td>"+
      // "</tr>"

    });
  }

});