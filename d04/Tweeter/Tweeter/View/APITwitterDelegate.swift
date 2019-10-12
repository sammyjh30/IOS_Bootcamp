//
//  APITwitterDelegate.swift
//  Tweeter
//
//  Created by Samantha HILLEBRAND on 2019/10/12.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: AnyObject {
    init()

    //https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
    func listener(tweet: [Tweet])
    func NSExceptionErr(err: NSError)
}

extension APITwitterDelegate {
    init() {
        self.init()
    }
}
