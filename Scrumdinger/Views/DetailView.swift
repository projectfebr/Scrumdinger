//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Александр Болотов on 07.04.2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
            }
            HStack {
                Label("Theme", systemImage: "paintpalette")
                Spacer()
                Text(scrum.theme.name)
                    .padding(4)
                    .foregroundColor(scrum.theme.accentColor)
                    .background(scrum.theme.mainColor)
                    .cornerRadius(4)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    NavigationLink {
                        HistoryView(history: history)
                    } label: {
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            } header: {
                Text("History")
            }

        }
        .navigationTitle(scrum.title)
        .toolbar(content: {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        })
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                scrum = editingScrum
                            }
                        }
                    })
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
