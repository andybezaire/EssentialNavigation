import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: RegisterViewModel
    @EnvironmentObject private var sheet: DisplaySheet

    var body: some View {
        TabView {
            InfoView()
            KeysListView()
            DoorsListView()
            RegisterView()
        }
        .sheet(isPresented: $sheet.isPresented) {
            RegisterView()
                .environmentObject(model)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
            .environmentObject(RegisterViewModel.stub())
            .environmentObject(DisplaySheet())
    }
}
