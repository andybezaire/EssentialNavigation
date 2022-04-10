//
//  DoorsListView.swift
//  EssentialNavigationApp
//
//  Created by Andy Bezaire on 10.4.2022.
//

import SwiftUI

struct DoorsListView: View {
    var body: some View {
        NavigationView {
            Form {
                Button(action: { }) {
                    Label("Main Office", systemImage: "lock.open")
                }
                Button(action: { }) {
                    Label("Factory", systemImage: "lock")
                }
                Button(action: { }) {
                    Label("Garage", systemImage: "lock.open")
                }
                
                Section("No Access") {
                    Label("Storage", systemImage: "lock")
                    Label("Server Room", systemImage: "lock")
                    Label("Maintenance", systemImage: "lock")
                }
                .foregroundColor(.secondary)

            }
            .navigationTitle("Doors")
        }
    }
}

struct DoorsListView_Previews: PreviewProvider {
    static var previews: some View {
        DoorsListView()
            .previewLayout(.sizeThatFits)
    }
}
