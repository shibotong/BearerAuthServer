//
//  File.swift
//  
//
//  Created by Shibo Tong on 24/7/2024.
//

import Vapor

struct BearerAuthMiddleWare: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        guard let bearerToken = request.headers.bearerAuthorization?.token else {
            throw Abort(.unauthorized, reason: "A bearer token is required")
        }
        guard tokens.contains(bearerToken) else {
            throw Abort(.unauthorized, reason: "Invalid token")
        }
        
        return try await next.respond(to: request)
    }
}

let tokens: [String] = [
    "sk-ollama-bcd373bc7ac8a87779df02b735018d73",
    "sk-ollama-7ca4d727455b829cb4ba0bce5208719d"
]
