//
//  AppGlobalEnums.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import Foundation

enum UpdateType: String {
    case name  = "Name"
    case email = "Email"
    case phone = "Phone No"
    case image = "Profile Image"
}

enum SearchType: String {
    case bank            = "banks"
    case branch          = "branches"
    case companyBankAcc  = "bank_accounts"
    case depositTypes    = "deposit_types"
    case productList     = "product_items"
    case showroom        = "showroom"
    case salesType       = "sales_types"
    case productTypes    = "product_types"
    case serviceProducts = "service_products"
    case incidentTypes   = "incident_types"
    case serviceCenters  = "service_centers"
    case brand           = "brands"
    case none            = "none"
}

enum TransportSearchType: String {
    case vehicle            = "Vehicle"
    case employee           = "Employee"
    case vehicleReg         = "VehicleReg"
}

enum DriverRoleType: String {
    case driver            = "Driver"
}

enum ImageUploadType: Int {
    case tin  = 1
    case bin  = 2
    case nid  = 3
}

enum ImageUploadTypeForTransport: Int {
    case nid       = 1
    case drivingL  = 2
    case bin       = 3
    case tin       = 4
}


enum ImageUploadPurpose: String {
    case depositEntry               = "deposit-entry"
    case distributorApplication     = "distributor-application"
    case businessOpinion            = "business-opinion"
    case transportUserProfile       = "transport-user-profile"
    case vehicleTripExpense         = "vehicle-trip-expense"
    case externalMaintenance        = "external-maintenance"
    case instantTripMeterReading    = "trip-start-meter-reading"
    case tripEndMeterReading        = "trip-end-meter-reading"
}

enum LinkTblType: String {
    case webLink            = "web_link"
    case pdfLink            = "sys_constants"
    case files              = "files"
}

enum APIStatusList: Int {
    case pickUp            = 1
    case drop              = 2
}

enum TripStatusList: Int {
    case start            = 1
    case pickUp           = 2
    case drop             = 3
    case end              = 4
}

enum AlertType: String {
    case success            = "success"
    case fail               = "fail"
    case somethingWroong    = "somethingWentWroong"
}
