import UIKit
import Alamofire

private func getBookList(){
    let url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    Alamofire.request(url, method: .get)
        .responseJSON { (response) in
            switch response.result {
            case .success:
                guard let result = response.result.value as? [String: Any],
                      let result = result["time"] as? [String:String] else {
                    return
                }
                print(result)
            case .failure(let error):
                print (error)
            }
        }
}
getBookList()

