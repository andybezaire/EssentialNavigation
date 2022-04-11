import SwiftUI

private let instructions = "Please enter your registration code.\nThis code was sent to you via sms/email."

struct SubmitRegistrationCodeView: View {
    @ObservedObject var model: ViewModel
    
    var body: some View {
        Form {
            Text(instructions)
            Section {
                TextField("registration code", text: $model.registrationCode)
            }
            Button(action: model.submitCode) {
                Text("Submit Code")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct SubmitRegistrationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitRegistrationCodeView(model: .init())
            .previewLayout(.sizeThatFits)
    }
}
