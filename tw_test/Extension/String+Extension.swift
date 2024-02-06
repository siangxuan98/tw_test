//
//  String+Extension.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import Foundation
import Localize_Swift
import RxSwift

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    
}
