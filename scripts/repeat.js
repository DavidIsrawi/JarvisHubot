// Description:
// Repeats what I say

// Command:
// Jarvis say

module.exports = function(robot) {

    robot.respond(/in (.*) say (.*)/i, function(msg) {

        var channel = msg.match[1];
        var sentence = msg.match[2];

        var channels = robot.api.channels.list();

        robot.send(channels.find(channel).id, sentence);
    });

    robot.respond(/say (.*)/i, function (msg){

        var sentence = msg.match[1];

        // for(x in msg.envelope) {
        //     console.log(x + " : " + msg.envelope[x]);
        // }

        msg.send(sentence);

    });
}