//
//  VCToolbar.swift
//  iOS
//
//  Created by Shubham Jitiya on 12/05/23.
//

import UIKit

class ToolbarVC: UIViewController {
    // MARK: IB outlets
    @IBOutlet private weak var toolbar: UIToolbar!
    @IBOutlet private weak var toolbarDelete: UIToolbar!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupDeleteBar()
    }
}

// MARK: Functions
extension ToolbarVC {
    private func initialSetup() {
        let btnPlay = UIBarButtonItem(
            image: UIImage(systemName: "play"),
            style: .plain,
            target: nil,
            action: nil)
        let btnPrevious = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left.to.line"),
            style: .plain,
            target: nil,
            action: nil)
        let btnNext = UIBarButtonItem(
            image: UIImage(systemName: "chevron.right.to.line"),
            style: .plain,
            target: nil,
            action: nil)
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
            target: nil,
            action: nil)
        toolbar.setItems([btnPrevious, flexSpace, btnPlay, flexSpace, btnNext], animated: true)
    }
    
    private func setupDeleteBar() {
        let btnStop = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.stop,
            target: nil,
            action: #selector(actionStop))
        let btnTrash = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.trash,
            target: nil,
            action: #selector(actionTrash))
        let btnUndo = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.undo,
            target: nil,
            action: #selector(actionUndo))
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
            target: nil,
            action: nil)
        toolbarDelete.setItems([btnStop, flexSpace, btnTrash, flexSpace, btnUndo], animated: true)
    }
    
    @objc private func actionStop() {
        print("Task cancelled")
    }
    
    @objc private func actionTrash() {
        print("Task deleted")
    }
    
    @objc private func actionUndo() {
        print("Task undo")
    }
}

