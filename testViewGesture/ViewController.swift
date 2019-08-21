//
//  ViewController.swift
//  testViewGesture
//
//  Created by James Tang on 21/8/2019.
//  Copyright © 2019 James Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    @IBOutlet weak var trackingView: TrackingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGestureRecognizer.delegate = self
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
    }
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        Swift.print("pan \(recognizer.location(in: trackingView))")
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    
}
