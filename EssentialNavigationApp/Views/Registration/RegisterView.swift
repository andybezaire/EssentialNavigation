import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var model: RegisterViewModel

    var body: some View {
        NavigationView {
            Group {
                if let code = model.registrationCode {
                    SuccessfullyRegisteredView(code: code)
                } else {
                    SubmitRegistrationCodeView()
                }
            }
            .navigationTitle("Registration")
        }
        .tabItem { Label("Register", systemImage: "person.crop.circle.badge.xmark") }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .previewLayout(.sizeThatFits)
            .environmentObject(RegisterViewModel.stub())
    }
}
