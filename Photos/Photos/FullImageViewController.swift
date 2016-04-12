//
//  FullImageViewController.swift
//  Photos
//
//  Created by loretta chan on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class FullImageViewController: UIViewController {
   
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var heartButton: UIButton!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    var username: String!
    var createdtime: Int!
    var likes: String!
    var image: UIImage!
    var clicked = 0;
    
    
    func setUpLabels(username: String, likes:String, image: UIImage, createdtime:String) {
        self.username = username;
        self.likes = likes;
        self.image = image;
        self.createdtime = Int(createdtime);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image;
        usernameLabel.text = username;
        likesLabel.text = likes + " likes";
        let createdTimeInterval = NSTimeInterval(createdtime)
        let date = NSDate(timeIntervalSince1970:createdTimeInterval)
        let dateFormatter = NSDateFormatter();
        let theDateFormat = NSDateFormatterStyle.ShortStyle
        let theTimeFormat = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = theDateFormat
        dateFormatter.timeStyle = theTimeFormat

        dateLabel.text = dateFormatter.stringFromDate(date)

    }
    
    @IBAction func tick(sender: UIButton) {
        print(sender.imageView?.image)
        if (clicked == 0) {
            sender.setImage(UIImage(named:"heartfilled.png"), forState: .Normal)
            clicked = 1;
        } else {
            sender.setImage( UIImage(named:"heart.png"), forState:  .Normal)
            clicked = 0;
        }
    }
    
   
}