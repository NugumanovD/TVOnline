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
    func swiftBookRequest(completion: @escaping (Data?, Error?) -> Void) -> URLSessionTask {
        
        let url = URL(string: Resource.mainURL)
        let request = URLRequest(url: url!)
        
        let responseBlock: (Data?, URLResponse?, Error?) -> Void = {data, response, error in
            self.task = nil
            completion(data, error)
        }
        task = URLSession.shared.dataTask(with: request, completionHandler: responseBlock)
        
        task?.resume()
        return task!
    }
}
