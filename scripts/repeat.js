// Description:
// Repeats what I say

// Command:
// Jarvis say

module.exports = function(robot) {

    robot.respond(/in (.*) say (.*)/i, function(msg) {

        var channel = msg.match[1];
        var sentence = msg.match[2];

        for(x in msg.envelope.user) {
            console.log(x + " : " + msg.envelope.user[x]);
        }

        var channels= {
            "general" : "C237RSC00",
            "test" : "D25H5A4F3"
        }

        robot.messageRoom(channels[channel], sentence);
    });

    robot.respond(/say (.*)/i, function (msg){

        var sentence = msg.match[1];

        msg.send(sentence);

    });
}
