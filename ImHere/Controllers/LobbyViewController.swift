//
//  LobbyViewController.swift
//  ImHere
//
//  Created by Emily Laih on 11/6/20.
//

import UIKit
import Firebase

class LobbyViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func NewGroupButton(_ sender: Any) {
    }
    

    
    @IBOutlet weak var profilePicture: UIImageView!
    

    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            picker.sourceType = .camera
            
        }
        else
        {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = info[.editedImage] as! UIImage
//        
//        let size = CGSize(width: 300, height: 300)
//        let scaledImage = image.af_imageAspectScaled(toFill: size)
//        
//        imageView.image = scaledImage
//        
//        dismiss(animated: true, completion: nil)
//    }
    


    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
