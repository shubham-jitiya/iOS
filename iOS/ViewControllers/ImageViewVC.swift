//
//  VCImageView.swift
//  iOS
//
//  Created by Shubham Jitiya on 09/05/23.
//

import UIKit

class ImageViewVC: UIViewController {
    // MARK: Variables
    private var images: [UIImage] = []
    
    // MARK: IB outlets
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var btnConnect: UIButton!
    @IBOutlet private weak var ivVolume: UIImageView!
    @IBOutlet private weak var ivLogo: UIImageView!
    
    // MARK: View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension ImageViewVC {
    @IBAction private func connectSpeaker(_ sender: UIButton) {
        if imgView.isAnimating {
            btnConnect.setTitle("Connect", for: .normal)
            imgView.stopAnimating()
        } else {
            btnConnect.setTitle("Disconnect", for: .normal)
            imgView.startAnimating()
        }
    }
}

// MARK: Functions
extension ImageViewVC {
    private func initialSetup(){
        imgView.contentMode = .scaleAspectFit
        addImages()
        animateImageView()
    }
    
    private func addImages() {
        guard let image_1 = UIImage(systemName: Constants.Images.speakerWaveOneFilled.rawValue) else {
            return
        }
        guard let image_2 = UIImage(systemName: Constants.Images.speakerWaveTwoFilled.rawValue) else {
            return
        }
        guard let image_3 = UIImage(systemName: Constants.Images.speakerWaveThreeFilled.rawValue) else {
            return
        }
        images.append(image_1)
        images.append(image_2)
        images.append(image_3)
    }
    
    private func animateImageView() {
        imgView.animationImages = images
        imgView.animationDuration = 1
    }
}
