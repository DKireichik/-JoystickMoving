//
//  ViewController.swift
//  JoystickMoving
//
//  Created by Darya on 11.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    let square = {
        let square = UIView(frame: .init(x: .zero, y: .zero, width: 100, height: 100))
        square.backgroundColor = .black
        square.translatesAutoresizingMaskIntoConstraints = false
        return square
    }()

    let joystick = {
        let joystick = Joystick()
        joystick.translatesAutoresizingMaskIntoConstraints = false
        joystick.alpha = 1
        return joystick
    }()
    var buttonStartAgain = {
        let buttonStartAgain = UIButton()
        buttonStartAgain.setTitle("Start again", for: .normal)
        buttonStartAgain.setTitleColor(.black, for: .normal)
        buttonStartAgain.alpha = 0
        buttonStartAgain.translatesAutoresizingMaskIntoConstraints = false
        return buttonStartAgain
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(square)
        view.addSubview(joystick)
        view.addSubview(buttonStartAgain)
        buttonStartAgain.addTarget(self, action: #selector(buttonStartPressed), for: .touchUpInside)
        
        square.center = view.center

        
        NSLayoutConstraint.activate([
            joystick.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            joystick.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            buttonStartAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStartAgain.centerYAnchor.constraint(equalTo: joystick.centerYAnchor)
        ])
        
        joystick.pressedButtonUp =  { _ in  UIView.animate(withDuration: 1) {
            self.square.center.y -= 20 } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    squareFrameIntersects()
                }
            }
        }
        joystick.pressedButtonDown =  { _ in  UIView.animate(withDuration: 1) {
            self.square.center.y += 20 } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    squareFrameIntersects()
                }
            }
        }
        joystick.pressedButtonLeft =  { _ in  UIView.animate(withDuration: 1) {
            self.square.center.x -= 20 } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    squareFrameIntersects()
                }
            }
        }
        joystick.pressedButtonRight =  { _ in  UIView.animate(withDuration: 1) {
            self.square.center.x += 20 } completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    squareFrameIntersects()
                }
            }
        }
        
        func squareFrameIntersects() {
            if square.frame.intersects(joystick.frame) {
                joystick.alpha = 0
                buttonStartAgain.alpha = 1
            }
            let screenBounds = UIScreen.main.bounds
            if !screenBounds.contains(square.frame) {
                joystick.alpha = 0
                buttonStartAgain.alpha = 1
                
            }
        }
        
    }
    @objc func buttonStartPressed() {
        joystick.alpha = 1
        buttonStartAgain.alpha = 0
        square.center = view.center
    }
    
}
