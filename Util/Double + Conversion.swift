//
//  Double + Conversion.swift
//  
//
//  Created by snowman on 2017/02/14.
//
//


extension Double {
    
    func celsiusToFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func fahrenheitToCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
}
