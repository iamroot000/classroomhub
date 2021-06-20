String.prototype.format = function () {
        var args = [].slice.call(arguments);
        return this.replace(/(\{\d+\})/g, function (a){
            return args[+(a.substr(1,a.length-2))||0];
        });
};

STREAM_LOG_END_FLAG = 'COMMAND END'
LOGFILE = ''

$(document).ready(function(){
    const urlParams = new URLSearchParams(window.location.search);
    LOGFILE = urlParams.get('log');
    document.getElementById('current_path').innerHTML = LOGFILE
    getLog(LOGFILE,0)

});

function getLog(logfile,offset){
    var execute_content = document.getElementById('execute_content')
    var command_modal = document.getElementById("COMMAND_MODAL");

    $.ajax({
        type: "GET",
        url: '/esync/initiald/?q=getLogs&log={0}&o={1}'.format(logfile,offset),
        cache: false,
        success: function (data) {
            var cont = ''
            var poll = true
            for (var k in data['log'][1]){
                cont = cont +  data['log'][1][k]
                if (data['log'][1][k] === STREAM_LOG_END_FLAG){
                    console.log(data['log'][1][k])
                    poll=false
                }
            }
            execute_content.innerHTML = execute_content.innerHTML +  cont
            execute_content.scrollTop =execute_content.scrollHeight

            console.log('tute',poll)
            if (poll === true){
                pollLog(logfile,data['log'][0]+offset)
            }
        },
        error: function(err) {
            console.log(err);
        },
        complete: function(){


        }
    });
}

function pollLog(logfile,offset){
    getLog(logfile,offset)
}
