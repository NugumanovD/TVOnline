//
//  NetWorker.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/3/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation

class NetWorker {
    
    var task: URLSessionDataTask?
   
    @discardableResult
    func loadData(completion: @escaping (Data?, Error?) -> Void) -> URLSessionTask {
        let pageArray = ["1", "2", "3", "4"]
        
//        let url = URL(string: Resource.mainURL)
        let url = URL(string: Global.url + Global.APIKey + "&page=" + pageArray[1])
        
//        let request = URLRequest(url: url!)
        let request = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 1)
//        print(request)
        
        let responseBlock: (Data?, URLResponse?, Error?) -> Void = {data, response, error in
            self.task = nil
            completion(data, error)
        }
        task = URLSession.shared.dataTask(with: request, completionHandler: responseBlock)
        
        task?.resume()
        return task!
    }
}
