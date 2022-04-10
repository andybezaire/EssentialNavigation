//
//  RegisterView.swift
//  EssentialNavigationApp
//
//  Created by Andy Bezaire on 10.4.2022.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        NavigationView {
            SubmitRegistrationCodeView()
                .navigationTitle("Registration")
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .previewLayout(.sizeThatFits)
    }
}
