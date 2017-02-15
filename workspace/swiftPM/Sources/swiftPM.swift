
//import Alamofire

struct swiftPM {

    private let host = "https://example.com"
    
//    Alamofire.request("http://jsonplaceholder.typicode.com/users").responseJSON { (response) in
//    
//        switch response.result {
//        case .success(let value) :
//        
//        print(response.request)  // original URL request
//        print(response.response) // HTTP URL response
//        print(response.data)     // server data
//        print(response.result)   // result of response serialization
//        
//        if let JSON = response.result.value as! [String:AnyObject]!{
//        print("JSON: ",JSON)
//        }
//        case .failure(let error):
//        print("request failed with error\(error)")
//        }
//    }
    
    
    let viewController = UIViewController()
    viewController.modalPresentationStyle = .overCurrentContext
    viewController.view.backgroundColor = UIColor.clear
    present(viewController, animated: true, completion: nil)
    viewを閉じるとき
    
    Copy to clipboard
    1
    2
    3
    4
    5
    dismiss(animated: true, completion: {
    [presentingViewController] () -> Void in
    // 閉じた時に行いたい処理
    presentingViewController?.viewWillAppear(true)
    })
}


