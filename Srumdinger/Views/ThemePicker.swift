//
//  ThemePicker.swift
//  Srumdinger
//
//  Created by Abcom on 22/07/25.
//

import SwiftUI
import ThemeKit
struct ThemePicker: View {
    @Binding var selection:Theme
//    You can tag subviews when you need to differentiate among them in controls like pickers and lists. Tag values can be any hashable type like in an enumeration.
    
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases){
                theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }//picker end
//        When a user interacts with a navigation style picker, the system pushes the picker view onto the navigation stack. The picker view displays each theme in a ThemeView that highlights the theme’s color.
        .pickerStyle(.navigationLink)
    }
}

#Preview {
        @Previewable @State var theme = Theme.periwinkle
        ThemePicker(selection:$theme)
}
