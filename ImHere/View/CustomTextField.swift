//
//  CustomTextField.swift
//  I'm Here
//
//  Credit to Stephan Dowless from https://www.udemy.com/user/stephan-dowless/
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String) {
        
        super.init(frame: .zero)
            
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = .white
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.white])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
