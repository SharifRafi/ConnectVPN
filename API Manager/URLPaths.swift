//
//  URLPaths.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import Foundation


#if DEVELOPMENT
var KBasePath = "https://eapp-dev.siliconorchard.com"
#else
var KBasePath = "https://eapp-dev.siliconorchard.com"
#endif
let ImageKBasePath = ""
let privateKey = ""
let queryParams = "json=true&client_type=2&client_version=\(Constants.clientVersionNo)&sign="


enum OauthPath: String {
    
    case signup                  = "/api/v1/auth/sign-up?"
    case login                   = "/api/v1/auth/login?"
    case userCheck               = "/api/v1/auth/check-user?"
    case logout                  = "/api/v1/auth/logout?"
    case setPassResetRequest     = "/api/v1/auth/password-reset-request?"
    case resetPassword           = "/api/v1/auth/reset-password?"
    case reportIssue             = "/api/v1/customer-report-submit?"
    case setFcmToken             = "/api/v1/auth/register-notification-token?"
    case getNotificationList     = "/api/v1/notification-last-thirty-days?"
    case accDeactivate           = "/api/v1/auth/deactivate-user?"
    case checkPassword           = "/api/v1/auth/check-password?"
    
    //MARK: Distributor module related URLs
    case getMasterData           = "/api/v1/get-master-data?"
    case getDepositeTypeList     = "/api/v1/get-deposit-types?"
    case getCompanyList          = "/api/v1/get-companies?"
    case getBankList             = "/api/v1/get-banks?"
    case getBankAccountList      = "/api/v1/get-bank-accounts?"
    
    case getDistributorInfo      = "/api/v1/get-distributor-info?"
    case getDistributorData      = "/api/v1/get-distributor-data?"
    case getDistributorApplicationData = "/api/v1/get-distributor-details?"
    case updateDistributorInfo   = "/api/v1/distributor-update-request?"
    case addDistributorPdf       = "/api/v1/get-distributor-application-pdf?"
    case getDepositDateRange     = "/api/v1/get-deposit-date-range?"
    
    case setCollectionEntryData  = "/api/v1/collection-entry?"
    case getCollectionEntryList  = "/api/v1/collection-entry-list?"
    
    case uploadImage             = "/api/v1/upload-file?"
    case businessOpinionTypeList = "/api/v1/opinion-type-list?"
    case businessOpinionList     = "/api/v1/business-opinion-list?page="
    case submitBusinessOPinion   = "/api/v1/add-business-opinion?"
    case getBusinessTransection  = "/api/v1/get-business-transaction-list?"
    
    case productSaleList         = "/api/v1/sale-product-register-list?"
    case productSaleRegSet       = "/api/v1/sale-product-registration?"
    case ProductCategoryList     = "/api/v1/get-product-category-list?"
    
    case webLink                 = "/api/v1/get-web-link?"
    case service                 = "/api/v1/service-request?"
    case getServiceProducts      = "/api/v1/get-service-products?"
    case getServiceRequest       = "/api/v1/get-service-requests?"
    case getServiceStatus        = "/api/v1/get-service-request-status?"
    
    case appStatusCheck          = "/api/v1/get-application-status?"
    case baseURL                 =  "https://eapp.siliconorchard.com/api/v1/get-application-base-url?"
    case setDistributorForm      =  "/api/v1/distributor-application-submit?"
    
    case newOrderSubmit          = "/api/v1/add-new-order?"
    case getOrderList            = "/api/v1/get-order-list?"
    case productAcknowledgement  = "/api/v1/product-receive-acknowledgement?"
    case getProductReceiveList   = "/api/v1/get-product-receive-acknowledgement-list?"
    case getInventoryList        = "/api/v1/get-inventory-list?"
    case updateInventoryShowroom = "/api/v1/inventory-update?"
    
    case setWeCare               = "/api/v1/add-we-care?"
    case getWeCare               = "/api/v1/get-we-care-list?"
    
    case getSalesOffer           = "/api/v1/get-sales-offer-list?"
    case getSalesOfferProList    = "/api/v1/get-sales-product-list?"
    
    //MARK: Transport module related URLs
    case transportUserType                       = "/api/v1/transport/get-transport-user-type?"
    case addTransportUserDriver                  = "/api/v1/transport/add-user-driver?"
    case getTransportEmployeInfoAutoComplete     = "/api/v1/transport/get-employee-info-auto-complete?"
    case getEmployeeListByID                     = "/api/v1/transport/get-employee-list-by-id?"
    case getEmployeeList                         = "/api/v1/transport/get-employee-list?"
    case getDriverList                           = "/api/v1/transport/get-driver-list?"
    case discoverUserInfo                        = "/api/v1/discover-user-info?"
    
    case getOperatingUnitList                    = "/api/v1/transport/get-operating-unit-list?"
    case getUsageTypeList                        = "/api/v1/transport/get-usage-type-list?"
    case getTransBrandList                       = "/api/v1/transport/get-brand-list?"
    case getTranVehicleTypeList                  = "/api/v1/transport/get-vehicle-type-list?"
    case getTranSourcingTypeList                 = "/api/v1/transport/get-sourcing-type-list?"
    case addVehicleRequisition                   = "/api/v1/transport/add-vehicle-requisition?"
    case getFavAddressList                       = "/api/v1/transport/get-user-trip-favorite-place-list?"
    case deleteAddress                           = "/api/v1/transport/delete-user-trip-favorite-place?"
    case getVehicleRequisitionList               = "/api/v1/transport/vehicle-requisition-list?"
    case updateVehicleRequisition                = "/api/v1/transport/update-vehicle-requisition?"
    
    case getUnitList                             = "/api/v1/transport/get-unit-list?"
    case getOwnershipList                        = "/api/v1/transport/get-ownership-list?"
    case getVehicleProfileList                   = "/api/v1/transport/vehicle-profile-list?"
    case addVehicleProfile                       = "/api/v1/transport/add-vehicle-profile?"
    case addTripRequisition                      = "/api/v1/transport/add-trip-requisition?"
    case addVehicleSetup                         = "/api/v1/transport/add-vehicle-user-driver?"
    
    case getApproveTripListForDriver             = "/api/v1/transport/get-approved-trip-requisition-for-driver-list?"
    case addTripExpenseRequest                   = "/api/v1/transport/add-trip-expense?"
    
    case getPendingTripRequisitipnList           = "/api/v1/transport/get-trip-requisition-list?"
    case approveTripRequisition                  = "/api/v1/transport/approve-trip-requisition?"
    case getApprovedTripReqList                  = "/api/v1/transport/get-approved-trip-requisition-list?"
    case getTripRequisitionListById              = "/api/v1/transport/get-trip-list-by-id?"
    
    case getVehicleAndDriverList                 = "/api/v1/transport/get-vehicle-user-driver-list?"
    case assignTripToDriver                      = "/api/v1/transport/assign-trip-to-vehicle-user-driver?"
    
    case startTrip                               = "/api/v1/transport/start-trip?"
    case endTrip                                 = "/api/v1/transport/end-trip?"
    case getTripExpenseList                      = "/api/v1/transport/get-trip-expense-list?"
    case setTripExpenseApproved                  = "/api/v1/transport/approve-trip-expense?"
    case setInstantTrip                          = "/api/v1/transport/add-instant-trip?"
    case setTripPickDrop                         = "/api/v1/transport/trip-pick-n-drop?"
    case getGeoLocation                          = "/api/v1/transport/get-live-geo-location?"
    case getTripSetupListForDriver               = "/api/v1/transport/get-trip-setup-list-for-driver?"
    case setStartDropPickEndTrip                 = "/api/v1/transport/start-trip-new?"
    
    case getTripSummaryReport                    = "/api/v1/transport/get-trip-summary-report?"
    
    case getLeaveTypeList                        = "/api/v1/get-all-leave-types?"
    case setLeaveRequest                         = "/api/v1/insert-leave-data?"
    case setAttendanceInOut                      = "/api/v1/insert-in-out-data?"
    case setShortLeaveApplication                = "/api/v1/insert-short-leave-data?"
    case getSevenDaysAttendanceList              = "/api/v1/get-last-seven-days-attendance-list?"
    
    case getDriverAdvance                        = "/api/v1/transport/get-driver-advance?"
    case setAdvanceToDriver                      = "/api/v1/transport/add-driver-advance?"
    
    case setVehiclePurchaseRequisition           = "/api/v1/transport/add-vehicle-purchase-requisition?"
    case setVehicleRentalRequisition             = "/api/v1/transport/add-rental-info?"
    case getProcurementList                      = "/api/v1/transport/vehicle-procurement-requisition-list?"
    case getPurchaseDetails                      = "/api/v1/transport/get-vehicle-purchase-requisition-by-id?"
    case approvePurchaseRequest                  = "/api/v1/transport/approve-vehicle-purchase-requisition?"
    
    case addMaintenanceReq                       = "/api/v1/transport/add-maintenance-request?"
    case approveMaintenance                      = "/api/v1/transport/approve-maintenance-request?"
    case getMaintenanceReqList                   = "/api/v1/transport/get-maintenance-request-list?"
    
    case setMoveOrder                            = "/api/v1/transport/add-move-order?"
    case addExternalMaintenanceBill              = "/api/v1/transport/add-external-maintenance-request?"
    case getTripExpenseBillReports               = "/api/v1/transport/get-trip-expense-bill-report?"
    
    case getTransportMenuList                    = "/api/v1/transport/get-menu-list?"
    case userCategoryWiseExclusiveOfferList      = "/api/v1/get-exclusive-offer-by-user-category?"
    
    case getvanRequisitionList                   = "/api/v1/transport/get-van-purchase-delivery-list?"
    case getvanSupplierList                      = "/api/v1/transport/get-supplier-list?"
    case submitVanRequisition                    = "/api/v1/transport/submit-vehicle-purchase-delivery-requisition?"
    
    case getTripCompletionApprovedList           = "/api/v1/transport/get-trip-completion-approved-list?"
    case getTripCompletionPendingList            = "/api/v1/transport/get-trip-completion-pending-list?"
    case submitTripCompletionApproval            = "/api/v1/transport/submit-trip-completion-approval?"
    
    
    //MARK: Job Tracker
    case getJobEmployeeInfo                      = "/api/v1/feedback/get-employee-info?emp_id="
    case getJobAndTaskList                       = "/api/v1/get-job-by-keyword?"
    case addNewTask                              = "/api/v1/add-new-task?"
    case updateTask                              = "/api/v1/update-task?"
    case addNewJob                               = "/api/v1/add-new-job?"
    case addReminder                             = "/api/v1/send-reminder?"
    case getAllSelfCreatedJobList                = "/api/v1/get-all-job-list?"
    
    //MARK: Feedback
    case getDepartmentList                       = "/api/v1/feedback/department-list?"
    case getFeedbackList                         = "/api/v1/feedback/feedback-list?"
    case getHodPendingFeedbackList               = "/api/v1/feedback/get-hod-feedBack?"
    case getLocation                             = "/api/v1/feedback/get-locations?"
    case addFeedback                             = "/api/v1/feedback/add-feedback?"
    case checkHod                                = "/api/v1/feedback/check-hod?"
    case setAssignFeedback                       = "/api/v1/feedback/assign-feedback?"
    case setUpdateHodRemark                      = "/api/v1/feedback/add-hod-feedback?"
    
    //MARK: Management Dashboard
    case getSurveyDetails                        = "/api/v1/last-30days-survey_details?"
}
