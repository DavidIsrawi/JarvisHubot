# Description:
#   Starts thread whenever a user uploads an image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   x uploaded this image: ...
#
# Author:
#   David Israwi


module.exports = (robot) ->
    robot.hear /(.*)/i, (msg) ->
        msg.send msg.match[1]
        #msg.send "Someone uploaded a picture! Use this thread for any related comment"
