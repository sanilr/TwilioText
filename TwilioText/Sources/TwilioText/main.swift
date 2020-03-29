import Foundation
import Alamofire

if let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"],
   let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] {

  let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages"
  let parameters = ["From": "+12562557487", "To": "+14089307273", "Body": "FRAME: You've received a project invitation on Frame from Sanil Rajput. Click link to accept: frame.com/fbhtdjs"]

  Alamofire.request(url, method: .post, parameters: parameters)
    .authenticate(user: accountSID, password: authToken)
    .responseJSON { response in
      debugPrint(response)
  }

  RunLoop.main.run()
}
