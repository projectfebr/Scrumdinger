//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Александр Болотов on 07.04.2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
