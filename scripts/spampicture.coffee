# Description:
#   Starts thread whenever a user uploads an image
#   Waits for signal from slack adapter
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
    robot.on 'upload', (msg) ->
        robot.logger.info "PICTURE ARRIVED"
        robot.logger.info msg
        robot.messageRoom msg.channel, "Someone uploaded a picture! Please use this thread for any related comment"
