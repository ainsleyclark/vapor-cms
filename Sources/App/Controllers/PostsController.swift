import Fluent
import Vapor

struct PostsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let posts = routes.grouped("posts")
        posts.get(use: index)
        posts.post(use: create)
//        posts.group(":postID") { todo in
//            todo.delete(use: delete)
//        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Posts]> {
        return Posts.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Posts> {
        let posts = try req.content.decode(Posts.self)
        return posts.save(on: req.db).map { posts }
    }
    
    
    
//
//    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        return Posts.find(req.parameters.get("postID"), on: req.db)
//            .unwrap(or: Abort(.notFound))
//            .flatMap { $0.delete(on: req.db) }
//            .transform(to: .ok)
//    }
}
