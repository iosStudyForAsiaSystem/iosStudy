//
//  NSPredicate+Util.swift
//  
//
//  Created by snowman on 2017/02/24.
//
//


public extension NSPredicate {
    
    // examples
    //    // Tomである
    //    let predicate = NSPredicate("name", equal: "Tom")
    //
    //    // Tomじゃなぁ〜い
    //    let predicate = NSPredicate("name", notEqual: "Tom")
    //    // Tomって文字がどこかにあるかなぁー?
    //    let predicate = NSPredicate("name", contains: "Tom")
    //
    public convenience init(_ property: String, equal value: AnyObject) {
        self.init(expression: property, "=", value)
    }
    
    public convenience init(_ property: String, notEqual value: AnyObject) {
        self.init(expression: property, "!=", value)
    }
    
    public convenience init(_ property: String, equalOrGreaterThan value: AnyObject) {
        self.init(expression: property, ">=", value)
    }
    
    public convenience init(_ property: String, equalOrLessThan value: AnyObject) {
        self.init(expression: property, "<=", value)
    }
    
    public convenience init(_ property: String, greaterThan value: AnyObject) {
        self.init(expression: property, ">", value)
    }
    
    public convenience init(_ property: String, lessThan value: AnyObject) {
        self.init(expression: property, "<", value)
    }

    // examples
    //    // Tom's Shopって文字がどこかにあるかなぁー?
    //    let predicate = NSPredicate("name", contains: "Tom's Shop".realmEscaped)
    
    // 前後方一致検索(いわゆる、あいまい検索)
    public convenience init(_ property: String, contains q: String) {
        self.init(format: "\(property) CONTAINS '\(q)'")
    }
    
    // 前方一致検索
    public convenience init(_ property: String, beginsWith q: String) {
        self.init(format: "\(property) BEGINSWITH '\(q)'")
    }
    
    // 後方一致検索
    public convenience init(_ property: String, endsWith q: String) {
        self.init(format: "\(property) ENDSWITH '\(q)'")
    }
    
    

    
    // examples
    //    let cities = ["Tokyo", "Osaka", "Nagoya"]
    //    let predicate = NSPredicate("city", valuesIn: cities)
    public convenience init(_ property: String, valuesIn values: [AnyObject]) {
        self.init(format: "\(property) IN %@", argumentArray: [values])
    }

    // examples
    //    // 年齢が18歳から40歳まで
    //    let predicate = NSPredicate("age", between: 18, to: 40)
    public convenience init(_ property: String, between min: AnyObject, to max: AnyObject) {
        self.init(format: "\(property) BETWEEN {%@, %@}", argumentArray: [min, max])
    }
    
    // examples
    //    // 期限日が指定した日付までのデータを検索
    //    let date: NSDate = /* NSDateを作る処理(割愛) */
    //    let predicate = NSPredicate("expiredDate", fromDate: nil, toDate: date)
    //    
    //    // 購入日が指定した日付からのデータを検索
    //    let date: NSDate = /* NSDateを作る処理(割愛) */
    //    let predicate = NSPredicate("purchasedDate", fromDate: date, toDate: nil)
    //    
    //    // 予約日が指定した日付1から日付2までのデータを検索
    //    let date1: NSDate = /* NSDateを作る処理(割愛) */
    //    let date2: NSDate = /* NSDateを作る処理(割愛) */
    //    let predicate = NSPredicate("reservedDate", fromDate: date1, toDate: date2)
    
    
    public convenience init(_ property: String, fromDate: NSDate?, toDate: NSDate?) {
        var format = "", args = [AnyObject]()
        if let from = fromDate {
            format += "\(property) >= %@"
            args.append(from)
        }
        if let to = toDate {
            if !format.isEmpty {
                format += " AND "
            }
            format += "\(property) <= %@"
            args.append(to)
        }
        if !args.isEmpty {
            self.init(format: format, argumentArray: args)
        } else {
            self.init(value: true)
        }
    }
    
    // examples
    //    // ID=32のオブジェクト
    //    let predicate = NSPredicate(id: 32)
    //
    //    let predicate = NSPredicate(ids: [12, 23, 27, 39])
    
    public convenience init(ids: [Int64]) {
        let arr = ids.map { NSNumber(longLong: $0) }
        self.init(format: "\(NBRealmEntity.IDKey) IN %@", argumentArray: [arr])
    }
    
    public convenience init(id: Int64) {
        self.init(format: "\(NBRealmEntity.IDKey) = %@", argumentArray: [NSNumber(longLong: id)])
    }
    
    

    // examples
    //    let predicates = NSPredicate.empty
    //        .and(NSPredicate("gender",     equal:    "man"))
    //        .and(NSPredicate("age",        equal:    20))
    //        .and(NSPredicate("birthPlace", notEqual: "tokyo"))
    public func compound(predicates: [NSPredicate], type: NSCompoundPredicateType = .AndPredicateType) -> NSPredicate {
        var p = predicates; p.insert(self, atIndex: 0)
        switch type {
        case .AndPredicateType: return NSCompoundPredicate(andPredicateWithSubpredicates: p)
        case .OrPredicateType:  return NSCompoundPredicate(orPredicateWithSubpredicates:  p)
        case .NotPredicateType: return NSCompoundPredicate(notPredicateWithSubpredicate:  self.compound(p))
        }
    }

    
    public func and(predicate: NSPredicate) -> NSPredicate {
        return self.compound([predicate], type: .AndPredicateType)
    }
    
    public func or(predicate: NSPredicate) -> NSPredicate {
        return self.compound([predicate], type: .OrPredicateType)
    }
    
    public func not(predicate: NSPredicate) -> NSPredicate {
        return self.compound([predicate], type: .NotPredicateType)
    }
    
    public static var empty: NSPredicate {
        return NSPredicate(value: true)
    }
    

    
    
    
}
