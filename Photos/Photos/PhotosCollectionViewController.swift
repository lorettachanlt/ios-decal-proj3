//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        
        self.collectionView?.backgroundColor = UIColor.clearColor();
        // FILL ME IN
    }

   
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        let currPhoto : Photo!;
        if (photos != nil) {
            currPhoto = photos[indexPath.section*3 + indexPath.item];
            loadImageForCell(currPhoto, imageView: cell.imageView)
            cell.backgroundColor = UIColor.clearColor();
        }
        return cell;
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 105, height: 105);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "viewFullImageSegue") {
            let viewController = segue.destinationViewController as! FullImageViewController
            let photo : Photo!;
            if (photos != nil) {
                let cell = sender as! UICollectionViewCell;
                
                let indexPath = self.collectionView!.indexPathForCell(cell)
                photo = photos[indexPath!.section*3 + indexPath!.item];
                let url = NSURL(string: photo.url)
                let data = NSData(contentsOfURL: url!)
                viewController.setUpLabels(photo.username, likes: String(photo.likes), image: UIImage(data: data!)!, createdtime: photo.createdtime);
            }
        }
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if (photos != nil) {
            return photos.count/3;
        }
        return 0;
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
   
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage.
    It then sets this as the imageView's image. */
    
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url)
        let data = NSData(contentsOfURL: url!)
        imageView.image = UIImage(data: data!)
        
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
        self.view.backgroundColor = UIColor.clearColor();
        self.collectionView?.backgroundColor = UIColor.clearColor()
    }
    
}

