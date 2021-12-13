// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import APIClient
import HTTPHeaders

public enum Paths {}

extension Paths {
    public static var pets: Pets {
        Pets(path: "/pets")
    }

    public struct Pets {
        /// Path: `/pets`
        public let path: String

        public func get(parameters: GetParameters? = nil) -> Request<[petstore_disable_comments.Pet]> {
            .get(path, query: parameters?.asQuery())
        }

        public enum GetResponseHeaders {
            public static let next = HTTPHeader<String>(field: "x-next")
        }

        public struct GetParameters {
            public var limit: Int?

            public init(limit: Int? = nil) {
                self.limit = limit
            }

            public func asQuery() -> [String: String?] {
                var query: [String: String?] = [:]
                query["limit"] = limit.map(QueryParameterEncoder.encode)
                return query
            }
        }

        public var post: Request<Void> {
            .post(path)
        }
    }
}

extension Paths.Pets {
    public func petID(_ petID: String) -> WithPetID {
        WithPetID(path: path + "/" + petID)
    }

    public struct WithPetID {
        /// Path: `/pets/{petId}`
        public let path: String

        public var get: Request<petstore_disable_comments.Pet> {
            .get(path)
        }
    }
}

private struct QueryParameterEncoder {
    static func encode(_ value: Bool) -> String? {
        value ? "true" : "false"
    }

    static func encode(_ value: Date) -> String? {
        ISO8601DateFormatter().string(from: value)
    }

    static func encode(_ value: Double) -> String? {
        String(value)
    }

    static func encode(_ value: Int) -> String? {
        String(value)
    }

    static func encode(_ value: String) -> String? {
        value
    }
}

