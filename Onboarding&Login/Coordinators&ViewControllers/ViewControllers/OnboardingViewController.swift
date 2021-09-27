//
//  OnboardingViewController.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

#warning("make subclass of uipageviewcontroller")
final class OnboardingViewController: UIPageViewController {
                
    // MARK: - Properties

    var coordinator: Coordinator!
    
    private var pages: [UIViewController] = []
    
    lazy var pageControl: UIPageControl = {
        makePageControl(numberOfPages: pages.count, addTo: view)
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        setupViews()
    }
    
    func setupViews() {        
        setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).activate()
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
    }
    
    // MARK: - Init
    
    init(pages: UIViewController...) {
        self.pages = pages
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController),
              index > 0 else { return nil }
        
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController),
              index < pages.count - 1 else { return nil }
        
        return pages[index + 1]
    }
    
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let viewController = pageViewController.viewControllers?[0],
           let index = pages.firstIndex(of: viewController) {
            self.pageControl.currentPage = index
        }
    }
    
}
