//
//  DetailView.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import SwiftUI
//To use the same color as other interactive elements, use accentColor.
struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
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
            
        }//list end
        .navigationTitle(scrum.title)
        .toolbar{
            Button{
                isPresentingEditView = true
                editingScrum = scrum
            }label:{
                Text("Edit")
            }
        }
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack{
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .confirmationAction, content: {
                            Button("Done") {
                        isPresentingEditView = false
                                scrum = editingScrum
                                }
                        })
                        ToolbarItem(placement:.cancellationAction){
                            Button{
                                isPresentingEditView = false
                            }label:{
                                Text("Cancel")
                            }
                        }
                        
                    }
            }
        })
       
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    NavigationStack{
        DetailView(scrum:$scrum)
    }
}
