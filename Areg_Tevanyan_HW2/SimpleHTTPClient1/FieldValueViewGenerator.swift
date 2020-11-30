//
//  FieldValueViewGenerator.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/27/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class FieldValueViewGenerator {
    var lblName : String!
    var fieldValue : String!
    
    init(n : String, a : String) {
        lblName = n
        fieldValue = a
    }
    
    func generate() -> UIStackView {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 5
            
            let lbl = UILabel()
            lbl.text = lblName
            lbl.sizeToFit()
            stackView.addArrangedSubview(lbl)
            
            let val = UITextField()
            val.placeholder = fieldValue
            val.text = ""
            val.borderStyle = .roundedRect
            stackView.addArrangedSubview(val)
            
            return stackView
    }
}
