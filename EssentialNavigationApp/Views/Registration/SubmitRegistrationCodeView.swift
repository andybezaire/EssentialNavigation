import SwiftUI

private let instructions = "Please enter your registration code.\nThis code was sent to you via sms/email."

public struct SubmitRegistrationCodeView: View {
    @ObservedObject private var model: ViewModel

    init(model: ViewModel) {
        self.model = model
    }
    
    public var body: some View {
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
        SubmitRegistrationCodeView(model: .init(service: LocalRegistrationService()))
            .previewLayout(.sizeThatFits)
    }
}
