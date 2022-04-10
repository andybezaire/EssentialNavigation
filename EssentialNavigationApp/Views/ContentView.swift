import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
            KeysListView()
                .tabItem {
                    Label("Keys", systemImage: "key")
                }
            DoorsListView()
                .tabItem {
                    Label("Doors", systemImage: "lock")
                }
            RegisterView()
                .tabItem {
                    Label("Register", systemImage: "person.crop.circle.badge.xmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
