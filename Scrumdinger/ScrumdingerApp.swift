//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Александр Болотов on 07.04.2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
