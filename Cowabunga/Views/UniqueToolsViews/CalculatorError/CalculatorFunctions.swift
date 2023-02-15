//
//  CalculatorFunctions.swift
//  Cowabunga
//
//  Created by Hariz Shirazi on 2023-02-14.
//

import Foundation
import MacDirtyCowSwift
import SwiftUI

public struct CalculatorFunctions {
    // FIXME: what on god's green earth
    public static func nothing() {
       Haptic.shared.play(.light)
       print("nope")
    }
    
}

struct CalculatorButtonStyle: ButtonStyle {
    
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 32, weight: .medium))
                .frame(width: size, height: size)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .clipShape(Capsule())
    }
}
