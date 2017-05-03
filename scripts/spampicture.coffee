module.exports = (robot) ->
    robot.hear /uploaded (.*) image/i, (msg) ->
        msg.send("Someone uploaded a picture! Use this thread for any related comment")
