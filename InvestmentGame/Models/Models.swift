import Foundation

// MARK: - Welcome
struct User: Codable {
    let id: Int
    let name: String
    let balance, baseBalance, sells, gameWeekID, investProfileID, analyticsID: Int
    let gameWeek: GameWeek?
    let investProfile: InvestProfile?
    let analytics: Analytics?
    let userInstruments: [UserInstrument]?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case balance = "Balance"
        case baseBalance = "BaseBalance"
        case sells = "Sells"
        case gameWeekID = "GameWeekID"
        case gameWeek = "GameWeek"
        case investProfileID = "InvestProfileID"
        case investProfile = "InvestProfile"
        case analyticsID = "AnalyticsID"
        case analytics = "Analytics"
        case userInstruments = "UserInstruments"
    }
}

// MARK: - Analytics
struct Analytics: Codable {
    let id, totalIncome, totalIncomeRate, investProfileID: Int
    let investProfile: InvestProfile
    let instrumentsBalanceVerdict, financialCushionVerdict, testAnswersVerdict, tradingStrategyVerdict: String
    let totalVerdict: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case totalIncome = "TotalIncome"
        case totalIncomeRate = "TotalIncomeRate"
        case investProfileID = "InvestProfileID"
        case investProfile = "InvestProfile"
        case instrumentsBalanceVerdict = "InstrumentsBalanceVerdict"
        case financialCushionVerdict = "FinancialCushionVerdict"
        case testAnswersVerdict = "TestAnswersVerdict"
        case tradingStrategyVerdict = "TradingStrategyVerdict"
        case totalVerdict = "TotalVerdict"
    }
}

// MARK: - InvestProfile
struct InvestProfile: Codable {
    let id: Int
    let name, investProfileDescription: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case investProfileDescription = "Description"
    }
}

// MARK: - GameWeek
struct GameWeek: Codable {
    let id: Int
    let instrumentRateChanges: [InstrumentRateChange]
    let news: [Advice]
    let instruments: [Instrument]
    let advices: [Advice]
    let testQuestions: [TestQuestion]

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case instrumentRateChanges = "InstrumentRateChanges"
        case news = "News"
        case instruments = "Instruments"
        case advices = "Advices"
        case testQuestions = "TestQuestions"
    }
}

// MARK: - TestQuestion
struct TestQuestion: Codable {
    let id: Int
    let name, text: String
    let testAnswers: JSONNull?
    let gameWeekID: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case text = "Text"
        case testAnswers = "TestAnswers"
        case gameWeekID = "GameWeekID"
    }
}

// MARK: - Advice
struct Advice: Codable {
    let id: Int
    let title: String?
    let text: String
    let gameWeekID: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case text = "Text"
        case gameWeekID = "GameWeekID"
    }
}

// MARK: - InstrumentRateChange
struct InstrumentRateChange: Codable {
    let id, instrumentID, gameWeekID: Int
    let priceChangeRate: Double
    let additionalPayment, paymentName: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case instrumentID = "InstrumentID"
        case gameWeekID = "GameWeekID"
        case priceChangeRate = "PriceChangeRate"
        case additionalPayment = "AdditionalPayment"
        case paymentName = "PaymentName"
    }
}


// MARK: - Instrument
struct Instrument: Codable {
    let id: Int
    let name: String
    let imageURL: String
    let instrumentTypeID: Int
    let instrumentType: InvestProfile
    let additionalInfo, instrumentDescription, sector, legend: String
    let rating, basePrice, baseAmount, gameWeekID: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case imageURL = "ImageURL"
        case instrumentTypeID = "InstrumentTypeID"
        case instrumentType = "InstrumentType"
        case additionalInfo = "AdditionalInfo"
        case instrumentDescription = "Description"
        case sector = "Sector"
        case legend = "Legend"
        case rating = "Rating"
        case basePrice = "BasePrice"
        case baseAmount = "BaseAmount"
        case gameWeekID = "GameWeekID"
    }
}


// MARK: - UserInstrument
struct UserInstrument: Codable {
    let id, currentPrice, priceChanged: Int
    let priceChangedRate: Double
    let instrumentID: Int
    let instrument: Instrument
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case currentPrice = "CurrentPrice"
        case priceChanged = "PriceChanged"
        case priceChangedRate = "PriceChangedRate"
        case instrumentID = "InstrumentID"
        case instrument = "Instrument"
        case userID = "UserID"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


// MARK: - Status
struct Status: Codable {
    let message: String?
    let status: Bool?
    let error: String?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
       case error = "error"
    }
}
