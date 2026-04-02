//
//
//  Created by Oleg Konstantinov.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var field: String
    var isSecure: Bool
    var body: some View {
        switch isSecure {
        case true:
            SecureField(placeholder, text: $field)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.gray)
                }
        case false:
            TextField(placeholder, text: $field)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.gray)
                }
            
        }
    }
}

#Preview {
    @Previewable @State var field: String = ""
    CustomTextField(placeholder: "E-mail", field: $field, isSecure: false)
}
