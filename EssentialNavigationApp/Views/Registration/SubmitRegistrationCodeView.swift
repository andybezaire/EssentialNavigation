import SwiftUI

private let instructions = "Please enter your registration code.\nThis code was sent to you via sms/email."

public struct SubmitRegistrationCodeView: View {
    @EnvironmentObject private var model: ViewModel
    
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
        SubmitRegistrationCodeView()
            .previewLayout(.sizeThatFits)
            .environmentObject(SubmitRegistrationCodeView.ViewModel.stub(withCode: "00000-00000-00000-00000"))
    }
}
