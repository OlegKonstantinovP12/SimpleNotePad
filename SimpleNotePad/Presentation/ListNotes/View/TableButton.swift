//
//
//  Created by Oleg Konstantinov.
//

import SwiftUI

struct TableButton: View {
    var note: NoteItem
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .lineLimit(1)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.black)
            Text(note.content)
                .lineLimit(1)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 50)
    }
}

#Preview {
    @Previewable @State var text: NoteItem = NoteItem(id: "", title: "Hello World", content: "Hello World")
    TableButton(note: text)
}
