$(document).ready(function(){
	var domain = "meet.jit.si";
	var options = {
		roomName: "Payaman",
		width: 800,
		height: 800,
		parentNode: document.querySelector('#meet')
	}
	var api = new JitsiMeetExternalAPI(domain, options);
});