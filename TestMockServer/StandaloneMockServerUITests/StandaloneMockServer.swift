//
//  StandaloneMockServer.swift
//  StandaloneMockServer
//

import Foundation

final class StandaloneMockServer {
    
    private var host = "http://localhost"
    private var port: UInt16 = 4567
    
    func mockUsername(_ username: String) {
        sendRequest(endpoint: "/mock/users", body: ["username": username])
    }
    
    private func sendRequest(endpoint: String, body: [String: Any], method: String = "POST") {
        let urlString = "\(host):\(port)\(endpoint)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body.toString().data(using: .utf8)
        URLSession.shared.dataTask(with: request).resume()
    }
}
