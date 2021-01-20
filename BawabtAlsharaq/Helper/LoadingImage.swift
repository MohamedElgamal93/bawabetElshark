//
//  LoadingImage.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class MyIndicator: UIView {

  let imageView = UIImageView()

    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)

        imageView.frame = bounds
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(imageView)
    }

    required init(coder: NSCoder) {
        fatalError()
    }

    func startAnimating() {
        isHidden = false
        rotate()
    }

    func stopAnimating() {
        isHidden = true
        removeRotation()
    }

    private func rotate() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 10
        self.imageView.layer.add(flash, forKey: "opacity")
    }

    private func removeRotation() {
         self.imageView.layer.removeAnimation(forKey: "opacity")
    }
    
    
}
