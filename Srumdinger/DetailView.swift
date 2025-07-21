//
//  DetailView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import SwiftUI
//To use the same color as other interactive elements, use accentColor.
struct DetailView: View {
    let scrum : DailyScrum
    var body: some View {
        List {
            Section(header: Text("Meeting Info")){
                NavigationLink(destination:MeetingView()){
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }.accessibilityElement(children: .combine)
//                VoiceOver then reads the two elements as one statement, for example, “Length, 10 minutes.” Without the modifier, VoiceOver users have to swipe again between each element.
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }.accessibilityElement(children: .combine)
            }//section end
            Section(header:Text("Attendees")){
                ForEach(scrum.attendees){
                    attendee in
                    Label("\(attendee.name)", systemImage: "person")
                }
            }//section end
            
        }
        .navigationTitle(scrum.title)
    }
}

#Preview {
    NavigationStack{
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
