//
//  Tweet.swift
//  Tweeter
//
//  Created by Samantha HILLEBRAND on 2019/10/12.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import Foundation
struct Tweet: CustomStringConvertible {
    //https://developer.apple.com/documentation/swift/customstringconvertible
    let name : String
    let text : String
    
    var description: String {
        return "\(name); \(text)"
    }
}
