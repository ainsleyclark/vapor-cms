import Fluent
import FluentMySQLDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "127.0.0.1",
        username: Environment.get("DATABASE_USERNAME") ?? "root",
        password: Environment.get("DATABASE_PASSWORD") ?? "password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_cms",
        tlsConfiguration: nil
    ), as: .mysql)
    
    let hostName = Environment.get("DATABASE_HOST") ?? "localhost"
    let username = Environment.get("DATABASE_USERNAME") ?? "vapor_username"
    let password = Environment.get("DATABASE_PASSWORD") ?? "vapor_password"
    let database = Environment.get("DATABASE_NAME") ?? "vapor_database"
    
    print(hostName, username, password, database)

    app.migrations.add(User.Migration())
    app.migrations.add(Posts.Migration())

    // register routes
    try routes(app)
}
