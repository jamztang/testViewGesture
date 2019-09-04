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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var trackingView: TrackingView!
    @IBOutlet weak var indicatorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackingView.delegate = self
        scrollView.delegate = self
        scrollView.contentSize = indicatorView.bounds.size
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 3.0
//        scrollView.zoomScale = 0.1

        panGestureRecognizer.delegate = self
        scrollView.panGestureRecognizer.addTarget(self, action: #selector(handleScrollGesture))
        scrollView.pinchGestureRecognizer?.addTarget(self, action: #selector(handlePinchGesture))
    
//        let hover = UIHoverGestureRecognizer(target: self, action: #selector(hovering(_:)))
//        trackingView.addGestureRecognizer(hover)
        trackingView.addGestureRecognizer(scrollView.panGestureRecognizer)
        if let pinchGesture = scrollView.pinchGestureRecognizer {
            trackingView.addGestureRecognizer(pinchGesture)
        }
    }

    @objc
    func hovering(_ recognizer: UIHoverGestureRecognizer) {
        switch recognizer.state {
        case .began, .changed:
            Swift.print("hovering \(recognizer.location(in: trackingView))")
            indicatorView.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        case .ended:
            indicatorView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        default:
            break
        }
    }

    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        Swift.print("pan \(recognizer.location(in: trackingView))")
    }
    
    @objc func handleScrollGesture(_ recognizer: UIPanGestureRecognizer) {
        Swift.print("scroll \(recognizer.location(in: trackingView))")
    }
    @objc func handlePinchGesture(_ recognizer: UIPanGestureRecognizer) {
        Swift.print("pinch \(recognizer.location(in: trackingView))")
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    
}

extension ViewController: TrackingViewDelegate {
    func trackingViewDidLeftClick(_ trackingView: UIView) {
        Swift.print("trackingViewDidLeftClick")
    }
    func trackingViewDidRightClick(_ trackingView: UIView) {
        Swift.print("trackingViewDidRightClick")
//        UIMenuController.shared.showMenu(from: self.trackingView, rect: CGRect(x: 100, y: 100, width: 100, height: 100))
    }
}

extension ViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        Swift.print("scroll \(scrollView.contentOffset)")
//    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        Swift.print("zoom \(scrollView.zoomScale)")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return indicatorView
    }
}
