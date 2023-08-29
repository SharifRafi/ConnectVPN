//
//  Constants.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import UIKit

let IS_IPHONE_X = (UIScreen.main.nativeBounds.height == 2436)
let KGoogleClientID = ""
let fbSecret = ""
let fbAppId = ""
let JWTTokenKey = "95388f7b!1b426878.1dc841145ec032"


struct Constants {
    static let API_KEY_PLACE_PICKER               = ""
    static let ssFixedToken                       = ""
    static let wcToken                            = "wcToken"
    static let wcName                             = "wcName"
    static let wcEmail                            = "wcEmail"
    static let wcUserId                           = "wcUserId"
    static let wcEmployeeRole                     = "wcEmployeeRole"
    static let wcPassword                         = "wcPassword"
    static let wcPhone                            = "wcPhone"
    static let wcIsRememberChecked                = "wcIsRememberChecked"
    static let wcFCMToken                         = "wcFCMToken"
    static let wcUserCategory                     = "wcUserCategory"
    static let wcEmployeeType                     = "wcEmployeeType"
    
    static let wcEmpId                            = "wcEmpId"
    static let wcEmpDesignation                   = "wcEmpDesignation"
    static let wcEmpDepartment                    = "wcEmpDepartment"
    static let wcEmpSection                       = "wcEmpSection"
    
    static let wcDealerName                       = "wcDealerName"
    static let wcDealerCode                       = "wcDealerCode"
    static let wcPartyId                          = "wcPartyId"
    static let wcIsDistributor                    = "wcIsDistributor"
    static let wcDealerAddress                    = "wcDealerAddress"
    static let wcDealerSsalesChannelCode          = "wcDealerSsalesChannelCode"
    static let wcSelectedIndex                    = "wcSelectedIndex"
    static let wcdealerImage                      = "wcdealerImage"
    static let wcDealerCategory                   = "wcDealerCategory"
    static let wcParentDealerPartyId              = "wcParentDealerPartyId"
    static let wcParentSalesChannelCode           = "wcParentSalesChannelCode"
    static let wcParentDistributorName            = "wcParentDistributorName"
    static let wcSubDealerAddress                 = "wcSubDealerAddress"
    
    static let wcManual                           = "wcManual"
    static let wcManualPDF                        = "wcManualPDF"
    static let wcManualCount                      = "wcManualCount"
    static let wcSalesOfferLink                   = "wcSalesOfferLink"
    static let wcLat                              = "wcLat"
    static let wcLng                              = "wcLng"
    static let wcAppBuildVersion                  = "wcAppBuildVersion"
    static let wcIsFirstTime                      = "wcIsFirstTime"
    
    static let wcWebLink                          = "wcWebLink"
    static let wcWalton                           = "wcWalton"
    static let wcMarcel                           = "wcMarcel"
    
    static let wcNotificationTitle                = "wcNotificationTitle"
    static let wcNotificationBody                 = "wcNotificationBody"
    static let wcIsNotificationStored             = "wcIsNotificationStored"
    
    
    static let wcHomeMenuArray: [Dictionary<String,String>] = [
        (["title":"User Manual", "icon":"ic_userManualLogo"]),
        (["title":"Distributor Application", "icon":"ic_distributorLogo"]),
        (["title":"Product Price", "icon":"ic_productPriceLogo"]),
        (["title":"Sales Offer", "icon":"ic_salesOfferLogo"]),
        (["title":"Deposit", "icon":"ic_depositLogo"]),
        (["title":"New Order", "icon":"ic_newOrderLogo"]),
        (["title":"Product Receive", "icon":"ic_productReceiveLogo"]),
        (["title":"Inventory Status", "icon":"ic_inventoryLogo"]),
        (["title":"Product Sales Registratoin", "icon":"ic_productRegistrationLogo"]),
        (["title":"30 Days Transactions", "icon":"ic_transectionLogo"]),
        (["title":"Service Request & Status", "icon":"ic_serviceReqLogo"]),
        (["title":"Business Opinion", "icon":"ic_businessOpinionLogo"]),
        (["title":"We Care", "icon":"ic_weCareLogo"]),
        (["title":"Web Link", "icon":"ic_webLinkLogo"])
    ]
    static let wcSubDealerMenuArray: [Dictionary<String,String>] = [
        (["title":"User Manual", "icon":"ic_userManualLogo"]),
        (["title":"Product Price", "icon":"ic_productPriceLogo"]),
        (["title":"Product Sales Registratoin", "icon":"ic_productRegistrationLogo"]),
        (["title":"Service Request & Status", "icon":"ic_serviceReqLogo"]),
        (["title":"Business Opinion", "icon":"ic_businessOpinionLogo"]),
        (["title":"Web Link", "icon":"ic_webLinkLogo"])
    ]
    
    static let wcEmployeeMainHomeMenuArray: [Dictionary<String,String>] = [
        (["title":"User Manual", "icon":"ic_userManual"]),
        (["title":"Attendance & Tour", "icon":"ic_attendance"]),
        (["title":"Discover Employee", "icon":"ic_employeeSearch"]),
        (["title":"Job Tracker", "icon":"ic_jobTracker"]),
        (["title":"FeedBack", "icon":"ic_feedback"]),
        (["title":"Financials", "icon":"ic_financials"]),
        (["title":"Transport", "icon":"ic_transport"]),
        (["title":"Move Order", "icon":"ic_moveOrder"]),
        (["title":"Approval", "icon":"ic_approval"]),
        (["title":"Product Price", "icon":"ic_productPrice"]),
        (["title":"Management Dashboard", "icon":"ic_managementDashboard"]),
        (["title":"Web Link", "icon":"ic_weblink"])
//        (["title":"Profile Update", "icon":"ic_profileUpdate"])
    ]
    
    static let wcManagementMenuArray: [Dictionary<String,String>] = [
        (["title":"AWAZ", "icon":"ic_awazDas"]),
        (["title":"amar AWAZ", "icon":"ic_amarAwaz"]),
        (["title":"Survey", "icon":"ic_survey"])
    ]
    
    static let wcAwazMenuArray: [Dictionary<String,String>] = [
        (["title":"Summary", "icon":"ic_summary"]),
        (["title":"Collection", "icon":"ic_collection"]),
        (["title":"Order", "icon":"ic_order"])
    ]
    
    static let wcAttendanceMenuArray: [Dictionary<String,String>] = [
        (["title":"Outdoor Entry", "icon":"ic_outdoorEntry"]),
        (["title":"Short Leave", "icon":"ic_shortLeave"]),
        (["title":"Leave", "icon":"ic_leave"]),
        (["title":"Attendance Summary", "icon":"ic_attendenceSummary"]),
        (["title":"Leave Summary", "icon":"ic_tourLeave"]),
        (["title":"Tour", "icon":"ic_tourForeign"])
    ]
    
    static let wcFinancialsMenuArray: [Dictionary<String,String>] = [
        (["title":"Product Loan", "icon":"ic_productLoan"]),
        (["title":"Loan", "icon":"ic_loan"]),
        (["title":"Advance", "icon":"ic_advance"]),
        (["title":"Others", "icon":"ic_others"])
    ]
    
    static let wcJobHomeMenuArray: [Dictionary<String,String>] = [
        (["title":"New Job", "icon":"ic_jobCreate"]),
        (["title":"Task View & Update", "icon":"ic_taskView&Update"]),
        (["title":"Task Report", "icon":"ic_taskReport"])
    ]
    
    static let wcApprovalMenuArray: [Dictionary<String,String>] = [
        (["title":"Trip Requisition", "icon":"ic_tripRequisitionApproval"]),
        (["title":"Expense", "icon":"ic_expenseApproval"]),
        (["title":"Vehicle Procurement", "icon":"ic_vehicleProcurementApproval"]),
        (["title":"Vehicle Maintenance", "icon":"ic_vehicleMaintenanceApproval"]),
        (["title":"Trip Completion", "icon":"ic_tripCompletionApproval"])
    ]
    
    static let wcTransportIconArray: [Dictionary<String,String>] = [
        (["id": "6", "icon":"ic_connectTrip"]),
        (["id": "8", "icon":"ic_expenseEntryVarious"]),
        (["id": "100", "icon":"ic_externalMaintenanceBill"]),
        (["id": "20", "icon":"ic_externalMaintenanceBillEntry"]),
        (["id": "1", "icon":"ic_profileCreateRequest"]),
        (["id": "22", "icon":"ic_reportBillPreparation"]),
        (["id": "23", "icon":"ic_serviceInventory"]),
        (["id": "7", "icon":"ic_tripEnterDriver"]),
        (["id": "4", "icon":"ic_tripRequisition"]),
        (["id": "10", "icon":"ic_tripSummaryReport"]),
        (["id": "27", "icon":"ic_vanrequisitionPurchase"]),
        (["id": "3", "icon":"ic_vehicleDriver&UserSetup"]),
        (["id": "16", "icon":"ic_vehicleMaintenanceRequisition"]),
        (["id": "2", "icon":"ic_vehicleProfile"]),
        (["id": "11", "icon":"ic_vehiclePurchaseRequisition"]),
        (["id": "24", "icon":"ic_vehicleRentalRequisition"]),
        (["id": "18", "icon":"ic_vehicleRequisition"]),
        (["id": "26", "icon":"ic_tripCompletionApproval"]),
        (["id": "15", "icon":"ic_advanceDriver"]),
        (["id": "19", "icon":"ic_vehicleRequisitionUpdate"])
    ]
    
    
    static let wcWaltonUrl                    = "https://waltonbd.com"
    static let wcMarcelUrl                    = "https://marcelbd.com"
    static let clientVersionNo                = 20008
    static let totalProductLimit              = 5000
    static let keyForSign                     = "Wu5458FKMKqDkrdXV4QQ65c9Aj4C3mVt"   //for 20008
    
    //MARK: client version and API key list
    /*
     "DfLMRJf2rzcP4rfBknnveAY62duPVyJu"     ---->  1003
     "2eA3GWah6QnDr3h4bx3rCqWdhtArHVq4"     ---->  20009
     "Wu5458FKMKqDkrdXV4QQ65c9Aj4C3mVt"     ---->  20008
     "8jDnPHWopA63wJz8hmZ5VXBdPkjMYPio"     ---->  30006
     */
    
    static let appStoreURL = "itms-apps://apple.com/app/id1614590548"
    static let masterDataParams = "companies,deposit_types,web_link,files,relationships,brands,product_types,sales_types,user_types,sys_constants"
    static let tempMasterDataList = ["bank_accounts","banks","companies","deposit_types","branches","web_link", "relationships", "brands", "product_types", "service_products", "sales_types", "service_centers", "user_types", "sys_constants", "incident_types"]
    
    static let phoneNumberPrefixList = ["011", "013", "014", "015", "016", "017", "018", "019"]
}

struct ConstantsMessage {
    static let wcProprietorName = "Please insert name"
    static let wcProprietorNumber = "Please insert proprietor mobile number"
    static let wcProprietorFatherName = "Please insert proprietor's father name"
    static let wcProprietorMotherName = "Please insert proprietor's mother name"
    static let wcPresentAddress = "Please insert present address"
    static let wcPermanentAddress = "Please insert permanent address"
    static let wcProprietoNid = "Please insert nid number"
    static let wcProprietoNidImage = "Please insert nid image"
    static let wcDob = "Please insert date of birth"
    static let wcContactPerson = "Please insert contact person name"
    static let wcContactPersonMobile = "Please Insert Contact Person Mobile Number"
    static let wcEmail = "Please Insert Email"
    static let wcValidEmail = "Please insert a valid email"
    
    static let wcNomineeName = "Please insert nominee name"
    static let wcNomineeMobile = "Please insert mobile number"
    static let wcNomineeNid = "Please insert nid number"
    static let wcNomineeNidImage = "Please insert nid image"
    static let wcRelation = "Please select a relation"
    static let wcNomineeAddress = "Please insert address"
    
    static let wcTradeLicence = "Please insert trade licence number"
    static let wcTradeLicenceImageLink = "Please insert trade licence image"
    static let wcShowroomName = "Please insert showroom name"
    static let wcShowroomSize = "Please insert showroom size"
    static let wcMarketSize = "Please insert market size"
    static let wcDistancewaltonSales = "Please insert distance from nearest WALTON sales point"
    static let wcInvestments = "Please insert investments"
    static let wcBrand = "Please select a brand"
    
    static let wcName = "Please Insert Name"
    static let wcMobileAlt = "Please insert alternative mobile number"
    static let wcServiceCenter = "Please select a service center"
    static let wcIncidentType = "Please select any incident type"
    static let wcDescription = "Please insert description"
    
    static let wcWeCareEmpty = "Please provide WE Care Card Number"
    static let wcWeCareInvalid = "Please insert valid we care number. 15 digit WE Care card number allowed only."
    static let wcMobileInvalid = "Invalid mobile number. 11 digit mobile number allowed only."
    static let wcAltMobInvalid = "Invalid alternative mobile number."
    static let wcInvalidNid = "Invalid NID Number"
    static let wcInvalidMobileNumber = "Invalid Mobile Number."
    
    static let wcVisitFrom = "Please Insert The Address You Will Visit From"
    static let wcVisitTo = "Please insert the address you will visit to"
    static let wcStartDate = "Please insert start date"
    static let wcStartTime = "Please insert start time"
    static let wcEndDate = "Please insert end date"
    static let wcEndTime = "Please insert end time"
    static let wcVisitType = "Please select visit type"
    static let wcVisitReason = "Please select visit Reason"
    static let wcJourneyType = "Please select journey type"
    static let wcVehicleType = "Please select vehicle type"
    static let wcPassengerNo = "Please insert passenger number"
    static let wcVisitDetails = "Please insert visit details"
}

struct DateFormat {
}

struct DBConstants {
    static let dbName = "WCEappDB"
    
    // table name
    static let masterDataTblName = "MasterDataList"
    static let productListDataTblName = "ProductList"
}

struct StringConstants{
    static let appUpdate = "Please Update the Application"
    static let optionalAppUpdate = "Please update the application for better experience."
}

struct TitleConstants{
    static let jobRefSearch = "Job Reference Search"
    static let suppliers = "Suppliers"
    static let serviceCenter = "Service Centers"
    static let search = "Search"
    static let profile = "Profile"
    static let notifications = "Notifications"
    static let survey = "Survey"
    static let feedback = "Feedback"
    static let sendFeedback = "Send Feedback"
    static let approval = "Approval"
    static let financials = "Financials"
    static let discoverEmployee = "Discover Employee"
    static let createTour = "Create Tour"
    static let leaveSummaryList = "Leave Summary List"
    static let attendanceSummaryList = "Attendance Summary List"
    static let leaveList = "Leave List"
    static let createLeave = "Create Leave"
    static let shortLeaveList = "Short Leave List"
    static let createShortLeave = "Create Short Leave"
    static let inOutEntry = "IN/OUT Entry"
    static let attendanceTour = "Attendance & Tour"
}

