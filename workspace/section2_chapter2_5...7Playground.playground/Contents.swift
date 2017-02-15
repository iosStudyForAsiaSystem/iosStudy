//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//#1 array definition sample

func arrayDefinitionSample() {
    
    var intArray  = [1,2,3,4,]
    
    intArray = []
    
    if intArray.isEmpty || intArray.count == 0 {
        print("array is empty")
    }
    
    intArray = [Int](repeatElement(0, count: 100))
    
    let xList = [String] (repeatElement("a", count: 100))
    
    print(intArray, xList)
    
    
}

arrayDefinitionSample()

//#2 array definition2 sample

func arrayDefinitionSample2() {
    
    var nestArray = [["a1", "a2", "a3"],
                     ["b1", "b2", "b3"],
                     ["c1", "c2", "c3"]]
    
    let theValue = nestArray[1][2]
    
    nestArray[2][0] = "hello"
    
    print(theValue,  nestArray.first?[0] ?? "", nestArray.last?[0] ?? "",nestArray)

}

arrayDefinitionSample2()


//#3 array remove sample

func arrayRemoveSample() {
    
    var ageArray = [1,454,33,55,2,55,77]
    
    ageArray.append(44)
    
    ageArray.removeFirst()
    
    ageArray.removeLast()
    
    ageArray.insert(45, at: 0)
    
    let filerArray = ageArray.filter { (item) -> Bool in
        return item > 50
    }
        
        ageArray.sort()
    
    filerArray.sorted()
    
    let xList = [String] (repeatElement("a", count: 100))
    
    print(xList)
    
}

arrayRemoveSample()

//#4 dictionary definition sample


func dictionaryDefinitionSample() {
    
    
    let sizeTable = ["S":47, "M":52, "L": 55]
    
    let sizeTable2 = [String:Int]()
    
    let sizeTable3 = Dictionary<String,String>()
    
    if sizeTable.isEmpty || sizeTable2.isEmpty || sizeTable3.count == 0 {
        print("sizeTable empty")
    }
    
     let value =  sizeTable["S"]
    
    print (value ?? "")
    
}

dictionaryDefinitionSample()

//#5 dictionary update sample

func  membersDictionarySample () {
    
    var members = [String:Int]()
    
    func updateMembers(theKey:String , newValue:Int) {
        if let oldValue = members.updateValue(newValue, forKey: theKey)
        {
            print(theKey, oldValue , newValue)
        } else {
            print(theKey, newValue)
        }
        
    }
    
    members = ["tokyo":15,"osaka":12,"saporo":9]
    
    updateMembers(theKey: "osaka", newValue: 100)
    
    updateMembers(theKey: "okinawa", newValue: 14)
    
    print(members["okinawa"] ?? "")
    
    members["okinawa"] = 20
    
    print(members)
}


membersDictionarySample()


//#6 dictionary delete sample

func dictionaryDeleteSample (theKey:String) {
    
    
    var theRace = ["short":20,"half":40,"full":85,"Max":100]
    
    if let result = theRace.removeValue(forKey: theKey) {
        print ("delete", theKey, result )
    } else {
        print (theKey, "not found ")
    }
    
    
    
}

dictionaryDeleteSample(theKey: "short")
dictionaryDeleteSample(theKey: "short")

//#7 set definition sample

func makeSetSample () {
    
    var colorSetA:Set<String> = ["red", "green", "blue"]
    
    let colorSetB:Set<Int> = []
    
    var colorSetC:Set<String> = []
    
    colorSetC.insert("yellow")
    colorSetC.insert("blue")
    
    colorSetA.remove("red")
    
    if colorSetB.isEmpty {
        print ("colorSetB empty")
    }
    
    if colorSetA.contains("red") {
        print ("red founded")
    }
    
    let colorSet11 = colorSetA.union(colorSetC)
    
    print("colorSet11 union table:",colorSet11)
    
    let colorSet12 = colorSetA.intersection(colorSetC)
    
    print("colorSet12 intersection table:",colorSet12)
    
    let colorSet13 = colorSetA.subtracting(colorSetC)
    
    print("colorSet12 subtracting table:",colorSet13)
    
    let colorSet14 = colorSetA.symmetricDifference(colorSetC)
    
    print("colorSet14 symmetricDifference table:",colorSet14)
    
    
    
}

makeSetSample()

//#7 set compare sample

func compareSetSample () {

    let aList:Set<Int> = [5,6,7,8]
    let bList:Set<Int> = [1,6,7,9]
    
    
    let cList = aList.intersection(bList)
    
    if aList.isDisjoint(with: bList) {
        print( "disjoint set")
    } else {
        print( "joint set", cList)
        
    }
    
    if cList.isSubset(of: aList) {
        print("subset ")
    }





}


compareSetSample()

