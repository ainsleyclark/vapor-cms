import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let postsController = PostsController();
    
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("getpost", use: postsController.index)
    app.post("savepost", use: postsController.create)

    //try app.register(collection: TodoController())
}
