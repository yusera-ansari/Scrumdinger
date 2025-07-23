//
//  DetailView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import SwiftUI
import SwiftData

//To use the same color as other interactive elements, use accentColor.
struct DetailView: View {
     let scrum: DailyScrum
    
    @State private var isPresentingEditView = false
    @State private var errorWrapper : ErrorWrapper?
    var body: some View {
        List {
            Section(header: Text("Meeting Info")){
                NavigationLink(destination:MeetingView(scrum: scrum, errorWrapper: $errorWrapper)){
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
            
            Section(header:Text("History")){
                if scrum.history.isEmpty {
                    Label("No meeting yet", systemImage: "calendar.badge.exclamationmark")
                }else{
                    ForEach(scrum.history){
                        history in
                        HStack{
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                        
                    }
                }
            }//section end
        }//list end
        .navigationTitle(scrum.title)
        .toolbar{
            Button{
                isPresentingEditView = true
               
            }label:{
                Text("Edit")
            }
        }
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack{
                DetailEditView(scrum: scrum)
                    .navigationTitle(scrum.title)
//                    .toolbar{
//                        ToolbarItem(placement: .confirmationAction, content: {
//                            Button("Done") {
//                        isPresentingEditView = false
//                                scrum = editingScrum
//                                }
//                        })
//                        ToolbarItem(placement:.cancellationAction){
//                            Button{
//                                isPresentingEditView = false
//                            }label:{
//                                Text("Cancel")
//                            }
//                        }
//                        
//                    }
            }//nav stack
        })//sheet
        .sheet(item: $errorWrapper, onDismiss: nil, content: { wrapper in
            ErrorView(errorWrapper: wrapper)
        })
       
    }
}

#Preview(traits: .dailyScrumsSampleData) {
    @Previewable @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]
      NavigationStack {
          DetailView(scrum: scrums[0])
      }
}
