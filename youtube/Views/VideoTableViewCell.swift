//
//  VideoTableViewCell.swift
//  youtube
//
//  Created by Stamatis Kouniaris on 2020-08-16.
//  Copyright © 2020 Stamatis Kouniaris. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        guard self.video != nil else {
            return
        }
        //set the title and date label
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //set the thumbnail
        guard self.video?.thumbnail != "" else {
            return
        }
        
        //check cache before downloading the data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            self.thumbnailImageView.image = UIImage(data: cachedData)
            
            return
        }
        
        //download the thumnail data
        let url = URL(string: self.video!.thumbnail)
        
        //get the shared session url object
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                //save the data in the cache
                
                CacheManager.setVideoCache(url!.absoluteString, data: data!)
                
                //Check that hte downloaded url matches the video url
                if url!.absoluteString != self.video!.thumbnail {
                    //url for the cell does not match the url for the video
                    return
                }
                //Create the image object
                let image = UIImage(data: data!)
                
                //and set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        dataTask.resume()
        
    }

}
