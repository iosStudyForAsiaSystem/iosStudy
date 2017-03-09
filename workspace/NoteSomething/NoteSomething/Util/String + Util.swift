//
//  String + Util.swift
//  
//
//  Created by snowman on 2017/02/14.
//
//


import Foundation

extension String {
    //絵文字など(2文字分)も含めた文字数を返します
    var count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    //正規表現の検索をします
    func pregMatche(pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.count > 0
    }
    
    //正規表現の検索結果を利用できます
    func pregMatche(pattern: String, options: NSRegularExpression.Options = [], matches: inout [String]) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let targetStringRange = NSRange(location: 0, length: self.count)
        let results = regex.matches(in: self, options: [], range: targetStringRange)
        for i in 0 ..< results.count {
            for j in 0 ..< results[i].numberOfRanges {
                let range = results[i].rangeAt(j)
                matches.append((self as NSString).substring(with: range))
            }
        }
        return results.count > 0
    }
    
    //正規表現の置換をします
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: with)
    }
    
    // カンマ区切り数字のカンマどり
    var convertToNoComma: Int {
        if self.characters.count == 0 {
            return 0
        }
        let decimalFormatter = DecimalFormatter()
        guard let i = decimalFormatter.number(from: self) else {
            preconditionFailure("NumberFormatter.number method failure!")
        }
        return Int(i)
    }
    
    /// カンマ区切り数字のカンマどり
    var delCommmaFromDecStr: String {
        if self.characters.count > 0 {
            return self.replacingOccurrences(of: ",", with: "")
        } else {
            return "0"
        }
    }
    
    /// Realm用にエスケープした文字列
    var realmEscaped: String {
        let reps = [
            "\\" : "\\\\",
            "'"  : "\\'",
            ]
        var ret = self
        for rep in reps {
            ret = self.stringByReplacingOccurrencesOfString(rep.0, withString: rep.1)
        }
        return ret
    }
}
