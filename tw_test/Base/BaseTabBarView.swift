//
//  BaseTabBarView.swift
//  tw_test
//

import SwiftUI
import CustomTabView

let screen = UIScreen.main.bounds

@available(iOS 13.0, macOS 11.0, *)

struct BaseTabBarView: View {
    
    @State private var selectedTab: Tab = .contact
    
    private var tabBarView: some View {
        SampleTabBarView(selection: $selectedTab, onTabSelection: { tab in
            // TODO: handle navigation bar tapped here
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        })
        #if os(iOS)
        .padding(.bottom, 8).padding(.top, 8)
        #endif
    }
    
    var body: some View {
        
        NavigationStack {
            
            CustomTabView(tabBarView: tabBarView, tabs: Tab.allCases, selection: selectedTab) {
                #if os(iOS)
                NavigationView {
                    HomeView().navigationBarTitle("Contact")
                }
                #else
                    Text("Contact")
                #endif
                
                #if os(iOS)
                NavigationView {
                    ExploreView().navigationBarTitle("Explore")
                }
                #else
                    Text("Explore")
                #endif
                
                #if os(iOS)
                NavigationView {
                    FavouriteView().navigationBarTitle("Favourites")
                }
                #else
                    Text("Favourites")
                #endif
                
                #if os(iOS)
                NavigationView {
                    OtherView().navigationBarTitle("Other")
                }
                #else
                    Text("Other")
                #endif
            }
            
        }.navigationBarHidden(true)
    }
}

#Preview {
    BaseTabBarView()
}
