//
//  joystick.swift
//
//  Created by Darya on 11.12.23.
//

import UIKit

class Joystick: UIView {

    var pressedButtonUp: ((Joystick) -> ())?
    var pressedButtonDown: ((Joystick) -> ())?
    var pressedButtonLeft: ((Joystick) -> ())?
    var pressedButtonRight: ((Joystick) -> ())?

    let buttonUp = {
        let buttonUp = UIButton()
        buttonUp.translatesAutoresizingMaskIntoConstraints = false
        buttonUp.setBackgroundImage(UIImage(systemName: "chevron.compact.up"), for: .normal)
        return buttonUp
    }()
    
    let buttonDown = {
        let buttonDown = UIButton()
        buttonDown.translatesAutoresizingMaskIntoConstraints = false
        buttonDown.setBackgroundImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        return buttonDown
    }()
    
    let buttonLeft = {
        let buttonLeft = UIButton()
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        buttonLeft.setBackgroundImage(UIImage(systemName: "chevron.compact.left"), for: .normal)
        return buttonLeft
    }()
    
    let buttonRight = {
        let buttonRight = UIButton()
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        buttonRight.setBackgroundImage(UIImage(systemName: "chevron.compact.right"), for: .normal)
        return buttonRight
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(buttonUp)
        addSubview(buttonDown)
        addSubview(buttonLeft)
        addSubview(buttonRight)
        buttonUp.addTarget(self, action: #selector(buttonUpPressed), for: .touchUpInside)
        buttonDown.addTarget(self, action: #selector(buttonDownPressed), for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(buttonLeftPressed), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(buttonRightPressed), for: .touchUpInside)
       
        NSLayoutConstraint.activate([
            
            buttonUp.topAnchor.constraint(equalTo: topAnchor),
            buttonDown.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonRight.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonLeft.leadingAnchor.constraint(equalTo: leadingAnchor),

            buttonUp.widthAnchor.constraint(equalToConstant: 50),
            buttonUp.heightAnchor.constraint(equalToConstant: 50),
            buttonUp.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            buttonUp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonDown.widthAnchor.constraint(equalToConstant: 50),
            buttonDown.heightAnchor.constraint(equalToConstant: 50),
            buttonDown.topAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            buttonDown.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonLeft.widthAnchor.constraint(equalToConstant: 50),
            buttonLeft.heightAnchor.constraint(equalToConstant: 50),
            buttonLeft.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            buttonLeft.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            buttonRight.widthAnchor.constraint(equalToConstant: 50),
            buttonRight.heightAnchor.constraint(equalToConstant: 50),
            buttonRight.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            buttonRight.centerYAnchor.constraint(equalTo: centerYAnchor)

        ])
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonUpPressed(_ sender: UIButton) {
        pressedButtonUp?(self)
    }
    
    @objc func buttonDownPressed(_ sender: UIButton) {
        pressedButtonDown?(self)
    }
    
    @objc func buttonLeftPressed(_ sender: UIButton) {
        pressedButtonLeft?(self)
    }
    
    @objc func buttonRightPressed(_ sender: UIButton) {
        pressedButtonRight?(self)
    }
    
}
