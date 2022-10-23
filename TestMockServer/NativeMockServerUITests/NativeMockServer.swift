//
//  NativeMockServer.swift
//  NativeMockServer
//

import Foundation
import Swifter

final class NativeMockServer {
    
    private var server = HttpServer()
    private var port: UInt16 = 4567
    private var username = ""
    
    func start() {
        configure()
        try! server.start(port)
        print("Server status: \(server.state). Port: \(port)")
    }
    
    func stop() {
        server.stop()
    }
    
    private func configure() {
        server["/api/v2/users"] = { [self] _ in
            var response = readData(fromFile: "users")
            response["first_name"] = username
            return .ok(.json(response))
        }
    }
    
    private func readData(fromFile name: String, ext: String = "json") -> [String: Any] {
        let bundle = Bundle(for: NativeMockServer.self)
        let url = bundle.url(forResource: name, withExtension: ext)!
        let data = try! Data(contentsOf: url)
        return String(bytes: data, encoding: .utf8)!.json
    }
    
    func mockUsername(_ username: String) {
        self.username = username
    }
}
