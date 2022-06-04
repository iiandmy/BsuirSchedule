//
//  Configs.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 22.04.22.
//

import Foundation
import UIKit

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
    
    struct Constants {
        static let minimumLineSpacing: CGFloat = 10
        static let rightDistanceToView: CGFloat = 20
        static let leftDistanceToView: CGFloat = 20
        static let dateCollectionItemWidth: CGFloat = (UIScreen.main.bounds.width - rightDistanceToView - leftDistanceToView - (minimumLineSpacing / 5)) / 5 * 0.95
        
    }
    
    struct Constraints {
        static let regularConstraint: CGFloat = 8
        static let regularLargeConstraint: CGFloat = 16
    }
    
}
