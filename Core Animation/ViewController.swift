//
//  ViewController.swift
//  Core Animation
//
//  Created by Alex on 6/19/16.
//  Copyright © 2016 Alex Barcenas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // The tap button in the view.
    @IBOutlet weak var tap: UIButton!
    // The image view that will be used to display the penguin.
    var imageView: UIImageView!
    // The current animation that is being used.
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(sender: UIButton) {
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

}

