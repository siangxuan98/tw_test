//
//  Encodable+Extension.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import Foundation

extension Encodable {
    
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
    
}
