//
//  CreateNewGroupViewController.swift
//  ImHere
//
//  Created by Mina Lee on 11/8/20.
//

import UIKit
import Firebase
import SDWebImage
import AlamofireImage

class CreateNewGroupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var users = [User]()
    private var groupImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBOutlet weak var newGroupName: UITextField!
    
    
    @IBOutlet weak var groupImagePic: UIImageView!
    
    @IBAction func onGroupPicButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }
        else{
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        groupImage = image
        let size = CGSize(width: 400, height: 400)
        let scaledImage = image.af_imageScaled(to: size)
        self.groupImagePic.layer.borderWidth = 1
        self.groupImagePic.layer.masksToBounds = true
        self.groupImagePic.layer.borderColor = UIColor.black.cgColor
        self.groupImagePic.layer.cornerRadius = self.groupImagePic.frame.size.height/2
        self.groupImagePic.clipsToBounds = true
        groupImagePic.image = scaledImage
        
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createNewGroupButton(_ sender: Any) {
        
        if newGroupName.text != "" {
                 
            guard let groupName = self.newGroupName.text else { return }

            guard let imageData = groupImage!.jpegData(compressionQuality: 0.3) else { return }
            
            let filename = NSUUID().uuidString
            let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
            
            ref.putData(imageData, metadata: nil) { (meta, error) in
                if let error = error {
                    print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
                    return
                }
                
                ref.downloadURL { (url, error) in
                    guard let groupImageUrl = url?.absoluteString else { return }
                    
                        
                        let data = ["groupName": groupName,
                                    "groupImageUrl": groupImageUrl,
                                    "members" : [Auth.auth().currentUser?.uid],
                                    "messages": nil] as [String : Any]
                    
                        Firestore.firestore().collection("groups").document(groupName).setData(data){ (error) in
                            if let error = error {
                                print("DEBUG: Failed to make new group \(error.localizedDescription)")
                                return
                            }
                            let main = UIStoryboard(name: "Main", bundle: nil)
                            let LobbyViewController = main.instantiateViewController(withIdentifier: "LobbyViewController")
                            let scene = UIApplication.shared.connectedScenes.first
                            if let delegate : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                                delegate.window?.rootViewController = LobbyViewController
                            }
                            print("DEBUG: User created new group successfuly...")
                        }
                    }
                }
            }
        }
}
