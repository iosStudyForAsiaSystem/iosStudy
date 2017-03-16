

extension UITextField {

    
    static func  checkKeyFieldEmpty() ->String {
        
        guard let inputValue = self.text!, !inputValue.isEmpty  else {
            return "tmp"
        }
        return inputValue
        
    }
    
    static func  checkFieldEmpty() -> String {
        if let inputValue = self.text!, !inputValue.isEmpty   {
            return inputValue
        }
        return ""
    }

}
