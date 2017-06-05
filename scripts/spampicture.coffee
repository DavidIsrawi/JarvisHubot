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
#   Upload a file
#
# Author:
#   David Israwi


module.exports = (robot) ->
    robot.on 'upload', (msg) ->
        # robot.logger.info msg

        name = 'A brother'
        try
            name = msg.user_profile.first_name
        catch(error)
            print 'Error, user undefined'
            
        robot.messageRoom msg.channel, (name + ' has uploaded a file! Please use this thread for any related comment')
