//
//  ViewController.swift
//  youtube
//
//  Created by Stamatis Kouniaris on 2020-08-07.
//  Copyright © 2020 Stamatis Kouniaris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = VideoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
    }


}

