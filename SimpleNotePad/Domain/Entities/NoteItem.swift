//
//
//  Created by Oleg Konstantinov.
//

import Foundation

struct NoteItem: Identifiable, Hashable {
    var id: String
    var title: String
    var content: String
    
    init(id: String, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
    
    init(id: String, data: [String: Any]) {
        self.id = id
        self.title = data["title"] as? String ?? ""
        self.content = data["content"] as? String ?? ""
    }
}

extension NoteItem {
    static func toDict(from: NoteItem) -> [String : Any] {
        [
            "title" : from.title,
            "content" : from.content,
            "date" : Date()
        ]
    }
}
