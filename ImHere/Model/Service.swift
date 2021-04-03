//
//  Service.swift
//  ImHere
//
//  Created by Nick Fong on 11/9/20.
//

import Firebase


struct Service {
    
    static func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                
                users.append(user)
                
            })
            completion(users)
        }
        
    }
    
//    static func fetchMembers(membersQuery: inout [User], groups: Groups, completion: @escaping([User]) -> Void) {
//        
//        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
//            snapshot?.documents.forEach({ document in
//                
//                let dictionary = document.data()
//                let user = User(dictionary: dictionary)
//                
//                for member in groups.members{
//                    if !membersQuery.contains(user) && member == user.uid {
//                        membersQuery.append(user)
//                    }
//                }
//
//                
//            })
//            completion(membersQuery)
//        }
//        
//    }
    
    
    
    static func fetchOwn(completion: @escaping([User]) -> Void) {
        var own = [User]()
        let id = Auth.auth().currentUser!.uid

        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                print(user.uid)
                
                if id == user.uid {
                    own.append(user)
                    
                }
            })
            completion(own)
        }
    }
    
    


    
    static func fetchGroups(completion: @escaping([Groups]) -> Void) {
        let myUserId = Auth.auth().currentUser!.uid;
        let myGroups = Firestore.firestore().collectionGroup("groups").whereField("members", arrayContains: myUserId)
        var own = [Groups]()
        myGroups.getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let user = Groups(dictionary: dictionary)
                
                own.append(user)
                
            })
            completion(own)
        }
    }
    
    
}

    

