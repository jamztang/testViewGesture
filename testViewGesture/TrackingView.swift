//
//  TrackingView.swift
//  testViewGesture
//
//  Created by James Tang on 21/8/2019.
//  Copyright © 2019 James Tang. All rights reserved.
//

import UIKit

protocol TrackingViewDelegate: class {
    func trackingViewDidLeftClick(_ trackingView: UIView)
    func trackingViewDidRightClick(_ trackingView: UIView)
}

class TrackingView: UIView {

    weak var delegate: TrackingViewDelegate?
    
    private var touchDidBegin: Bool = false

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchDidBegin = true
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let delegate = delegate else {
            return
        }
        
        if touchDidBegin {
            delegate.trackingViewDidLeftClick(self)
        } else {
            delegate.trackingViewDidRightClick(self)
        }
        touchDidBegin = false
    }

}
