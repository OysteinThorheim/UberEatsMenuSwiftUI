//
//  OffsetModifier.swift
//  UberEatsSwiftUI
//
//  Created by Øystein Thorheim on 09/01/2022.
//

import Foundation
import SwiftUI

struct OffsetModifier: ViewModifier {
    let option: MenubarOptions
    @Binding var currentOption: MenubarOptions
    
    func body (content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("scroll")))
                }
            )
            .onPreferenceChange(OffsetKey.self) { proxy in
                let offset = proxy.minY
                withAnimation {
                    currentOption = (offset < 20 && -offset < (proxy.midX / 2 ) && currentOption != option) ? option : currentOption
                }
        }
    }
}
