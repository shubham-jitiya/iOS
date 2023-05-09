//
//  VCImageView.swift
//  iOS
//
//  Created by Shubham Jitiya on 09/05/23.
//

import UIKit

class VCImageView: UIViewController {
    // MARK: Variables
    
    // MARK: IB outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var ivVolume: UIImageView!
    
    // MARK: View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension VCImageView {
    @IBAction private func connectSpeaker(_ sender: UIButton) {
        
    }
}

// MARK: Functions
extension VCImageView {
    private func initialSetup(){
        imgView.contentMode = .scaleAspectFit
        addImages()
        animateImageView()
    }
    
    private func addImages() {
   
    }
    
    private func animateImageView() {
       
    }
    
    private func setupImageViewAnimation() {
      
    }
}
