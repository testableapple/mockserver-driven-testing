//
//  StandaloneMockServer.swift
//  StandaloneMockServer
//

import Foundation

final class StandaloneMockServer {
    
    private var host = "http://localhost"
    private var port = 4567
    
    func mockUsername(_ username: String) {
        sendRequest(endpoint: "/mock/user", body: ["username": username])
    }
    
    private func sendRequest(endpoint: String, body: [String: Any]) {
        let urlString = "\(host):\(port)\(endpoint)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body.toString().data(using: .utf8)
        URLSession.shared.dataTask(with: request).resume()
    }
}
