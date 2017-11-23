//
//  ModalStatusView.swift
//  ModalStatus
//
//  Created by Carlos Cortés Sánchez on 23/11/2017.
//  Copyright © 2017 Carlos Cortés Sánchez. All rights reserved.
//

import UIKit

public class ModalStatusView: UIView {

    @IBOutlet private weak var statusImage: UIImageView!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var subheadLabel: UILabel!
    
    let nibName = "ModalStatusView"
    var contentView: UIView!
    var timer: Timer?
    
    //MARK: Set up view
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        headlineLabel.text = ""
        subheadLabel.text = ""
    }
    
    public override func didMoveToSuperview() {
        // Add a timer to remove the view
        self.timer = Timer.scheduledTimer(
            timeInterval: TimeInterval(3.0),
            target: self,
            selector: #selector(self.removeSelf),
            userInfo: nil,
            repeats: false)
    }
    
    @objc private func removeSelf() {
        self.removeFromSuperview()
    }
    
    // Provide functions to update view
    
    public func set(image: UIImage) {
        self.statusImage.image = image
    }
    
    public func set(headline text: String) {
        self.headlineLabel.text = text
    }
    
    public func set(subhead text: String) {
        self.subheadLabel.text = text
    }
    
}
