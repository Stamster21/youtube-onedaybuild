//
//  Constants.swift
//  youtube
//
//  Created by Stamatis Kouniaris on 2020-08-12.
//  Copyright © 2020 Stamatis Kouniaris. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyC1url5CS8EkAAftdlh8ODjx75vGRxAdqw"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
