//
//  PersonService.swift
//   HomeWork 2
//
//  Areg Tevanyan
//  cwid 890435167
//

import Foundation

struct Claim : Codable {
    var ClaimTitle : String
    var Date : String
    
    init(this_ClaimTitle: String, this_Date: String){
        ClaimTitle = this_ClaimTitle
        Date = this_Date
    }
}

class ClaimService {
    
    var claimList : [Claim] = [Claim]()

    
    func addClaim(cObj : Claim) {
        // Implement logic using Async HTTP client API (POST method)
        let requestUrl = "http://localhost:8020/PersonService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(cObj)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // type of resp is Data
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is \(respStr!)")
                //
            } else if let respError = error {
                print("Server Error : \(respError)")
            }
        }
        task.resume()
    }
    
    func getAll() {
        //var personList = [Person]()
        print("About to send HTTP request to server")
        let requestUrl = "http://localhost:8020/PersonService/getAll"
        let request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let respData = data {
                // data is of Data type
                //et respStr = String(data: respData, encoding: .utf8)
                //print("The response data is \(respStr!)")
                self.claimList = try! JSONDecoder().decode([Claim].self, from: respData)
                print("The CLaim List : \(self.claimList)")
                }
            }
        task.resume()
    }
}
