import SwiftUI

private let instructions = "You will need to register the app before you can view your keys or doors. \nPlease enter your details and request a registration code."

struct RequestRegistrationCodeView: View {
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

struct RequestRegistrationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        RequestRegistrationCodeView()
            .previewLayout(.sizeThatFits)
    }
}
