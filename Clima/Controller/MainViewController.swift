//
//  MainViewController.swift
//  Clima
//
//  Created by Rohmat Suseno on 11/02/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import LBTATools

class MainViewController: UIViewController {
    
    let backgroundImg = UIImageView(image: UIImage(named: "background"), contentMode: .scaleAspectFill)
    let conditionImg = UIImageView(image: UIImage(systemName: .init(stringLiteral: "sun.max")))
    let temperatureLabel = UILabel(text: "°C", font: .systemFont(ofSize: 90), textColor: .label)
    var numberLabel = UILabel(text: "22", font: .boldSystemFont(ofSize: 90), textColor: .label)
    var cityLabel = UILabel(text: "Yogyakarta", font: .systemFont(ofSize: 30), textColor: .label)
    let searchBar: UISearchBar = UISearchBar()
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupViews()
        weatherManager.delegate = self
    }
    
    private func setupNavBar() {
        // setup searchBar
        searchBar.delegate = self
        searchBar.placeholder = "Search location"
        searchBar.autocapitalizationType = .words
        searchBar.returnKeyType = .go
        let searchBarView = CustomSearchBarView(searchBar: searchBar)
        searchBarView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 36)
        self.navigationItem.titleView = searchBarView
        
        let locationImg = UIImage(systemName: .init(stringLiteral: "location.fill"))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: locationImg, style: .plain, target: self, action: #selector(didTapLocation(_:)))
    }
    
    private func setupViews() {
        view.stack(backgroundImg)
        conditionImg.contentMode = .scaleAspectFit
        conditionImg.tintColor = .label
        view.stack(conditionImg.withWidth(120).withHeight(120),
                   view.hstack(numberLabel,temperatureLabel),
                   cityLabel,
                   UIView(),
                   spacing: 10,
                   alignment: .trailing)
            .withMargins(.init(top: 20, left: 20, bottom: 0, right: 20))
    }
    
    @objc private func didTapLocation(_ sender: UIBarButtonItem) {
        //
    }
}

// MARK: - SearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let city = searchBar.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchBar.text = ""
    }
}

// MARK: - WeatherManagerDelegate
extension MainViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.conditionImg.image = UIImage(systemName: .init(stringLiteral: weather.conditionName))
            self.numberLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailedWithError(error: Error) {
        print(error)
    }
}

#if DEBUG
import SwiftUI
struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(.init(stringLiteral: "iPhone 11 Pro"))
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, .light)
            ContentView()
                .previewDevice(.init(stringLiteral: "iPhone XR"))
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, .dark)
        }
    }
    
    struct ContentView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainViewController_Previews.ContentView>) -> UIViewController {
            return UINavigationController(rootViewController: MainViewController())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MainViewController_Previews.ContentView>) {
            
        }
    }
}
#endif
