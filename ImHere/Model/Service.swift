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
                completion(users)
                
                //print("DEBUG: Username is \(user.username)")
                //print("DEBUG: Fullname is \(user.fullname)")
                //print("DEBUG: UID is \(user.uid)")
                
            })
        }
    }
    
    static func fetchOwn(completion: @escaping([User]) -> Void) {
        var own = [User]()
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                
                
                if Auth.auth().currentUser!.uid == user.uid {
                    own.append(user)
                    completion(own)
                }
                
                //print("DEBUG: Username is \(user.username)")
                //print("DEBUG: Fullname is \(user.fullname)")
                //print("DEBUG: UID is \(user.uid)")
                
            })
        }
    }
    

    
    
    static func fetchGroups(completion: @escaping([Groups]) -> Void) {
        print("fefreervereveve")
        var groups = [Groups]()
        let myUserId = Auth.auth().currentUser!.uid;
        let myGroups = Firestore.firestore().collectionGroup("groups").whereField("members", arrayContains: myUserId)
        print("here")

        myGroups.getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let dictionary = document.data()
                    let group = Groups(dictionary: dictionary)
                    groups.append(group)
                }
                completion(groups)
            }
    }
    
    
    
//    static func fetchGroups(completion: @escaping([Groups]) -> Void) {
//        var groups = [Groups]()
//        print("fefreervereveve")
//
//        let myUserId = Auth.auth().currentUser!.uid;
//        let myGroups = Firestore.firestore().collectionGroup("groups").whereField("members", arrayContains: myUserId)
//        print("here")
//
//        myGroups.getDocuments { (snapshot, error) in
//            print("frffrfrfevfv gvg")
//            snapshot?.documents.forEach({ document in
//                print("working")
//                let dictionary = document.data()
//                let group = Groups(dictionary: dictionary)
//
//                groups.append(group)
//
//            })
//            completion(groups)
//        }
    
//    static func fetchGroups(completion: @escaping([Groups]) -> Void) {
//            var groups = [Groups]()
//            Firestore.firestore().collection("groups").getDocuments { (snapshot, error) in
//                snapshot?.documents.forEach({ document in
//
//                    let dictionary = document.data()
//                    let group = Groups(dictionary: dictionary)
//
//                    groups.append(group)
//
//
//                    //print("DEBUG: Username is \(user.username)")
//                    //print("DEBUG: Fullname is \(user.fullname)")
//                    //print("DEBUG: UID is \(user.uid)")
//
//                })
//                completion(groups)
//            }
//
    }

    
    
    
}
