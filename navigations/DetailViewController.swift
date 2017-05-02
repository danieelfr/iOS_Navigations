//
//  DetailViewController.swift
//  navigations
//
//  Created by Daniel on 4/24/17.
//  Copyright © 2017 DanielFR. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var turnZoomOnOff: UISwitch!
    
    var imgSelected: String?
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        scroll.maximumZoomScale = 4
        scroll.minimumZoomScale = 1
        scroll.zoomScale = 1
        
        image.image = UIImage(named: imgSelected!)
        image.sizeToFit()
        
    }
    
    override func viewWillLayoutSubviews() {
        
        scroll.contentSize = image.frame.size
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return image
    }
    
    @IBAction func changeValue(sender: UISlider) {
        
        scroll.zoomScale = CGFloat(slider.value)
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        slider.setValue(Float(scroll.zoomScale), animated: true)
    }
    
    @IBAction func turnOnOff(sender: AnyObject) {
        slider.enabled = turnZoomOnOff.on
        
        scroll.pinchGestureRecognizer?.enabled = turnZoomOnOff.on
        
        scroll.zoomScale = 1
    }

}
