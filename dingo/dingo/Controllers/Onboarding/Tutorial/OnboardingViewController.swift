//
//  OnboardingViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/19/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var dots: UIPageControl!
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize dots here!!
        dots.frame = CGRect(x: self.view.bounds.width / 2 - 10, y: self.view.bounds.height / 2 + 30, width: 20, height: 20)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let onboardingPageViewController = segue.destination as? OnboardingPageViewController {
            onboardingPageViewController.onboardingDelegate = self
        }
    }
}

extension OnboardingViewController: OnboardingPageViewControllerDelegate {
    
    func onboardingPageViewController(onboardingPageViewController: OnboardingPageViewController,
                                    didUpdatePageCount count: Int) {
        dots.numberOfPages = count
    }
    
    func onboardingPageViewController(onboardingPageViewController: OnboardingPageViewController,
                                    didUpdatePageIndex index: Int) {
        dots.currentPage = index
    }
    
}
