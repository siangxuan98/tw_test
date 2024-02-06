//
//  CustomTabBarView.swift
//  tw_test
//

import Foundation
import SwiftUI

enum Tab: String, Hashable, CaseIterable {
    case contact, explore, favourites, other
}

struct SampleTabBarView: View {
    @Binding var selection: Tab
    let onTabSelection: (Tab) -> Void

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                tabBarItem(for: tab)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selection = tab
                        onTabSelection(tab)
                    }
            }
        }
    }

    private func tabBarItem(for tab: Tab) -> some View {
        // Placeholder for tab items, replace with your actual tab content
        switch tab {
        case .contact:
            return VStack(spacing: 4) {
                Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selection == tab ? .blue : .gray)
                
                Text(tab.rawValue.capitalized)
                    .font(.footnote)
                    .foregroundColor(selection == tab ? .blue : .gray)
            }
        case .explore:
            return VStack(spacing: 4) {
                Image(systemName: "moon.zzz.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selection == tab ? .blue : .gray)
                
                Text(tab.rawValue.capitalized)
                    .font(.footnote)
                    .foregroundColor(selection == tab ? .blue : .gray)
            }
        case .favourites:
            return VStack(spacing: 4) {
                Image(systemName: "star.slash.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selection == tab ? .blue : .gray)
                
                Text(tab.rawValue.capitalized)
                    .font(.footnote)
                    .foregroundColor(selection == tab ? .blue : .gray)
            }
        case .other:
            return VStack(spacing: 4) {
                Image(systemName: "cloud.moon.rain.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selection == tab ? .blue : .gray)
                
                Text(tab.rawValue.capitalized)
                    .font(.footnote)
                    .foregroundColor(selection == tab ? .blue : .gray)
            }
        }
    }
}

struct SampleTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        SampleTabBarView(selection: .constant(.contact), onTabSelection: { _ in })
    }
}
