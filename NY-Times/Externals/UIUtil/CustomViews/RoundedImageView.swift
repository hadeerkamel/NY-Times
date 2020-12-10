//
//  RoundedImageView.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

class RoundedImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        makeRoundedImage()
    }
    private func makeRoundedImage() {
        self.layer.cornerRadius = self.frame.height / 2.0
        self.clipsToBounds = true
    }
}
