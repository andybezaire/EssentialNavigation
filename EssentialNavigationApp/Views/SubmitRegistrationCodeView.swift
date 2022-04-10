import SwiftUI

private let instructions = "You will need to register the app before you can view your keys or doors. \nPlease enter your details and request a registration code."

struct SubmitRegistrationCodeView: View {
    @State private var email: String = ""
    @State private var phone: String = ""
    
    var body: some View {
        Form {
            Text(instructions)
            Section {
                TextField("email", text: $email)
                TextField("phone", text: $email)
            }
            Button(action: { }) {
                Text("Request Registration Code")
            }
        }
    }
}

struct SubmitRegistrationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitRegistrationCodeView()
            .previewLayout(.sizeThatFits)
    }
}
