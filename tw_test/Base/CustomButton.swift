//
//  CustomButton.swift
//  tw_test
//

import Foundation
import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    var vPadding: CGFloat? = 10
    
    var body: some View {
        Button(action: action) {
                    HStack {
                        Spacer()
                        Text(title)
                            .font(Font.custom(Constant().poppinsSemiBold, size: 14))
                            .padding()
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
        }
//        .background(Color.red)
        .background(LinearGradient(gradient: Gradient(colors: [Color(R.color.spaceCadet()!), Color(R.color.airForceBlueUSAF()!)]), startPoint: .leading, endPoint: .trailing)) // Use LinearGradient as the background
        .cornerRadius(8)
//        .padding(.horizontal, 20)
        .padding(.vertical, vPadding)
    }
}
