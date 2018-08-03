// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
    Terminal.applyAddon(attach);
    const socket = new WebSocket('ws://localhost:3000/cable');
    const term = new Terminal({
        cols: 160,
        cursorBlink: true,
        rows: 20
    });
    //term.attach(socket, true, true);
    socket.addEventListener('message', function (event) {
        console.log('Message from server ', event.data);
    });

    App.cable.subscriptions.create("UserChannel", {
        connected: function() {
            console.log("connected");
        },
        received(data) {
            console.log("WHATS UP ");
            term.writeln(data);
        },
        disconnected: function() {
            console.log("disconnected");
        }, 
        send_message(message, uwot) {
            term.on('key', (key, ev) => {
                term.writeln('\n');
            })
            return this.perform('send_message', {message, uwot});
        },
        message(message) {
            return this.perform('send_message', {message});
        }
    });

    var charcount = 0;
    term.open(document.getElementById('terminal'));
     term.on('key', (key, ev) => {
        if (key.charCodeAt(0) == 127) {
            if (charcount <= 1) {
                term.write('\b');
                term.write(' ');
                term.write('\b');
                charcount = 0;
            } else {
                term.write('\b');
                term.write(' ');
                term.write('\b');
                charcount--;
            }
        } else if (key.charCodeAt(0) == 27) {
            term.write(key);
        } else {
            charcount++;
            term.write(key);
        }
    }); 

/*     $("#usrSubmit").on("click",function(){
        $.ajax({
            url: "getoutput",
            type: "GET",
            datatype: 'json',
            success: function(usrdata) {
                console.log("hey i worked.");
                $("#usrOutput").val(usrdata);
                term.write(usrdata);
                console.log(usrdata);
                    document.getElementById("usrSubmit").disabled = false;
            },
            error: function(usrdata) {
               alert("error");
               console.log(usrdata);
               var data = $.parseJSON(usrdata);
               console.log(data.status);
            }
        })
    }); */
});