//
//  ViewsFactory.swift
//  Project8
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

func makeLabel(text: String? = nil, font: UIFont? = nil, addTo: UIView? = nil) -> UILabel {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = font
    
    addTo?.addSubview(label)
    
    return label
}

func makeTextField(placeholder: String? = nil, font: UIFont? = nil, addTo: UIView? = nil) -> UITextField {
    let textField = UITextField()
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeholder
    textField.font = font
    
    addTo?.addSubview(textField)
    
    return textField
}

func makeButton(type: UIButton.ButtonType, title: String? = nil, font: UIFont? = nil, addTo: UIView? = nil) -> UIButton {
    let button = UIButton()
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = font
    
    addTo?.addSubview(button)
    
    return button
}

func makeView(addTo: UIView? = nil) -> UIView {
    let view = UIView()
    
    view.translatesAutoresizingMaskIntoConstraints = false
    
    addTo?.addSubview(view)
    
    return view
}
