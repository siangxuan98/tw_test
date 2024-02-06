//
//  HomeViewModel.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import SwiftUI
import Foundation
import Combine

class HomeViewModel: BaseViewModel {
    
    static let shared = HomeViewModel()
    
    @Published var data: [ContactModel] = []

    override init() {
        super.init()
        loadData()
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let configFileURL = URL(fileURLWithPath: path)
                let jsonData = try Data(contentsOf: configFileURL)
                let decoder = JSONDecoder()
                self.data = try decoder.decode([ContactModel].self, from: jsonData)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
}

struct ContactModel: Codable {
    var id: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var dob: String?
}
