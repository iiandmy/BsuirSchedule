//
//  NetworkService.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 22.04.22.
//

import Foundation

class NetworkService {
    
    func getSchedule(forGroup group: String, completion: @escaping (Schedule?) -> Void) {
        
        guard let requestUrl = URL(string: Configs.Network.bsuirApiGetFullSchedule(group)) else { return }
        
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: requestUrl) { data, response, err in
                
                if let err = err {
                    print(err)
                }
                
                guard let data = data else { return }
                print()
                
                do {
                    let decoder = JSONDecoder()
                    let formatter = Configs.Format.dateFormat
                    decoder.dateDecodingStrategy = .formatted(formatter)
         
                    let schedule = try decoder.decode(Schedule?.self, from: data)
                    completion(schedule)
                    
                } catch {
                    print(error)
                }
                
            }.resume()
        }
        
    }
    
}
