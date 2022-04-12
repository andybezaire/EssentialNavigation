import SwiftUI

struct RegisterButton: View {
    @EnvironmentObject private var sheet: DisplaySheet
    var body: some View {
        Button(action: { sheet.isPresented.toggle() }) {
            Label("Register", systemImage: "person.crop.circle.badge.xmark")
        }
    }
}

struct RegisterButton_Previews: PreviewProvider {
    static var previews: some View {
        RegisterButton()
            .previewLayout(.sizeThatFits)
    }
}
