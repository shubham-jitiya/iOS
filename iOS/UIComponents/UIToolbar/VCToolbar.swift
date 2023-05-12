//
//  VCToolbar.swift
//  iOS
//
//  Created by Shubham Jitiya on 12/05/23.
//

import UIKit

class VCToolbar: UIViewController {
    // MARK: IB outlets
    @IBOutlet weak var toolbar: UIToolbar!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension VCToolbar {
    private func initialSetup() {
        toolbar.delegate = self
        let btnPlay = UIBarButtonItem(image: UIImage(systemName: "play"), style: .plain, target: nil, action: nil)
        let btnPrevious = UIBarButtonItem(image: UIImage(systemName: "chevron.left.to.line"), style: .plain, target: nil, action: nil)
        let btnNext = UIBarButtonItem(image: UIImage(systemName: "chevron.right.to.line"), style: .plain, target: nil, action: nil)
 
        toolbar.setItems([btnPrevious, btnPlay, btnNext], animated: true)
        
    }
}

// MARK: Toolbar delegate methods
extension VCToolbar: UIToolbarDelegate {
    
}

