//
//  History.swift
//  Srumdinger
//
//  Created by Abcom on 23/07/25.
//

import Foundation
import SwiftData

@Model
class History: Identifiable {
    var id: UUID
    var date: Date
    var attendees: [Attendee]
    var dailyScrum : DailyScrum?

    init(id: UUID = UUID(), date: Date = Date(), attendees: [Attendee]) {
        
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
