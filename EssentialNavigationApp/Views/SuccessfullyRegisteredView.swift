import SwiftUI

private let instructions = "You have successfully registered with code:"

struct SuccessfullyRegisteredView: View {
    let code: String
       
    var body: some View {
        Form {
            Text(instructions)
            Section {
                Text(code)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            Button(action: { }) {
                Text("Unregister")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct SuccessfullyRegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfullyRegisteredView(code: "sample-code")
            .previewLayout(.sizeThatFits)
    }
}
