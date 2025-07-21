//
//  CardView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import SwiftUI
//Applying the font modifier to the horizontal stack also applies the modifier to the stack’s child views.
struct CardView: View {
    let scrum:DailyScrum
    
    var body: some View {
        VStack(alignment:.leading){
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
                
            }.font(.caption)
        }.padding()
            .foregroundColor(scrum.theme.accentColor)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let scrum =  DailyScrum.sampleData[0]
    CardView(scrum:scrum)
        .background(scrum.theme.mainColor)
}
