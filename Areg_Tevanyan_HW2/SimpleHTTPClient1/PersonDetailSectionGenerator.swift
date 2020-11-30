//
//  PersonDetailSectionGenerator.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/27/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class ClaimDetailSectionGenerator {

    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        //
        var vGenerator = FieldValueViewGenerator(n:"Claim Title", a:"Claim Title" )
        var sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        vGenerator = FieldValueViewGenerator(n:"Claim Date", a:"Claim Date")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        //vGenerator = FieldValueViewGenerator(n:"SSN")
        //sView = vGenerator.generate()
        //stackView.addArrangedSubview(sView)
        return stackView
    }
}
    
class buttonSectionGenerator {
        
    func generate() -> UIStackView {
            //
            let bStackView = UIStackView()
            bStackView.axis = .horizontal
            bStackView.distribution = .fill
            bStackView.spacing = 5
            let btn = UIButton()
            btn.setTitle("Add", for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.backgroundColor = UIColor.red
            bStackView.addArrangedSubview(btn)
            return bStackView
        }
    }

class ClaimStateSectionGenerator {
    //
    func generate() -> UIStackView {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 5
            var vGenerator: FieldValueViewGenerator!
            var sView: UIStackView!
        vGenerator = FieldValueViewGenerator(n: "state:", a: "Something happened" )
            sView = vGenerator.generate()
            stackView.addArrangedSubview(sView)
            return stackView
    }
}

class ClaimDetailScreenGenerator {
        
        var root : UIView!
        var detailSecView : UIStackView!
        var buttonSecView : UIStackView!
        var vals : [UITextField]!
        var lbls : [UILabel]!
        var addBtn : UIButton!
        
        init(v : UIView) {
            root = v
        }

        func setViewReference() {
            vals = [UITextField]()
            lbls = [UILabel]()
            //
            for sv in detailSecView.arrangedSubviews {  // 3 of them
                let innerStackView = sv as! UIStackView
                for ve in innerStackView.arrangedSubviews { // 2 of them
                    if ve is UITextField {
                        vals.append(ve as! UITextField)
                    } else {
                        lbls.append(ve as! UILabel)
                    }
                }
            }
            print("UITextField references created.")
            
            // Make UITextField readonly
            for v in vals {
                v.isUserInteractionEnabled = false
            }
            
            //
            for sv in buttonSecView.arrangedSubviews {
                let btn = sv as! UIButton
                if btn.titleLabel?.text == "Next" {
                   addBtn = btn
                }
            }
        }
        
        func setDetailSecConstraints() {
            for i in 0...lbls.count-1 {
                lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
                lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
            }
            let constr = lbls[0].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
            constr.isActive = true
            //
            for i in 0...lbls.count-1 {
                lbls[i].translatesAutoresizingMaskIntoConstraints = false
                let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[0].trailingAnchor)
                constr.isActive = true
            }
            //
            for i in 0...vals.count-1 {
                //vals[i].setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
                vals[i].setContentHuggingPriority(.defaultLow, for: .horizontal)
            }
            detailSecView.translatesAutoresizingMaskIntoConstraints = false
            let tCont = detailSecView.topAnchor.constraint(equalTo: root.safeAreaLayoutGuide.topAnchor)
            let lCont = detailSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
            let trCont = detailSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
            tCont.isActive = true
            lCont.isActive = true
            trCont.isActive = true
        }
        
        func setButtonSecConstraints() {
            buttonSecView.translatesAutoresizingMaskIntoConstraints = false
            let tpConst = buttonSecView.topAnchor.constraint(equalTo: detailSecView.bottomAnchor)
            let trConst = buttonSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
            tpConst.isActive = true
            trConst.isActive = true
        }
        
        func generate() {
            //
            detailSecView = ClaimDetailSectionGenerator().generate()
            print("Detail section was created. ")
            buttonSecView = buttonSectionGenerator().generate()
            print("Button section was created. ")
            root.addSubview(detailSecView)
            root.addSubview(buttonSecView)

            //
            setViewReference()
            print("setViewReference() called.")
            
            // set constraints for detailSecView
            setDetailSecConstraints()
            print("setDetailSecConstraints() called.")
            
            // set constraints for buttonSecView
            setButtonSecConstraints()
            print("setButtonSecConstraints() called.")
        }
}
