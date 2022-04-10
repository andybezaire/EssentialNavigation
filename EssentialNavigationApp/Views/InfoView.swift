import SwiftUI

private let instructions = [
    [
        "Create a demo application to test programmatic navigation in **SwiftUI**.",
        "This is an internal app used by a company to manage users' access to opening various doors on the company premises.",
    ],
    [
        "In order for a user to use the app, they must first enter a registration code. This registration code is sent by the back-end service and is used to identify the user.",
        "The user requests the registration code by entering their email/mobile number and pressing **'Request Registration Code'**.",
    ],
    [
        "When **'Request Registration Code'** is pressed, the request will be sent to the back-end. The back-end will send an sms/email message to the user. That message contains the registration code in a link.",
        "The user should then open that message and select the link in it. That link should bring the user to the **Register** view and the registration code from the link should be pre-filled out in the form.",
    ],
    [
        "When the user presses **'Submit Code'** the registration code should be submitted and the user should be brought to the **Keys** tab.",
    ],
    [
        "Currently the designers are not sure if the **Register** view should be in a sheet controlled by a toobar button, or if it should be in its own tab.",
        "Also the designers are not sure if the user should be brought to the **Keys** list or the **Doors** list after submitting the registration code.",
        "Your design should allow for the flexibility to easily change these requirements when neccessary.",
    ],
    [
        "As implementing universal links is outside of the scope of this task, the demo app is set up to automatically respond with the registration code after a short delay.",
        "Also there is no need to fill in any of the forms with correct data in this demo app. All buttons work even if the form is not filled out."
      ]
]

struct InfoView: View {
    var body: some View {
        NavigationView {
            Form {
                ForEach(instructions, id: \.self) { instruction in
                    Section {
                        ForEach(instruction, id: \.self) {
                            Text(.init($0))
                        }
                    }
                }
            }
            .font(.body)
            .navigationTitle("Goals")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewLayout(.sizeThatFits)
    }
}
