import Vapor

func routes(_ app: Application) throws {
    app.get("**") { req async throws in
        return try await req.ollamaRedirect()
    }
    
    app.post("**") { req async throws in
        return try await req.ollamaRedirect()
    }
    
    app.delete("**") { req async throws in
        return try await req.ollamaRedirect()
    }
    
    app.get("") { req async throws in
        return try await req.ollamaRedirect()
    }
}

let baseURL = "http://192.168.1.143:11434"

extension Request {
    var redirectURI: URI {
        let redirectURL = "\(baseURL)\(self.url.path)"
        return URI(string: redirectURL)
    }
    
    func ollamaRedirect() async throws -> ClientResponse {
        return try await self.client.send(self.method, to: redirectURI, beforeSend: { try $0.content.encode(self.body.description) })
    }
}
