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
}
