// Description:
// Repeats what I say

// Command:
// Jarvis say

module.exports = function(robot) {
  robot.respond(/say (.*)/i, function (msg){

    var sentence = msg.match[1];
    msg.reply(sentence);

  });
}
