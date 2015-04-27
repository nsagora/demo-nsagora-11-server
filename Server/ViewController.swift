//
//  ViewController.swift
//  Server
//
//  Created by Ilinca on 16/04/2015.
//  Copyright (c) 2015 iosnsagora. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var server: HttpServer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let server = demoServer()
        self.server = server
        var error: NSError?
        if !server.start(error: &error) {
            println("Server start error: \(error)")
        }
    }

    func demoServer() -> HttpServer {
        let server = HttpServer()
        
        let ionel = ["name":"Ionel Lescai",
            "pictureUrl":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/c32.32.398.398/s160x160/1918959_1338964632975_6235500_n.jpg?oh=e22d7e44b84158f90c36a752f5fc375e&oe=55DD72CA&__gda__=1436386679_445724cc49787977283053bf9ff42eac"
        ]
        
        let users = [
            ionel,
            ["name":"Alex Cristea",
                "pictureUrl":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/p160x160/10478561_1009031509122611_2864428556522930977_n.jpg?oh=cb6202b1436e0b05e2c5336b2717aba1&oe=55A5535E&__gda__=1437333340_1283d4f90c57e061c7149c3b074fc0e6"
            ],
        ]
        
        server["/me"] = { request in
            return .OK(.JSON(ionel))
            
        }
        
        server["/users"] = { request in
            return .OK(.JSON(users))
        }
        
        return server
    }

}

