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
    let conditionImageView = UIImageView(image: UIImage(systemName: .init(stringLiteral: "sun.max")))
    var temperatureLabel = UILabel(text: "°C", font: .systemFont(ofSize: 90), textColor: .black)
    var numberLabel = UILabel(text: "22", font: .boldSystemFont(ofSize: 90), textColor: .black)
    var cityLabel = UILabel(text: "Yogyakarta", font: .systemFont(ofSize: 50), textColor: .black)
    var searchBar: UISearchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupViews()
    }
    
    private func setupNavBar() {
        searchBar.placeholder = "Search location"
        let searchBar = CustomSearchBarView(searchBar: self.searchBar)
        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 36)
        self.navigationItem.titleView = searchBar
        
        let locationImg = UIImage(systemName: .init(stringLiteral: "location.circle.fill"))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: locationImg, style: .plain, target: self, action: #selector(didTapLocation))
    }
    
    private func setupViews() {
        view.stack(backgroundImg)
        conditionImageView.tintColor = .black
        view.stack(conditionImageView.withWidth(120).withHeight(120),
                   view.hstack(numberLabel,temperatureLabel),
                   cityLabel,
                   UIView(),
                   spacing: 10,
                   alignment: .trailing)
            .withMargins(.init(top: 20, left: 20, bottom: 0, right: 20))
    }
    
    @objc private func didTapLocation() {
        //
    }
}
