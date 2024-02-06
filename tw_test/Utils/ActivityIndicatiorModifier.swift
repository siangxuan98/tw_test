//
//  ActivityIndicatiorModifier.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import Foundation
import SwiftUI

struct ActivityIndicatorModifier: AnimatableModifier {
    var isLoading: Bool

    init(isLoading: Bool, color: Color = .primary, lineWidth: CGFloat = 3) {
        self.isLoading = isLoading
    }

    var animatableData: Bool {
        get { isLoading }
        set { isLoading = newValue }
    }

    func body(content: Content) -> some View {
        ZStack {
            if isLoading {
                GeometryReader { geometry in
                    ZStack(alignment: .center) {
                        content
                            .disabled(self.isLoading)
                            .blur(radius: self.isLoading ? 3 : 0)
                        VStack {
//                            ActivityIndicator(isAnimating: .constant(true), style: .large)
//                            LottieView(animationFileName: "", loopMode: .loop).frame(width: geometry.size.width / 2, height: geometry.size.width / 2)
                            
                        }
                        .opacity(self.isLoading ? 1 : 0)
                        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
                    }
                }
            } else {
                content
            }
        }
    }
}
