//
//  ModalViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/20/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate: class {
    func removeBlurredBackgroundView()
}

class ModalViewController: UIViewController {

    weak var delegate: ModalViewControllerDelegate?
    var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear

        print("HELLOOOOO")
        
        cancelButton = UIButton(frame: CGRect(x: 150, y: 0, width: 20, height: 10))
        cancelButton.setTitle("Cancel", for: [])
        self.view.addSubview(cancelButton)
        cancelButton.setTitleColor(UIColor.white, for: [])
        cancelButton.addTarget(self, action: #selector(cancel(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        //ensure that the icon embeded in the cancel button fits in nicely
        // cancelButton.imageView?.contentMode = .scaleAspectFit
        
        //add a white tint color for the Cancel button image
        // let cancelImage = UIImage(named: "Cancel")
        
        // let tintedCancelImage = cancelImage?.withRenderingMode(.alwaysTemplate)
        // cancelButton.setImage(tintedCancelImage, for: .normal)
        // cancelButton.tintColor = .white
    }
    
    @objc func cancel(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
        delegate?.removeBlurredBackgroundView()
    }
}
