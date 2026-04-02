//
//
//  Created by Oleg Konstantinov.
//

import SwiftUI

struct MainButton: View {
    let title: String
    let action: ()->Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.bottom, 1)
    }
}

#Preview {
    MainButton(title: "Save") { }
}
