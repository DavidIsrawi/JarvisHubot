// Description:
// A router for Mr. Jarvis


module.exports = function(robot) {

  robot.router.post('/hello', function(req, res) {
    var data = (req.body.payload)? JSON.parse(req.body.payload) : req.body;

    robot.send('general', data.message);
    res.send("OK");
  });
}
