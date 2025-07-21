//
//  TrailingIconLabelStyle.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import SwiftUI
import Foundation

//The configuration parameter is a LabelStyleConfiguration,
//which contains the icon and title views.
//These views represent the label’s image and text.

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack
        {
            configuration.title
            configuration.icon
        }
    }
    


}
 
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
