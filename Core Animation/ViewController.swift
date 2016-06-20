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

    /*
     * Function Name: viewDidLoad
     * Parameters: None
     * Purpose: This method adds a penguin to the view that the user can manipulate.
     * Return Value: None
     */
    
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

    /*
     * Function Name: tapped
     * Parameters: sender - the button that called this method.
     * Purpose: This method hides the button until an animation has been fully executed.
     *   The method chooses animations sequentially based on a counter.
     * Return Value: None
     */
    
    @IBAction func tapped(sender: AnyObject) {
        tap.hidden = true
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],
        //UIView.animateWithDuration(1, delay: 0, options: [],
                                   animations: { [unowned self] in
                                    switch self.currentAnimation {
                                    // Scale the penguin up.
                                    case 0:
                                        self.imageView.transform = CGAffineTransformMakeScale(2, 2)
                                    // Reset the penguin.
                                    case 1:
                                        self.imageView.transform = CGAffineTransformIdentity
                                    // Move the penguin.
                                    case 2:
                                        self.imageView.transform = CGAffineTransformMakeTranslation(-256, -256)
                                    // Reset the penguin.
                                    case 3:
                                        self.imageView.transform = CGAffineTransformIdentity
                                    // Rotate the pengin 180 degrees.
                                    case 4:
                                        self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                                    // Reset the penguin.
                                    case 5:
                                        self.imageView.transform = CGAffineTransformIdentity
                                    // Change the tranparency and background color of the penguin.
                                    case 6:
                                        self.imageView.alpha = 0.1
                                        self.imageView.backgroundColor = UIColor.greenColor()
                                    // Reset the penguin.
                                    case 7:
                                        self.imageView.alpha = 1
                                        self.imageView.backgroundColor = UIColor.clearColor()
                                    // Do nothing.
                                    default:
                                        break
                                    }
        }) { [unowned self] (finished: Bool) in
            self.tap.hidden = false
        }
        
        currentAnimation += 1
        // Reset the counter.
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

}

