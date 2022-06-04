//
//  NetworkService.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 22.04.22.
//

import Foundation

class NetworkService {
    
    func getCurrentWeek(completion: @escaping (Int) -> Void) {
        guard let requestUrl = URL(string: Configs.Network.bsuirApiGetCurrentWeek) else { return }
        
        URLSession.shared.dataTask(with: requestUrl) { data, response, err in
            if let err = err {
                print(err)
            }
            
            guard let data = data else { return }
            completion(Int(String(data: data, encoding: .utf8)!)!)
        }.resume()
    }
    
    func getSchedule(forGroup group: String, completion: @escaping (Answer?) -> Void) {
        
        guard let requestUrl = URL(string: Configs.Network.bsuirApiGetFullSchedule(group)) else { return }
        
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: requestUrl) { data, response, err in
                
                if let err = err {
                    print(err)
                }
                
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let formatter = Configs.Format.dateFormat
                    decoder.dateDecodingStrategy = .formatted(formatter)
         
                    let schedule = try decoder.decode(Answer?.self, from: data)
                    completion(schedule)
                    
                } catch {
                    print(error)
                }
                
            }.resume()
        }
        
    }
    
}
