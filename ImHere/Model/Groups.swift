//
//  Groups.swift
//  ImHere
//
//  Created by Nick Fong on 11/9/20.
//

import Foundation

struct Groups {
    let groupName: String
    let groupid: String
    let groupImageUrl: String
    let members: String
    let messages: String
    
    init(dictionary: [String: Any]) {
        self.groupName = dictionary["groupName"] as? String ?? ""
        self.groupid = dictionary["groupid"] as? String ?? ""
        self.groupImageUrl = dictionary["groupImageUrl"] as? String ?? ""
        self.members = dictionary["members"] as? String ?? ""
        self.messages = dictionary["messages"] as? String ?? ""
    }
}
