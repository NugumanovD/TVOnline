//
//  NetWorker.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/3/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation

class NetworkManager {
    var items = [Result]()
    var task: URLSessionDataTask?
    
    @discardableResult
    func loadData(completion: @escaping (URL, Data?, Error?) -> Void) -> URLSessionTask {
        
        let url = URL(string: Global.url + Global.APIKey)
        let request = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 1)
        let responseBlock: (Data?, URLResponse?, Error?) -> Void = {data, response, error in
            self.task = nil
            completion(url!, data, error)
        }
        task = URLSession.shared.dataTask(with: request, completionHandler: responseBlock)
        task?.resume()
        return task!
    }
    
    func load() {
        let downLoadData: (URL, Data?, Error?) -> Void = {url, data, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            let filmItems = try? JSONDecoder().decode(TheMovieDB.self, from: data)
            self.items = (filmItems?.results)!
        }
        self.loadData(completion: downLoadData)
    }
}
