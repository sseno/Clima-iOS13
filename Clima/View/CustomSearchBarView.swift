//
//  CustomSearchBarView.swift
//  Clima
//
//  Created by Rohmat Suseno on 12/02/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

class CustomSearchBarView: UIView {
    
    let searchBar: UISearchBar
    
    init(searchBar: UISearchBar) {
        self.searchBar = searchBar
        super.init(frame: .zero)
        addSubview(searchBar)
        setupSearchBar()
    }
    
    override convenience init(frame: CGRect) {
        self.init(searchBar: UISearchBar())
        self.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchBar.frame = bounds
    }
    
    private func setupSearchBar() {
        //custom your searchBar
    }
}
