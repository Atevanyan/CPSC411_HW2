//
//  ViewController.swift
//  HomeWork 2
//
//  Areg Tevanyan
//  cwid 890435167

import UIKit

class ViewController: UIViewController {

    var cService = ClaimService()
    var detailScreenGenerator: ClaimDetailScreenGenerator!
    
    var vals = [UITextField]()
    var title_val: String!
    var date_val: String!
    var status_val: String!

    
    @objc func addClaim(sender: UIButton) {
        print("\nAdd")
        title_val = detailScreenGenerator.vals[0].text!
        date_val = detailScreenGenerator.vals[1].text!

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        1. Create screen
        detailScreenGenerator = ClaimDetailScreenGenerator(v: view)
        print("Screen generator initialized")
        detailScreenGenerator.generate()
        

        cService.addClaim(cObj: Claim(this_ClaimTitle: "Claim Title" , this_Date: "Claim Date"))

        
//        3. Set the event handling
        let addBtn = detailScreenGenerator.addBtn
        addBtn?.addTarget(self, action: #selector(addClaim(sender:)), for: .touchUpInside)
    }
}

