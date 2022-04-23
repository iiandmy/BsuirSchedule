//
//  Configs.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 22.04.22.
//

import Foundation

struct Configs {
    
    struct Network {
        
        static let bsuirApiBaseUrl: String = "https://iis.bsuir.by/api/v1/"
        static let bsuirApiGetFullSchedule: (String) -> String = { groupId in
            return "\(Configs.Network.bsuirApiBaseUrl)schedule?studentGroup=\(groupId)"
        }
        
    }
    
    struct Format {
        
        static let dateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter
        }()
        static let timeFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:MM"
            return formatter
        }()
        
    }
    
}