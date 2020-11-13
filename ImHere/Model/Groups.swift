//
//  Groups.swift
//  ImHere
//
//  Created by Nick Fong on 11/9/20.
//

import Foundation

struct Groups {
    let groupImageUrl: String
    let groupName: String
    let members: String
    let messages: String
    
    init(dictionary: [String: Any]) {
        self.groupImageUrl = dictionary["groupImageUrl"] as? String ?? ""
        self.groupName = dictionary["groupName"] as? String ?? ""
        self.members = dictionary["members"] as? String ?? ""
        self.messages = dictionary["messages"] as? String ?? ""
    }
}
