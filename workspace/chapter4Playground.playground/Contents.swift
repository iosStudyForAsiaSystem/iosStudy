//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//#1 string method1

func stringMethodSample() {
    let stars = String(repeating: "⭐️", count: 10)

    let swift1 = "Swift \n amazon\n"

    print("swift \(swift1) stars :\(stars)"  )

    let week = ["monday", "tuesday", "wendesday"]
    var oneweek = "";
    for day in week {
        oneweek += day + ","
    }

    print( oneweek)
}

stringMethodSample()

//#2 string to primitive sample 

func stringToPrimitive () {
    
    let r = "20"
    let pai = "3.14"
    
    let menseki = Double(r)! * Double(r)! * Double(pai)!
    
    print(" radius \(r) squre \(menseki)")
    
    print(String(menseki), menseki.description)
    
    
}
stringToPrimitive()

//#2 string to substract sample

func stringToSubstract () {


     let str = "swift beginer"

    let startIndex = str.startIndex
    let endIndex = str.endIndex
    
    let startChar = str[startIndex]
    let char2 = str[str.index(after: startIndex)]
    let beforeEndIndex = str.index(before: endIndex);
    
    let beforeIndex2  = str.index(before:beforeEndIndex)
    let  char3 = str[beforeIndex2]
    let  endChar = str[beforeEndIndex]
    
    print (startChar, char2, char3, endChar)
    
    let index11 = str.index(startIndex, offsetBy: 5)
    let  char11 = str[index11]
    
    let index12 = str.index(endIndex, offsetBy: -5)
    let  char12 = str[index12]
    
    print (char11, char12)
    
    let string22 = str[index11...beforeIndex2]
    let string23 = str[index11..<beforeIndex2]
    
    print (string22, string23)
    
    let string31 = str.substring(to: index11)
    let string32 = str.substring(from:index11)
    
    print (string31, string32)
    
}

stringToSubstract()

//#3 string compare sample 

func compareStringSampel()
{
    
    let testArr = ["composit","complex" , "Zoo", "multiflex"]
    
    for  item  in testArr {
        
        if item.hasPrefix("co") {
            print("item has prefix co: \(item)")
        } else if item.hasSuffix("ex") {
            print("item  hasSuffix ex: \( item )")
        }
        
        let resultIndex = str.range(of: "pos")
        
        if(( resultIndex  ) != nil) {
            var string1 = ""
            
            string1 =  str.substring(from: (resultIndex?.upperBound)!)
            
            var string2 =  ""
            
            string2 = str.substring(to: (resultIndex?.lowerBound)!)
            
            
            print (string1, string2)
        }
    }
    

}

compareStringSampel()




