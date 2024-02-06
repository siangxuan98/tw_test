//
//  ExploreView.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import SwiftUI

struct ExploreView: View {
    
    var body: some View {
        
        VStack {
                        
            List {
                ForEach((0..<20).map { $0 }, id: \.self) { item in
                    NavigationLink(destination: Text("Destination \(item)")) {
                        Text("Go to \(item)")
                    }
//                    NavigationLink(destination: SettingView()) {
//                        Text("Go to Setting \(item)")
//                    }
                }
            }
            
        }
    }
    
}

#Preview {
    ExploreView()
}
