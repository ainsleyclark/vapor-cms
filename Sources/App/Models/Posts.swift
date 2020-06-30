import Fluent
import Vapor

final class Posts: Model, Content {
    static let schema = "posts"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "slug")
    var slug: String

    @Field(key: "status")
    var status: Int8
    
    @Field(key: "content")
    var content: String
    
    @Field(key: "user_id")
    var user_id: Int
    
    @Field(key: "category_id")
    var category_id: Int
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}

