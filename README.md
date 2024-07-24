# BearerAuthServer

BearerAuthServer is a Swift-based service that provides a bearer authentication layer for your applications. It is dockerized for easy deployment and scalability.

## Features

- **Bearer Authentication:** Secure authentication mechanism using bearer tokens.
- **Swift Implementation:** Written in Swift for performance and reliability.
- **Dockerized:** Easily deployable using Docker containers.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Docker installed on your machine.
- Basic understanding of Swift and Docker.

## Getting Started

To get a local copy up and running follow these simple steps.

### Usage
#### TL;DR
`docker run -d --name=ollama-auth -p [PORT]:8080 -v [/path/to/file]:/BearerAuth --restart=always shibotong/bearer-auth-server:v1.0.0`
