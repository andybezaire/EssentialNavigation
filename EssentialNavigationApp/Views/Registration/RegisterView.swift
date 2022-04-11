import SwiftUI

struct RegisterView: View {
    @State private var code: String?
    var body: some View {
        NavigationView {
            Group {
                if let code = code {
                    SuccessfullyRegisteredView(code: code)
                } else {
                    SubmitRegistrationCodeView(model: .init(service: LocalRegistrationService()))
                }
            }
                .navigationTitle("Registration")
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .previewLayout(.sizeThatFits)
    }
}
