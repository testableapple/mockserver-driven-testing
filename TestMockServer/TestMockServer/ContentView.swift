//
//  ContentView.swift
//  TestMockServer
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var usernameIdentifier: String = ""
    @State private var userCurrentStatus: String = "person.crop.circle.fill.badge.questionmark"
    @State private var userLoggedIn: String = "person.crop.circle.badge.checkmark.fill"
    
    var body: some View {
        Image(systemName: "gamecontroller.fill")
            .resizable()
            .frame(width: 120, height: 80, alignment: .center)
            .accessibility(identifier: "gamecontroller")
            .onTapGesture(perform: onTap)
        
        Label {
            Text(text)
                .font(.system(size: 36, weight: .bold, design: .monospaced))
        } icon: {
            Image(systemName: userCurrentStatus)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
        }
        .frame(width: 400, height: 200)
        .accessibility(identifier: usernameIdentifier)
    }
    
    func onTap() {
        let usersEndpoint = "/api/v2/users"
        let url = URL(string: apiUrl().absoluteString + usersEndpoint)!
        let task = URLSession.shared.dataTask(with:  url) {(data, response, error) in
            guard let data = data else { return }
            
            userCurrentStatus = userLoggedIn
            text = String(data: data, encoding: .utf8)?.json["first_name"] as! String
            usernameIdentifier = "username"
            print("\nGAME STARTED 🏈\n\(String(data: data, encoding: .utf8)!)")
        }
        task.resume()
    }
    
    //    THEN: original source code
    //    func apiUrl() -> URL {
    //        let urlString = "https://random-data-api.com"
    //        let url = URL(string: urlString)!
    //        return url
    //    }
        
    //    NOW: modified source code
    func apiUrl() -> URL {
        var urlString = "https://random-data-api.com"
        #if DEBUG
          if ProcessInfo.processInfo.arguments.contains("MOCK_SERVER") {
              urlString = "http://localhost:4567"
          }
        #endif
        let url = URL(string: urlString)!
        return url
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


