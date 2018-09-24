//
//  OnboardingViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 7/26/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework
import SwiftyOnboard
//import paper_onboarding

class OnboardingViewController: UIViewController, SwiftyOnboardDataSource {

    var nextButton: UIButton!
    var currentUser: User!
    var dingo: UIImage!
    var page1: SwiftyOnboardPage!
    var page2: SwiftyOnboardPage!
    var page3: SwiftyOnboardPage!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = mainColor
        dingo = UIImage(named: "dingo_transparent")
        
        setupPages()
        let swiftyOnboard = SwiftyOnboard(frame: view.frame)
        view.addSubview(swiftyOnboard)
        swiftyOnboard.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func drawEndButton(view: UIView) {
        nextButton = UIButton(frame: CGRect(x: 76, y: 516, width: 225, height: 50))
        nextButton.backgroundColor = FlatWhite()
        nextButton.frame.size = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 8)
        nextButton.center.x = self.view.center.x
        nextButton.center.y = self.view.center.y * 1.5
        nextButton.tag = 0
        nextButton.setTitle("Finish setup", for: [])
        nextButton.setTitleColor(mainColor, for: .normal)
        nextButton.addTarget(self, action: #selector(endSetup(_:)), for: .touchUpInside)
        
        view.addSubview(nextButton)
    }
    
    @objc func endSetup(_ button: UIButton) {
        performSegue(withIdentifier: "onboardingToHome", sender: nil)
    }
    
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return 3
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        return [page1, page2, page3][index]
    }
    
    func setupPages() {
        page1 = SwiftyOnboardPage()
        page2 = SwiftyOnboardPage()
        page3 = SwiftyOnboardPage()
        
        page1.title.text = ""
        page2.title.text = ""
        page3.title.text = ""
        
        page1.imageView.image = UIImage(named: "dingo_transparent")
        page2.imageView.image = UIImage(named: "dingo_transparent")
        page3.imageView.image = UIImage(named: "dingo_transparent")
        
        page1.subTitle.text = onboardingDescription1
        page2.subTitle.text = onboardingDescription2
        page3.subTitle.text = onboardingDescription3
        
        page1.subTitle.textColor = FlatWhite()
        page2.subTitle.textColor = FlatWhite()
        page3.subTitle.textColor = FlatWhite()
        
        drawEndButton(view: page3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? HomepageViewController {
            destinationViewController.currentUser = currentUser
        }
    }
    
    

}
