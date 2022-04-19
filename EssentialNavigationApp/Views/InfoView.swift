import SwiftUI

struct InfoView: View {
    @State private var instructions: String = ""

    var body: some View {
        NavigationView {
            Form {
                Text(.init(instructions))
            }
            .font(.body)
            .navigationTitle("Info")
            .toolbar { RegisterButton() }
        }
        .tabItem { Label("Info", systemImage: "info.circle") }
        .onAppear {
            if let instructionsURL = Bundle.main.url(forResource: "README", withExtension: "md"),
               let instructions = try? String(contentsOf: instructionsURL) {
                self.instructions = instructions
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewLayout(.sizeThatFits)
            .environmentObject(DisplaySheet())
    }
}
