//
//  MainViewController.swift
//  HW_3M_2L
//
//  Created by Sergey on 08/08/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func sendRequesButtonPressed() {
        
        let urlString = "https://itunes.apple.com/search?term=jack+johnson&limit=25."
        fetchFirstRequest(urlString: urlString)
    }
    
    @IBAction func sendSecondRequestButtonPressed() {
        let urlString = "https://api.github.com/users/ser8888"
        fetchSecondRequest(urlString: urlString)
    }

    
    private func fetchFirstRequest(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url)  { data, _, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            do {
                let track = try JSONDecoder().decode(Re, from: data)
                print(track)
                
            } catch let error {
                print("Failed to decode JSON", error)
                
            }
        }.resume()
    }
    
    private func fetchSecondRequest(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url)  { data, _, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            do {
                let resultOfRequest = try JSONDecoder().decode(Github.self, from: data)
                print(resultOfRequest)
                
            } catch let error {
                print("Failed to decode JSON", error)
                
            }
        }.resume()
    }
    
}

