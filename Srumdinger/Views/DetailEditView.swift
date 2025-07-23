//
//  DetailEditView.swift
//  Srumdinger
//
//  Created by Abcom on 22/07/25.
//

import SwiftUI
import ThemeKit

//Declare @State properties as private so that they can be accessed only within the view in which you define them.
struct DetailEditView: View {
      let scrum : DailyScrum
    @State private var attendeeName = ""
    @State private var title: String
    @State private var lengthInMinutesAsDouble: Double
    @State private var theme: Theme
    @State private var attendees: [Attendee]
    @State private var errorWrapper : ErrorWrapper?
//    let saveEdits: (DailyScrum) -> Void
    private let isCreatingScrum: Bool
    @Environment(\.modelContext) private var context
//    With the @Environment property wrapper, you can read a value that the view’s environment stores, such as the view’s presentation mode, scene phase, visibility, or color scheme.
    @Environment(\.dismiss) private var dismiss
    init(scrum: DailyScrum?) {
            let scrumToEdit: DailyScrum
            if let scrum {
                scrumToEdit = scrum
                isCreatingScrum = false
            } else {
                scrumToEdit = DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
                isCreatingScrum = true
            }


            self.scrum = scrumToEdit
            self.title = scrumToEdit.title
            self.lengthInMinutesAsDouble = scrumToEdit.lengthInMinutesAsDouble
            self.attendees = scrumToEdit.attendees
            self.theme = scrumToEdit.theme
        }
    
    var body: some View {
        //        The Form container automatically adapts the appearance of controls when it renders on different platforms.
        Form{
            Section(header: Text("Meeting Info") ){
                TextField("Title", text: $title)
                HStack{
                    Slider(value: $lengthInMinutesAsDouble, in: 5...30, step: 1){
                        //                        The Text view won’t appear onscreen, but VoiceOver uses it to identify the purpose of the slider.
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $theme)
            }//section end
            Section(header:Text("Attendees")){
                ForEach(attendees){
                    attendee in
                    Text(attendee.name)
                }.onDelete{
                    indices in
                     attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $attendeeName)
                    Button{
                        withAnimation{
                            let attendee =  Attendee(name: attendeeName)
                            attendees.append(attendee)
                            attendeeName = ""
                        }
                    }label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }.disabled(attendeeName.isEmpty)
                }
            }
        }//form end
        .toolbar{
            ToolbarItem(placement: .confirmationAction, content: {
                Button("Cancel") {
                                    dismiss()
                                }
            })
            ToolbarItem(placement: .confirmationAction) {
                           Button("Done") {
                               do{
                                 try  saveEdits()
                                dismiss()
                               }catch{
                                   errorWrapper = ErrorWrapper(error: error, guidance: "Daily scrum was not recorded. Try again later.")
                               }
                              
                           }
                       }
        }//toolbar
        .sheet(item: $errorWrapper, onDismiss: {
            
        }, content: {
            wrapper in
            ErrorView(errorWrapper: wrapper)
        })
    }
    func saveEdits()throws{
        print("save edits")
        scrum.title = title
              scrum.lengthInMinutesAsDouble = lengthInMinutesAsDouble
              scrum.attendees = attendees
              scrum.theme = theme


              if isCreatingScrum {
               context.insert(scrum)
              }


              try context.save()
    }
}


#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    NavigationStack{
        DetailEditView(scrum: scrum )
    }
}
