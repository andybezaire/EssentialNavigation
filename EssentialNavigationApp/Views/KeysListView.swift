//
//  KeysListView.swift
//  EssentialNavigationApp
//
//  Created by Andy Bezaire on 10.4.2022.
//

import SwiftUI

struct KeysListView: View {
    var body: some View {
        NavigationView {
            Form {
                Label("Main Office", systemImage: "key")
                Label("Factory", systemImage: "key")
                Label("Garage", systemImage: "key")
                Section("Inactive") {
                    Label("Storage", systemImage: "key")
                    Label("Server Room", systemImage: "key")
                }
                .foregroundColor(.secondary)
            }
            .navigationTitle("Keys")
        }
    }
}

struct KeysListView_Previews: PreviewProvider {
    static var previews: some View {
        KeysListView()
            .previewLayout(.sizeThatFits)
    }
}
