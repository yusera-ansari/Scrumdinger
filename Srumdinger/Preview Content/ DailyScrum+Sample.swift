//
//   DailyScrum+Sample.swift
//  Srumdinger
//
//  Created by Abcom on 21/07/25.
//

import Foundation
import ThemeKit

//Swift extensions add new functionality to an existing type.
extension DailyScrum{
    static let sampleData: [DailyScrum] =
     [
         DailyScrum(title: "Design",
                    attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                    lengthInMinutes: 10,
                    theme: .yellow),
         DailyScrum(title: "App Dev",
                    attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                    lengthInMinutes: 5,
                    theme: .orange),
         DailyScrum(title: "Web Dev",
                    attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                    lengthInMinutes: 5,
                    theme: .poppy)
     ]
}
