import SwiftUI

private let instructions = "Please enter your registration code.\nThis code was sent to you via sms/email."

struct SubmitRegistrationCodeView: View {
    @State private var code: String = ""
    
    var body: some View {
        Form {
            Text(instructions)
            Section {
                TextField("registration code", text: $code)
            }
            Button(action: { }) {
                Text("Submit Code")
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
