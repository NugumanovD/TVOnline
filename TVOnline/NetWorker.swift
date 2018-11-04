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
//    func getData(completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
//         let url = URL(string: Resource.mainURL)
//
//        URLSession.shared.dataTask(with: url!) { (data, _, error) in
//            completion(data, error)
//        }
//            task?.resume()
//        return task!
//    }
    
    
//    private func downloadFilm(completion: @escaping (_ weather: Data?, _ error: Error?) -> Void) {
//
//        URLSession.shared.dataTask(with: URL(string: URLs.mainUrl + Pagination.tenResults + Nationalities.US + "&inc=" + ExcludingFields.name + "," + ExcludingFields.email + "," + ExcludingFields.phone + "," + ExcludingFields.picture)!) { (data, _, error) -> Void in
//
//            guard let data = data else { return }
//
//            if let error = error {
//                print(error)
//                completion(nil, error)
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let loadUser = try decoder.decode(ResponseData.self, from: data)
//                print(loadUser)
//                completion(loadUser, nil)
//
//            } catch let err {
//                print(err)
//            }
//
//            } .resume()
    

    
//            guard let data = data else { return }
//
//            if let error = error {
//                print(error.localizedDescription)
//                completion(nil, error)
//                return
//            }
//
//            do {
//                let filmsItem = JSONDecoder()
//                let loadFilms = try filmsItem.decode(Data.self, from: data)
//                print(loadFilms)
//                completion(loadFilms, nil)
//
//            } catch let jsonError {
//                print(jsonError)
//            }
    
            
    
    
//    func getUser(tableView: UITableView) {
//        downloadUser { (ResponseData, error) in
//            DispatchQueue.main.async {
//                for i in 0..<ResponseData!.results.count {
//                    users.append((ResponseData?.results[i])!)
//                }
//                tableView.reloadData()
//            }
//        }
//    }
    
//    func loadData() {
//        guard let url = URL(string: Resource.mainURL) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//            guard let data = data else { return }
//            
//            do {
//                let filmsItem = try JSONDecoder().decode(Welcome.self, from: data)
//                items = filmsItem.results
//                print(self.items)
//                DispatchQueue.main.async {
//                    label.text = self.items[5].title
//                    configure(image: self.items[5].posterPath)
//                    
//                    print(items[5].id)
//                }
//            } catch let jsonError {
//                print(jsonError)
//            }
//            
//            
//            }.resume()
//    

}
