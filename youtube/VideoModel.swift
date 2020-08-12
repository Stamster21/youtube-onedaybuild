//
//  VideoModel.swift
//  youtube
//
//  Created by Stamatis Kouniaris on 2020-08-12.
//  Copyright © 2020 Stamatis Kouniaris. All rights reserved.
//

import Foundation


class VideoModel {
    
    func getVideos() {
        
        //Create a url object
        let url  = URL(string: Constants.API_URL)
        
        // This may be nil therefore we need to guard against it.
        guard url != nil else {
            return
        }
        
        //Get a url session object .  This does all the networking stuff.
        let session = URLSession.shared
        
        //Get a datatask and this represents a single call to the API.
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            //check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
            //parsing the data to video objects
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
                 
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                
            }

            
        }
        
        //kick off the datatask and I nthink this is datatask.resume()
        datatask.resume()
    }
}
