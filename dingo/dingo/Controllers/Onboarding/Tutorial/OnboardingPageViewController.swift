//
//  OnboardingPageViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 12/19/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

// class OnboardingViewController: UIViewController, SwiftyOnboardDataSource {
class OnboardingPageViewController: UIPageViewController {
    weak var onboardingDelegate: OnboardingPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self,
                                                     didUpdatePageCount: orderedViewControllers.count)
    }
    
    private func newOnboardingViewController(num: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "Onboarding\(num)")
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newOnboardingViewController(num: "1"),
                self.newOnboardingViewController(num: "2"),
                self.newOnboardingViewController(num: "3")]
    }()
}

// MARK: UIPageViewControllerDataSource

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self,
                                                         didUpdatePageIndex: index)
        }
    }
    
}

protocol OnboardingPageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter onboardingPageViewController: the OnboardingPageViewController instance
     - parameter count: the total number of pages.
     */
    func onboardingPageViewController(onboardingPageViewController: OnboardingPageViewController,
                                    didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter onboardingPageViewController: the OnboardingPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func onboardingPageViewController(onboardingPageViewController: OnboardingPageViewController,
                                    didUpdatePageIndex index: Int)
    
}
