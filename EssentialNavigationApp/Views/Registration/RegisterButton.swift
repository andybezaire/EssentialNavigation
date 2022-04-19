import SwiftUI

struct RegisterButton: View {
    @EnvironmentObject private var sheet: DisplaySheet
    @EnvironmentObject var model: RegisterViewModel

    var body: some View {
        Button(action: { sheet.isPresented.toggle() }) {
            Label("Register", systemImage: model.statusIcon)
                .symbolRenderingMode(.multicolor)
        }
    }
}

struct RegisterButton_Previews: PreviewProvider {
    static var previews: some View {
        RegisterButton()
            .previewLayout(.sizeThatFits)
    }
}
