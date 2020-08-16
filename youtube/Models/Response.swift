//
//  Response.swift
//  youtube
//
//  Created by Stamatis Kouniaris on 2020-08-12.
//  Copyright © 2020 Stamatis Kouniaris. All rights reserved.
//

import Foundation


struct Response: Decodable {
    
    var items:[Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
}
}
