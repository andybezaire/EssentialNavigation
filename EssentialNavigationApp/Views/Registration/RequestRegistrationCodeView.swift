import SwiftUI

private let instructions = "You will need to register the app before you can view your keys or doors. \nPlease enter your details and request a registration code."

struct RequestRegistrationCodeView: View {
    @EnvironmentObject var model: RequestRegistrationCodeViewModel

    @State private var email: String = ""
    @State private var phone: String = ""
    
    var body: some View {
        Form {
            Text(instructions)
            Section {
                TextField("email", text: $email)
                TextField("phone", text: $phone)
            }
            Button(action: { model.requestRegistrationCode() }) {
                Text("Request Registration Code")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct RequestRegistrationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        RequestRegistrationCodeView()
            .previewLayout(.sizeThatFits)
            .environmentObject(RequestRegistrationCodeViewModel.stub())
    }
}

