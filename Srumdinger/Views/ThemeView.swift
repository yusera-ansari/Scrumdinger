//
//  ThemeView.swift
//  Srumdinger
//
//  Created by Abcom on 22/07/25.
//

import SwiftUI
import ThemeKit
struct ThemeView: View {
    var theme : Theme
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth:.infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
