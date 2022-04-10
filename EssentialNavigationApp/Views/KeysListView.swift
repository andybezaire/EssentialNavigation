import SwiftUI

struct KeysListView: View {
    @State private var isRegistered: Bool = false
    
    var body: some View {
        NavigationView {
            Group {
                if isRegistered {
                    keysListContent
                } else {
                    SubmitRegistrationCodeView()
                }
            }
            .navigationTitle("Keys")
        }
    }
    
    var keysListContent: some View {
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
