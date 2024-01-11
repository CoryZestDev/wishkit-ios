//
//  File.swift
//  
//
//  Created by Cory Kornowicz on 1/11/24.
//

import SwiftUI

struct TextFieldTint: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    var cursorTintColor: Color {
        if let color = WishKit.theme.cursorTintColor {
            switch colorScheme {
            case .light: return color.light
            case .dark: return color.dark
            @unknown default: return .accentColor
            }
        }
        return .accentColor
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .tint(cursorTintColor)
        } else {
            // Fallback on earlier versions
            content
                .accentColor(cursorTintColor)
        }
    }
}

extension View {
    
    func tintCursor() -> some View {
        modifier(TextFieldTint())
    }
    
}
