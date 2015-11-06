//
//  ImageController.swift
//  Timeline
//
//  Created by Eric Mead on 11/3/15.
//  Copyright © 2015 Eric Mead. All rights reserved.
//

import Foundation
import UIKit


class ImageController {
    
    static func uploadImage(image: UIImage, completion: (identifier: String?) -> Void) {
        
        if let base64Image = image.base64String {
            let base = FirebaseController.base.childByAppendingPath("images").childByAutoId()
            base.setValue(base64Image)
            
            completion(identifier: base.key)
        } else {
            completion(identifier: nil)
        }
 
        
        
    }
    
    static func imageForIdentifier(identifier: String, completion: (image: UIImage?) -> Void){
        
        FirebaseController.dataAtEndpoint("images/\(identifier)") { (data) -> Void in
            
            if let data = data as? String {
                let image = UIImage(base64: data)
                completion(image: image)
            }
        }
    }

        
}

extension UIImage {
    
    var base64String: String? {
        
        guard let data = UIImageJPEGRepresentation(self, 0.8) else {
            
            return nil
        }
        
        return data.base64EncodedStringWithOptions(.EncodingEndLineWithCarriageReturn)
    }
    
    convenience init?(base64: String) {
        
        if let imageData = NSData(base64EncodedString: base64, options: .IgnoreUnknownCharacters) {
            self.init(data: imageData)
        } else {
            return nil
        }
    }
}







//Add a static function uploadImage that takes an image and completion closure with an identifier String parameter
//note: We use an identifier for the image instead of a URL because we are uploading to Firebase. If we were uploading to Amazon S3 or other cloud service, we would probably return a URL instead of identifier.
//Implement a mock response by calling the completion closure with -K1l4125TYvKMc7rcp5e as the identifier
//Add a static function imageForIdentifier that takes an identifier and completion closure with an optional UIImage parameter
//Implement a mock response by returning a UIImage named "MockPhoto"
//Add a sample photo to the Assets.xcassets folder named MockPhoto for you to use as staged data.