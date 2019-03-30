//
//  ViewController.swift
//  weather
//
//  Created by Dustin Knopoff on 3/21/19.
//  Copyright © 2019 Dustin Knopoff. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var currentTempLabel: UILabel!
    @IBOutlet private weak var umbrellaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make your own free API key with Dark sky at darksky.net
//        guard let weatherUrl = URL(string: Constants.Networking.weatherURL) else { return }
//        let urlSession = URLSession(configuration: .default)
//        urlSession.dataTask(with: weatherUrl) { (data, response, error) in
//            let rootWeather = try! JSONDecoder().decode(RootWeather.self, from: data!)
//            let currentWeather = rootWeather.currently
//            self.currentTempLabel.text = " \(currentWeather.temperature)℉"
////            if currentWeather.precipProbability > 0.5 {
////                self.umbrellaLabel.text = "☔️"
////            } else {
////                self.umbrellaLabel.text = "🌂"
////            }
//            self.currentTempLabel.text = currentWeather.precipProbability > 0.5 ?  "☔️" : "🌂"
//        }.resume()
        
        alternativeWeatherFetching()
        
    }

    private func alternativeWeatherFetching() {
        Networking.getWeather(request: DarkSkyRouter.basic) { result in
            switch result {
            case .failure(let error):
                print(" you got an error \(error)")
            case .success(let rootWeather):
                print("here is your root weather \(rootWeather)")
            }
        }
    }
}

