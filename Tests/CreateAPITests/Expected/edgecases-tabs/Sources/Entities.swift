// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public struct Order: Codable {
	public var id: Int?
	public var petID: Int?
	public var quantity: Int?
	public var shipDate: Date?
	/// Order Status
	public var status: Status?
	public var isComplete: Bool?

	/// Order Status
	public enum Status: String, Codable, CaseIterable {
		case placed
		case approved
		case delivered
	}

	public init(id: Int? = nil, petID: Int? = nil, quantity: Int? = nil, shipDate: Date? = nil, status: Status? = nil, isComplete: Bool? = nil) {
		self.id = id
		self.petID = petID
		self.quantity = quantity
		self.shipDate = shipDate
		self.status = status
		self.isComplete = isComplete
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case petID = "petId"
		case quantity
		case shipDate
		case status
		case isComplete = "complete"
	}
}

public struct Category: Codable {
	public var id: Int?
	public var name: String?

	public init(id: Int? = nil, name: String? = nil) {
		self.id = id
		self.name = name
	}
}

public struct User: Codable {
	public var id: Int?
	public var username: String?
	public var firstName: String?
	public var lastName: String?
	public var email: String?
	public var password: String?
	public var phone: String?
	/// User Status
	public var userStatus: Int?

	public init(id: Int? = nil, username: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, password: String? = nil, phone: String? = nil, userStatus: Int? = nil) {
		self.id = id
		self.username = username
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
		self.password = password
		self.phone = phone
		self.userStatus = userStatus
	}
}

public struct Tag: Codable {
	public var id: Int?
	public var name: String?

	public init(id: Int? = nil, name: String? = nil) {
		self.id = id
		self.name = name
	}
}

public struct Pet: Codable {
	public var id: Int?
	public var category: Category?
	/// Example: "doggie"
	public var name: String
	public var photoURLs: [String]
	public var tags: [Tag]?
	/// Pet status in the store
	public var status: Status?

	/// Pet status in the store
	public enum Status: String, Codable, CaseIterable {
		case available
		case pending
		case sold
	}

	public init(id: Int? = nil, category: Category? = nil, name: String, photoURLs: [String], tags: [Tag]? = nil, status: Status? = nil) {
		self.id = id
		self.category = category
		self.name = name
		self.photoURLs = photoURLs
		self.tags = tags
		self.status = status
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case category
		case name
		case photoURLs = "photoUrls"
		case tags
		case status
	}
}

public struct APIResponse: Codable {
	public var code: Int?
	public var type: String?
	public var message: String?

	public init(code: Int? = nil, type: String? = nil, message: String? = nil) {
		self.code = code
		self.type = type
		self.message = message
	}
}

/// Model for testing reserved words
public struct Return: Codable {
	public var `return`: Int?

	public init(`return`: Int? = nil) {
		self.return = `return`
	}

	private enum CodingKeys: String, CodingKey {
		case `return` = "return"
	}
}

/// Model for testing model name same as property name
public struct Name: Codable {
	public var name: Int
	public var snakeCase: Int?
	public var property: String?
	public var _123Number: Int?

	public init(name: Int, snakeCase: Int? = nil, property: String? = nil, _123Number: Int? = nil) {
		self.name = name
		self.snakeCase = snakeCase
		self.property = property
		self._123Number = _123Number
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case snakeCase = "snake_case"
		case property
		case _123Number = "123Number"
	}
}

/// Model for testing model name starting with number
public struct _200Response: Codable {
	public var name: Int?
	public var `class`: String?

	public init(name: Int? = nil, `class`: String? = nil) {
		self.name = name
		self.class = `class`
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case `class` = "class"
	}
}

/// Model for testing model with "_class" property
public struct ClassModel: Codable {
	public var `class`: String?

	public init(`class`: String? = nil) {
		self.class = `class`
	}

	private enum CodingKeys: String, CodingKey {
		case `class` = "_class"
	}
}

public struct Dog: Codable {
	public var animal: Animal
	public var breed: String?

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.animal = try Animal(from: decoder)
		self.breed = try values.decodeIfPresent(String.self, forKey: "breed")
	}

	public func encode(to encoder: Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encode(animal, forKey: "animal")
		try values.encodeIfPresent(breed, forKey: "breed")
	}
}

public struct Cat: Codable {
	public var animal: Animal
	public var isDeclawed: Bool?

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: StringCodingKey.self)
		self.animal = try Animal(from: decoder)
		self.isDeclawed = try values.decodeIfPresent(Bool.self, forKey: "declawed")
	}

	public func encode(to encoder: Encoder) throws {
		var values = encoder.container(keyedBy: StringCodingKey.self)
		try values.encode(animal, forKey: "animal")
		try values.encodeIfPresent(isDeclawed, forKey: "declawed")
	}
}

public struct Animal: Codable {
	public var className: String
	public var color: String?

	public init(className: String, color: String? = nil) {
		self.className = className
		self.color = color
	}
}

public struct FormatTest: Codable {
	public var integer: Int?
	public var int32: Int?
	public var int64: Int?
	public var number: Double
	public var float: Double?
	public var double: Double?
	public var string: String?
	public var byte: String
	public var binary: String?
	public var date: NaiveDate
	public var dateTime: Date?
	public var uuid: String?
	public var password: String

	public init(integer: Int? = nil, int32: Int? = nil, int64: Int? = nil, number: Double, float: Double? = nil, double: Double? = nil, string: String? = nil, byte: String, binary: String? = nil, date: NaiveDate, dateTime: Date? = nil, uuid: String? = nil, password: String) {
		self.integer = integer
		self.int32 = int32
		self.int64 = int64
		self.number = number
		self.float = float
		self.double = double
		self.string = string
		self.byte = byte
		self.binary = binary
		self.date = date
		self.dateTime = dateTime
		self.uuid = uuid
		self.password = password
	}
}

public enum EnumClass: String, Codable, CaseIterable {
	case abc = "_abc"
	case minusefg = "-efg"
	case xyz = "(xyz)"
}

public struct EnumTest: Codable {
	public var enumString: EnumString?
	public var enumInteger: Int?
	public var enumNumber: Double?
	public var outerEnum: OuterEnum?

	public enum EnumString: String, Codable, CaseIterable {
		case upper = "UPPER"
		case lower
	}

	public init(enumString: EnumString? = nil, enumInteger: Int? = nil, enumNumber: Double? = nil, outerEnum: OuterEnum? = nil) {
		self.enumString = enumString
		self.enumInteger = enumInteger
		self.enumNumber = enumNumber
		self.outerEnum = outerEnum
	}

	private enum CodingKeys: String, CodingKey {
		case enumString = "enum_string"
		case enumInteger = "enum_integer"
		case enumNumber = "enum_number"
		case outerEnum
	}
}

public struct AdditionalPropertiesClass: Codable {
	public var mapProperty: [String: String]?
	public var mapOfMapProperty: [String: [String: String]]?

	public init(mapProperty: [String: String]? = nil, mapOfMapProperty: [String: [String: String]]? = nil) {
		self.mapProperty = mapProperty
		self.mapOfMapProperty = mapOfMapProperty
	}

	private enum CodingKeys: String, CodingKey {
		case mapProperty = "map_property"
		case mapOfMapProperty = "map_of_map_property"
	}
}

public struct MixedPropertiesAndAdditionalPropertiesClass: Codable {
	public var uuid: String?
	public var dateTime: Date?
	public var map: [String: Animal]?

	public init(uuid: String? = nil, dateTime: Date? = nil, map: [String: Animal]? = nil) {
		self.uuid = uuid
		self.dateTime = dateTime
		self.map = map
	}
}

public struct List: Codable {
	public var _123List: String?

	public init(_123List: String? = nil) {
		self._123List = _123List
	}

	private enum CodingKeys: String, CodingKey {
		case _123List = "123-list"
	}
}

public struct Client: Codable {
	public var client: String?

	public init(client: String? = nil) {
		self.client = client
	}
}

public struct ReadOnlyFirst: Codable {
	public var bar: String?
	public var baz: String?

	public init(bar: String? = nil, baz: String? = nil) {
		self.bar = bar
		self.baz = baz
	}
}

public struct HasOnlyReadOnly: Codable {
	public var bar: String?
	public var foo: String?

	public init(bar: String? = nil, foo: String? = nil) {
		self.bar = bar
		self.foo = foo
	}
}

public struct Capitalization: Codable {
	public var smallCamel: String?
	public var capitalCamel: String?
	public var smallSnake: String?
	public var capitalSnake: String?
	public var sCAETHFlowPoints: String?
	/// Name of the pet
	/// 
	public var attName: String?

	public init(smallCamel: String? = nil, capitalCamel: String? = nil, smallSnake: String? = nil, capitalSnake: String? = nil, sCAETHFlowPoints: String? = nil, attName: String? = nil) {
		self.smallCamel = smallCamel
		self.capitalCamel = capitalCamel
		self.smallSnake = smallSnake
		self.capitalSnake = capitalSnake
		self.sCAETHFlowPoints = sCAETHFlowPoints
		self.attName = attName
	}

	private enum CodingKeys: String, CodingKey {
		case smallCamel
		case capitalCamel = "CapitalCamel"
		case smallSnake = "small_Snake"
		case capitalSnake = "Capital_Snake"
		case sCAETHFlowPoints = "SCA_ETH_Flow_Points"
		case attName = "ATT_NAME"
	}
}

public struct MapTest: Codable {
	public var mapMapOfString: [String: [String: String]]?
	public var mapOfEnumString: [String: MapOfEnumStringItem]?

	public enum MapOfEnumStringItem: String, Codable, CaseIterable {
		case upper = "UPPER"
		case lower
	}

	public init(mapMapOfString: [String: [String: String]]? = nil, mapOfEnumString: [String: MapOfEnumStringItem]? = nil) {
		self.mapMapOfString = mapMapOfString
		self.mapOfEnumString = mapOfEnumString
	}

	private enum CodingKeys: String, CodingKey {
		case mapMapOfString = "map_map_of_string"
		case mapOfEnumString = "map_of_enum_string"
	}
}

public struct ArrayTest: Codable {
	public var arrayOfString: [String]?
	public var arrayArrayOfInteger: [[Int]]?
	public var arrayArrayOfModel: [[ReadOnlyFirst]]?

	public init(arrayOfString: [String]? = nil, arrayArrayOfInteger: [[Int]]? = nil, arrayArrayOfModel: [[ReadOnlyFirst]]? = nil) {
		self.arrayOfString = arrayOfString
		self.arrayArrayOfInteger = arrayArrayOfInteger
		self.arrayArrayOfModel = arrayArrayOfModel
	}

	private enum CodingKeys: String, CodingKey {
		case arrayOfString = "array_of_string"
		case arrayArrayOfInteger = "array_array_of_integer"
		case arrayArrayOfModel = "array_array_of_model"
	}
}

public struct NumberOnly: Codable {
	public var justNumber: Double?

	public init(justNumber: Double? = nil) {
		self.justNumber = justNumber
	}

	private enum CodingKeys: String, CodingKey {
		case justNumber = "JustNumber"
	}
}

public struct ArrayOfNumberOnly: Codable {
	public var arrayNumber: [Double]?

	public init(arrayNumber: [Double]? = nil) {
		self.arrayNumber = arrayNumber
	}

	private enum CodingKeys: String, CodingKey {
		case arrayNumber = "ArrayNumber"
	}
}

public struct ArrayOfArrayOfNumberOnly: Codable {
	public var arrayArrayNumber: [[Double]]?

	public init(arrayArrayNumber: [[Double]]? = nil) {
		self.arrayArrayNumber = arrayArrayNumber
	}

	private enum CodingKeys: String, CodingKey {
		case arrayArrayNumber = "ArrayArrayNumber"
	}
}

public struct EnumArrays: Codable {
	public var justSymbol: JustSymbol?
	public var arrayEnum: [ArrayEnumItem]?

	public enum JustSymbol: String, Codable, CaseIterable {
		case greaterThanOrEqualTo = ">="
		case dollar = "$"
	}

	public enum ArrayEnumItem: String, Codable, CaseIterable {
		case fish
		case crab
	}

	public init(justSymbol: JustSymbol? = nil, arrayEnum: [ArrayEnumItem]? = nil) {
		self.justSymbol = justSymbol
		self.arrayEnum = arrayEnum
	}

	private enum CodingKeys: String, CodingKey {
		case justSymbol = "just_symbol"
		case arrayEnum = "array_enum"
	}
}

public enum OuterEnum: String, Codable, CaseIterable {
	case placed
	case approved
	case delivered
}

public struct ContainerA: Codable {
	public var child: Child?
	public var refChild: AnyJSON

	public struct Child: Codable {
		public var `enum`: Enum
		public var renameMe: String
		public var child: Child

		public enum Enum: String, Codable, CaseIterable {
			case a
			case b
		}

		public struct Child: Codable {
			public var `enum`: Enum
			public var renameMe: String

			public enum Enum: String, Codable, CaseIterable {
				case a
				case b
			}

			public init(`enum`: Enum, renameMe: String) {
				self.enum = `enum`
				self.renameMe = renameMe
			}

			private enum CodingKeys: String, CodingKey {
				case `enum` = "enum"
				case renameMe = "rename-me"
			}
		}

		public init(`enum`: Enum, renameMe: String, child: Child) {
			self.enum = `enum`
			self.renameMe = renameMe
			self.child = child
		}

		private enum CodingKeys: String, CodingKey {
			case `enum` = "enum"
			case renameMe = "rename-me"
			case child
		}
	}

	public init(child: Child? = nil, refChild: AnyJSON) {
		self.child = child
		self.refChild = refChild
	}
}

public struct ContainerB: Codable {
	public var child: Child

	public struct Child: Codable {
		public var `enum`: Enum
		public var renameMe: String
		public var child: Child

		public enum Enum: String, Codable, CaseIterable {
			case a
			case b
		}

		public struct Child: Codable {
			public var `enum`: Enum
			public var renameMe: String

			public enum Enum: String, Codable, CaseIterable {
				case a
				case b
			}

			public init(`enum`: Enum, renameMe: String) {
				self.enum = `enum`
				self.renameMe = renameMe
			}

			private enum CodingKeys: String, CodingKey {
				case `enum` = "enum"
				case renameMe = "rename-me"
			}
		}

		public init(`enum`: Enum, renameMe: String, child: Child) {
			self.enum = `enum`
			self.renameMe = renameMe
			self.child = child
		}

		private enum CodingKeys: String, CodingKey {
			case `enum` = "enum"
			case renameMe = "rename-me"
			case child
		}
	}

	public init(child: Child) {
		self.child = child
	}
}

public struct ContainerC: Codable {
	public var child: Child

	public struct Child: Codable {
		public var `enum`: Enum
		public var renameMe: String

		public enum Enum: String, Codable, CaseIterable {
			case a
			case b
		}

		public init(`enum`: Enum, renameMe: String) {
			self.enum = `enum`
			self.renameMe = renameMe
		}

		private enum CodingKeys: String, CodingKey {
			case `enum` = "enum"
			case renameMe = "rename-me"
		}
	}

	public init(child: Child) {
		self.child = child
	}
}

public enum AnyJSON: Equatable, Codable {
	case string(String)
	case number(Double)
	case object([String: AnyJSON])
	case array([AnyJSON])
	case bool(Bool)

	var value: Any {
		switch self {
		case .string(let string): return string
		case .number(let double): return double
		case .object(let dictionary): return dictionary
		case .array(let array): return array
		case .bool(let bool): return bool
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		switch self {
		case let .array(array): try container.encode(array)
		case let .object(object): try container.encode(object)
		case let .string(string): try container.encode(string)
		case let .number(number): try container.encode(number)
		case let .bool(bool): try container.encode(bool)
		}
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let object = try? container.decode([String: AnyJSON].self) {
			self = .object(object)
		} else if let array = try? container.decode([AnyJSON].self) {
			self = .array(array)
		} else if let string = try? container.decode(String.self) {
			self = .string(string)
		} else if let bool = try? container.decode(Bool.self) {
			self = .bool(bool)
		} else if let number = try? container.decode(Double.self) {
			self = .number(number)
		} else {
			throw DecodingError.dataCorrupted(
				.init(codingPath: decoder.codingPath, debugDescription: "Invalid JSON value.")
			)
		}
	}
}

struct StringCodingKey: CodingKey, ExpressibleByStringLiteral {
	private let string: String
	private var int: Int?

	var stringValue: String { return string }

	init(string: String) {
		self.string = string
	}

	init?(stringValue: String) {
		self.string = stringValue
	}

	var intValue: Int? { return int }

	init?(intValue: Int) {
		self.string = String(describing: intValue)
		self.int = intValue
	}

	init(stringLiteral value: String) {
		self.string = value
	}
}
