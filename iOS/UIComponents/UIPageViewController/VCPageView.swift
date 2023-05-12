//
//  VCPageViewController.swift
//  iOS
//
//  Created by Shubham Jitiya on 12/05/23.
//

import UIKit

class VCPageView: UIPageViewController {
    // MARK: Variables
    private var pages: [UIViewController]  = []
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension VCPageView {
    private func initialSetup() {
        dataSource = self
        delegate = self
        addViewControllers()
    }
    
    private func addViewControllers() {
        guard let firstPage = ScreenFirstViewController.create(storyboardName: .uiScreenFirstViewController),
              let secondPage = ScreenSecondViewController.create(storyboardName: .uiScreenSecondViewController),
              let thirdPage = ScreenThirdViewController.create(storyboardName: .uiScreenThirdViewController) else {
            return
        }
        pages.append(firstPage)
        pages.append(secondPage)
        pages.append(thirdPage)
        setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: UIPageViewController data source
extension VCPageView: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = pages.firstIndex(of: viewController) else { return nil }
            let previousIndex = index - 1
            guard previousIndex >= 0 else { return nil }
            return pages[previousIndex]
        }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = pages.firstIndex(of: viewController) else { return nil }
            let nextIndex = index + 1
            guard nextIndex < pages.count else { return nil }
            return pages[nextIndex]
        }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

// MARK: UIPageViewController Delegate methods
extension VCPageView: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
            print("Did finish called")
        }
}
