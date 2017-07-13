# Description
#   UCF Area - Publix Sub of the Week
#
# Commands:
#   jarvis pubsub - Responds with sales from nearby publix stores
#
# Author:
#   David Israwi (@davidisrawi)

module.exports = (robot) ->
    request = require('request')
    cheerio = require('cheerio')

    robot.respond /pubsub/i, (msg) ->
        r = request 'http://weeklyad.publix.com/Publix/BrowseByListing/ByCategory/?StoreID=2500468&CategoryID=5117860', (error, response, body) ->
            $ = cheerio.load(body)
            sales = []
            $('.gridtile').each (i,obj) ->
                html = $(obj).html()
                title = $(obj).find('span.title').text()
                if title.toLowerCase().includes('sub')
                    title = title.replace '&#39;', "'"
                    sale = {
                        title : title.replace '&#174;', ''
                        price : $(obj).find('.deal').text()
                        priceDif : $(obj).find('.priceQualifier').text()
                        expiration : $(obj).find('.IDP_validDates').text().match(/\d+\/\d+\s\–\s\d+\/\d+/g)
                    }
                    sales.push sale
            if sales.length == 0
                msg.send('No sales were found on the first page :(\nCheck http://weeklyad.publix.com/Publix/BrowseByListing/ByCategory/?StoreID=2500468&CategoryID=5117860 for more info')
            else
                for sale in sales
                    msg.send('-------\n' + sale.title + '\nPrice: ' + sale.price + ' (' + sale.priceDif + ')' + '\nSale will go on for the period ' + sale.expiration)
