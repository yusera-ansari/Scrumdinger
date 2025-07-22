//
//  DetailEditView.swift
//  Srumdinger
//
//  Created by Abcom on 22/07/25.
//

import SwiftUI

//Declare @State properties as private so that they can be accessed only within the view in which you define them.
struct DetailEditView: View {
    @State private var scrum : DailyScrum = DailyScrum.emptyScrum
    @State private var attendeeName = ""
    var body: some View {
//        The Form container automatically adapts the appearance of controls when it renders on different platforms.
        Form{
            Section(header: Text("Meeting Info") ){
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1){
//                        The Text view won’t appear onscreen, but VoiceOver uses it to identify the purpose of the slider.
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
            }//section end
            Section(header:Text("Attendees")){
                ForEach(scrum.attendees){
                    attendee in
                    Text(attendee.name)
                }.onDelete{
                    indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $attendeeName)
                    Button{
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    }label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }.disabled(attendeeName.isEmpty)
                }
            }
        }//form end
    }
}


#Preview {
    DetailEditView()
}
