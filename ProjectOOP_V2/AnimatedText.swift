//
//  AnimatedText.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 5/12/2565 BE.
//

import SwiftUI

struct AnimatedNumberText: Animatable,View {
    var value: CGFloat
    // Optional Properties
    var font: Font
    var floatingPoint: Int = 2
    var isCurrency: Bool = false
    var additionalString: String = ""
    
    var animatableData: CGFloat{
        get{value}
        set{value = newValue}
    }
    var body: some View {
        Text("\(isCurrency ? "$" : "")\(String(format: "%.\(floatingPoint)f", value))" + additionalString)
            .font(font)
    }
}
