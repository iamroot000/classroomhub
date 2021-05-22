console.log('testing lang');

// $.ajax({
//   type:'GET',
//   url: 'manager_enrollment',
//   success: function(response){
//     data = JSON.parse(response.data)
//     data.forEach(el =>{
//       console.log(el.fields)
//     });
//   }

// });

function toModal(id){
  const modalBody = document.getElementById("modal-content")
  var nDict = {};
  $.ajax({
    type:'GET',
    url: 'json-test/',
    success:function(response){
      data = JSON.parse(response.data)
      console.log(data)
      $.each(data, function(key, value){
        console.log(value['pk'], value['fields']);
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
      // $('#md_esc').val(nDict[id]['esc_id']);
      // $('#a').attr("id","");
    },
    error: function(error){
    }
  });
}

