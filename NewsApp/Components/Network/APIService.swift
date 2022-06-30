//
//  APIService.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import RxSwift

internal final class APIProvider {
    
    static func request<T: Decodable>(endpoint: Endpoint, response: T.Type) -> Observable<T> {
        guard let url = URL(string: endpoint.base + endpoint.path) else {
            let error = NSError(domain: "", code: 1000, userInfo: [ NSLocalizedDescriptionKey: "Invalid URL" ])
            return Observable.error(error)
        }
        
        let requestUrl = URLRequest(url: url)
        
        return Observable.create({ observer in
            URLSession.shared.dataTask(with: requestUrl) { data, _, error in
                if let error = error {
                    observer.onError(error)
                }
                
                guard let data = data else {
                    let error = NSError(domain: "", code: 1001, userInfo: [ NSLocalizedDescriptionKey: "Data Not Found" ])
                    observer.onError(error)
                    return
                }
                
                do {
                    let decode = try JSONDecoder().decode(response.self, from: data)
                    observer.onNext(decode)
                } catch {
                    let error = NSError(domain: "", code: 1002, userInfo: [ NSLocalizedDescriptionKey: "Failed to parse server response" ])
                    observer.onError(error)
                }
            }.resume()
            
            return Disposables.create()
        })
    }
    
}
