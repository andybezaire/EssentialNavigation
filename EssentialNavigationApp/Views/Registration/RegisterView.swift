import SwiftUI

struct RegisterView: View {
    @State private var code: String?
    var body: some View {
        NavigationView {
            Group {
                if let code = code {
                    SuccessfullyRegisteredView(code: code)
                } else {
                    SubmitRegistrationCodeView()
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
            .environmentObject(SubmitRegistrationCodeView.ViewModel.stub(withCode: "00000-00000-00000-00000"))
    }
}
