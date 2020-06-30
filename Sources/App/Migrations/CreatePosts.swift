import Fluent
import Vapor

extension Posts {
    struct Migration: Fluent.Migration {
        var name: String { "CreatePosts" }

        func prepare(on database: Database) -> EventLoopFuture<Void> {
            database.schema("posts")
                .id()
                .field("title", .string, .required)
                .field("slug", .string, .required)
                .field("status", .int8, .required)
                .field("content", .string, .required)
                .field("user_id", .int, .required)
                .field("category_id", .int)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }

        func revert(on database: Database) -> EventLoopFuture<Void> {
            database.schema("posts").delete()
        }
    }
}
