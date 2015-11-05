//
//  ProfileImageCollectionViewCell.swift
//  Timeline
//
//  Created by Eric Mead on 11/5/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import UIKit

class ProfileImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    func updateWithImageIdentifier(identifier: String){
        
        self.imageViewOutlet.image = nil
        
        ImageController.imageForIdentifier(identifier) { (image) -> Void in
            self.imageViewOutlet.image = image 
        }
    }
}
