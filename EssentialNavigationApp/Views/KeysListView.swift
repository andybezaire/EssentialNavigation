import SwiftUI

struct KeysListView: View {
    var body: some View {
        NavigationView {
            Form {
                KeyLink("Main Office")
                KeyLink("Factory")
                KeyLink("Garage")
                Section("Inactive") {
                    KeyLink("Storage")
                    KeyLink("Server Room")
                }
                .foregroundColor(.secondary)
            }
            .navigationTitle("Keys")
        }
    }
}

struct KeyLink: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        NavigationLink {
            Text("\(title) Key details")
        } label: {
            Label(title, systemImage: "key")
        }
    }
}

struct KeysListView_Previews: PreviewProvider {
    static var previews: some View {
        KeysListView()
            .previewLayout(.sizeThatFits)
    }
}
