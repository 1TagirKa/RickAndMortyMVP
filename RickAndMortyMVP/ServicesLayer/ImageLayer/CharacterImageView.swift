//
//  CharacterImageView.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 05.06.2022.
//

import Foundation
import UIKit

class CharacterImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let imageURL = URL(string: url) else {
            image = UIImage(named: "picture")
            return
        }
        

        
        ImageManager.shared.fetchImage(from: imageURL) { (data, response) in
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            self.saveDataToCache(with: data, and: response)
        }
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponse.data)
        }
        
        return nil
    }
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let urlRequest = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
