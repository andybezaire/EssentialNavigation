import SwiftUI

struct KeysListView: View {
    @EnvironmentObject private var model: RegisterViewModel

    var body: some View {
        NavigationView {
            Group {
                if model.isRegistered {
                    keysListContent
                } else {
                    RequestRegistrationCodeView()
                }
            }
            .navigationTitle("Keys")
            .toolbar { RegisterButton() }
        }
        .tabItem { Label("Keys", systemImage: "key") }
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
        .environmentObject(RegisterViewModel.stub())
        .environmentObject(DisplaySheet())
    }
}
