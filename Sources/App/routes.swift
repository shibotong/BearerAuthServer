import Vapor

func routes(_ app: Application) throws {
    let methods: [HTTPMethod] = [.GET, .POST, .PUT, .PATCH, .DELETE, .HEAD, .OPTIONS]
    
    for method in methods {
        app.on(method, "**") { req async throws in
            return try await req.ollamaRedirect()
        }
        
        app.on(method, "") { req async throws in
            return try await req.ollamaRedirect()
        }
    }
}

extension Request {
    func redirectURI() async -> URI {
        let baseURL = await Configuration.config.targetURL
        let redirectURL = "\(baseURL)\(self.url.path)"
        return URI(string: redirectURL)
    }
    
    func ollamaRedirect() async throws -> ClientResponse {
        return try await self.client.send(self.method, to: await redirectURI(), beforeSend: { try $0.content.encode(self.body.description) })
    }
}
