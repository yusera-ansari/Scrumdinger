//
//  DailyScrum.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import ThemeKit
import Foundation



struct DailyScrum: Identifiable {
    var id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
//    By using a computed property, you can provide a getter to retrieve the scrum’s length as a double value and a setter to update the corresponding integer value when the slider changes.
    var lengthInMinutesAsDouble: Double {
        get {
//            For Swift functions that return a value, you can omit the return keyword when the body is a single expression.
                   Double(lengthInMinutes)
               }
        set{
//            You can provide an argument to the setter to name the newly set value. If you omit the argument, the setter uses newValue as the default name.
            lengthInMinutes = Int(newValue)
        }
    }
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
           self.id = id
           self.title = title
        self.attendees = attendees.map{Attendee(name: $0)}
           self.lengthInMinutes = lengthInMinutes
           self.theme = theme
       }
}
extension DailyScrum{
    struct Attendee : Identifiable {
        let id: UUID
        let name:String
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
//    Use a computed property when:
//    You want a fresh new instance each time it’s accessed.
//
//    You might compute different values based on other logic (even if not currently).
//
//    You're defining a constant template that you want to use to generate new independent instances (e.g., an empty form).
//
//    This ensures that calling DailyScrum.emptyScrum gives a brand-new DailyScrum each time.
    static var emptyScrum : DailyScrum
    { DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)}
}
