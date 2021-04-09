include HTTParty

module Pace
    class GoPace
        baseurl = "https://client-api.gopace.xyz/api/v1"
        urls = Hash["serverauth" => baseurl + "/app/client-public-auth", "getfarecoordinate" => baseurl + "/fare/private-estimate", "getfareaddress" => baseurl + "/fare/private-estimate", "trackorder" => baseurl + "/order/track", "createorder" => baseurl + "/order/private-create"]
        def initialize(private_key)
            @private_key = private_key
            @token
        end
        def init()
            response = HTTParty.get(urls['serverauth'])
            @token = response.body.token
        end
        def getEstimateAddress(delivery_address, pickup_address)
            response = HTTParty.post(urls['getfareaddress'], {
                headers: {
                    Authorization: "Bearer " + @token
                },
                body: {
                    delivery_address: delivery_address
                    pickup_address: pickup_address
                }
            })
            return response.body
        end
        def getEstimateCoordinate(delivery, pickup)
            response = HTTParty.post(urls['getfarecoordinate'], {
                headers: {
                    Authorization: "Bearer " + @token
                },
                body: {
                    pickup_lat: pickup.lat
                    pickup_long: pickup.long
                    destimation_lat: delivery.lat
                    destimation_long: delivery.long
                }
            })
            return response.body
        end
        def trackOrder(code)
            response = HTTParty.post(urls['trackorder'], {
                headers: {
                    Authorization: "Bearer " + @token
                },
                body: {
                    tracking_code: code
                }
            })
            return response.body
        end
        def createOrder(**body)
            response = HTTParty.post(urls['createorder'], {
                headers: {
                    Authorization: "Bearer " + @token
                },
                body: body
            })
            return response.body
        end
    end
end