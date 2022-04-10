import SwiftUI

struct DoorsListView: View {
    var body: some View {
        NavigationView {
            Form {
                DoorButton("Main Office", isLocked: false)
                DoorButton("Factory")
                DoorButton("Garage", isLocked: false)
                
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

struct DoorButton: View {
    let title: String
    
    @State private var isLocked: Bool
    
    init(_ title: String, isLocked: Bool = true) {
        self.title = title
        self.isLocked = isLocked
    }
    
    var body: some View {
        Button(action: { isLocked.toggle() }) {
            Label(title, systemImage: isLocked ? "lock" : "lock.open")
        }
    }
}

struct DoorsListView_Previews: PreviewProvider {
    static var previews: some View {
        DoorsListView()
            .previewLayout(.sizeThatFits)
    }
}
