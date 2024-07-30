class LanguageModel {
  String languageName;
  String languageCode;
  String countryCode;
  LanguageModel(
      {required this.languageName,
      required this.languageCode,
      required this.countryCode});

  @override
  String toString() {
    return "${languageCode}_$countryCode";
  }
}

Map<String,String> english = {
  // VEHICLE BOOKING ENGLISH LANGUAGE  START ----->
  // Filter
  "Category": "Category",
  "Price Rate": "Price Rate",
  "Fuel": "Fuel",
  "Transmission": "Transmission",
  "Seating": "Seating",
  "SUV": "SUV",
  "Sports": "Sports",
  "Coupe": "Coupe",
  "Sedan": "Sedan",
  "Scorpio": "Scorpio",
  "Casual": "Casual",
  "Vintage": "Vintage",
  // Price rate
  "Per Hourly": "Per Hourly",
  "Per Day": "Per Day",
  "Per Kilometer": "Per Kilometer",
  // Fuel
  "Gas": "Gas",
  "Diesel": "Diesel",
  // Transmission
  "Automatic": "Automatic",
  "Manual": "Manual",
  // Find Car
  "Find My Car": "Find My Car",
  "Search for rental & cars": "Search for rental & cars",
  "Car added to Wish list": "Car added to Wish list",
  // Car Perview
  "review": "review",
  "Price Rate (₹)": "Price Rate (₹)",
  "Introduction": "Introduction",
  "Car Details": "Car Details",
  "Car Make": "Car Make",
  "Color": "Color",
  "License Plate no": "License Plate no",
  "Seating Capacity": "Seating Capacity",
  "Similar Vehicles": "Similar Vehicles",
  "Wishlist": "Wishlist",
  "Rent Now": "Rent Now",
  // Car image and video
  "Photots": "Photots",
  "Videos": "Videos",
  // VEHICLE BOOKING ENGLISH LANGUAGE  END ----->

  // BOOKINGS ENGLISH LANGUAGE  START ----->
  // Bookings
  "Search for Bookings": "Search for Bookings",
  "Upcoming": "Upcoming",
  "Completed": "Completed",
  // Booking detail
  "Booking Details": "Booking Details",
  "off": "off",
  "Address": "Address",
  "Destination": "Destination",
  "Time & Date": "Time & Date",
  "Amount": "Amount",
  "Mode op Payment": "Mode op Payment",
  "Coupon code applied": "Coupon code applied",
  "Cancel": "Cancel",
  "Pay Now": "Pay Now",
  // Payment Sucessfull popup
  "Transaction ID": "Transaction ID",
  "Payment Sucessfull": "Payment Sucessfull",
  "Payment to": "Payment to",
  "time": "time",
  "Mode of Payment": "Mode of Payment",
  "Promo code applied": "Promo code applied",
  "Paid Amount": "Paid Amount",
  // BOOKINGS ENGLISH LANGUAGE  END ----->

  // PAYMENT AND ADDRESS LANGUAGE  START ----->
  // Wish list
  "Wish list": "Wish list",
  "here are your selected car for the booking , it will auto save to wish list so you can bok later easily":
      "here are your selected car for the booking , it will auto save to wish list so you can bok later easily",
  "Car": "Car",
  "Payment": "Payment",
  // Add Address
  "Add Address": "Add Address",
  "fill or select your location and Destination for the the Booking":
      "fill or select your location and Destination for the the Booking",
  "Address( default )": "Address( default )",
  "Total Kilometer’s": "Total Kilometer’s",
  " Kilometer’s": " Kilometer’s",
  "per km": "per km",
  // Payment
  "Here is your Booking Review for all Selected Vehicles":
      "Here is your Booking Review for all Selected Vehicles",
  "Set Time & Date": "Set Time & Date",
  "Cash": "Cash",
  "Online": "Online",
  "Save more on your booking": "Save more on your booking",
  "Apply": "Apply",
  "Applied": "Applied",
  "Tax % ( GST )": "Tax % ( GST )",
  "Coupon Discount": "Coupon Discount",
  // Date and Time Popup
  "Set Time": "Set Time",
  "Set Date": "Set Date",
  "Reset": "Reset",
  // PAYMENT AND ADDRESS LANGUAGE  END ----->

  // ACCOUNT LANGUAGE  START ----->
  // Account
  "Available Balance": "Available Balance",
  "General": "General",
  "Profile": "Profile",
  "My Address": "My Address",
  "Language": "Language",
  "My Transactions": "My Transactions",
  "Settings & Privacy": "Settings & Privacy",
  "Payment Methods": "Payment Methods",
  "Privacy Policy": "Privacy Policy",
  "Term’s and  Condition": "Term’s and  Condition",
  "FAQ’s": "FAQ’s",
  "Help & Support": "Help & Support",
  "Rate Us": "Rate Us",
  "Logout": "Logout",
  // Profile
  "Please check and add your necessary details for your booking Profile":
      "Please check and add your necessary details for your booking Profile",
  "enter your name": "enter your name",
  "Mobile": "Mobile",
  "Location": "Location",
  // Language
  "Search for languages": "Search for languages",
  // Transaction
  "Transaction": "Transaction",
  "Search for Transactions": "Search for Transactions",
  // My Address
  "Your Saved Addresses": "Your Saved Addresses",
  // Add New Address
  "Add New Address": "Add New Address",
  "Search for available service area": "Search for available service area",
  "House No. / Building Name": "House No. / Building Name",
  "Enter House No.": "Enter House No.",
  "Address Tittle": "Address Tittle",
  "Contact Name": "Contact Name",
  "Contact Number": "Contact Number",
  // FAQ’s
  "Still need Help ! Contact Us": "Still need Help ! Contact Us",
  "Q": "Q",
  "Ans": "Ans",
  // Payment Methods
  "Current Method": "Current Method",
  "Default Method": "Default Method",
  "Chose your desired payment method for online payments in which you are comfortable or add your cards":
      "Chose your desired payment method for online payments in which you are comfortable or add your cards",
  "Cash on Delivery": "Cash on Delivery",
  "increase in charges": "increase in charges",
  "Expires on": "Expires on",
  "UPI": "UPI",
  "add your UIP ID": "add your UIP ID",
  "Enter your UPI ID": "Enter your UPI ID",
  "Paytm": "Paytm",
  "add your mobile no": "add your mobile no",
  "Add  Card": "Add  Card",
  // Add card
  "Add Bank Card": "Add Bank Card",
  "Add new card": "Add new card",
  "Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.":
      "Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.",
  "Card no": "Card no",
  "Expiry Date": "Expiry Date",
  "CVV": "CVV",
  "MM/YY": "MM/YY",
  "Cardholder’s name": "Cardholder’s name",
  "enter cardholder’s full name": "enter cardholder’s full name",
  // Bank Popup
  "Bank Card Added Successfully": "Bank Card Added Successfully",
  "please wait we are taking up Required detials":
      "please wait we are taking up Required detials",
  // Notification
  "Notification Setting": "Notification Setting",
  "In App Notifcation": "In App Notifcation",
  "Get Notification Within App": "Get Notification Within App",
  "System Notification": "System Notification",
  "Get Notification outside the App": "Get Notification outside the App",
  "Behaviour": "Behaviour",
  "Allow Notification to wake the Device":
      "Allow Notification to wake the Device",
  "Disable Notification Vibration": "Disable Notification Vibration",
  "Do Not Disctrub": "Do Not Disctrub",
  // Help & Support
  "You can connect our experts and support for your conformations and Hleps":
      "You can connect our experts and support for your conformations and Hleps",
  "Customer Services": "Customer Services",
  "WhatsApp": "WhatsApp",
  "Delete My Account": "Delete My Account",
  "Toll Free Number ": "Toll Free Number ",
  // Customer Service
  "Customer Service": "Customer Service",
  // Delete Account
  "Delete Account": "Delete Account",
  "If you want to delete Account you are prompted to provide reason for deleting account ":
      "If you want to delete Account you are prompted to provide reason for deleting account ",
  "No Longer Uses the Service Platform": "No Longer Uses the Service Platform",
  "Found a better alternative": "Found a better alternative",
  "Too many email / notification": "Too many email / notification",
  "Difficult Navigation in Platform": "Difficult Navigation in Platform",
  "Account Security Concerns": "Account Security Concerns",
  "Personal Reason ": "Personal Reason ",
  "Other": "Other",
  "type here": "type here",
  // Delete Account Popup
  "Are you Sure ?": "Are you Sure ?",
  "You Want to Delete your Account Permanently":
      "You Want to Delete your Account Permanently",
  "Ensuring that the user understands consequences to deleting their Account ( loss of Data )":
      "Ensuring that the user understands consequences to deleting their Account ( loss of Data )",
  "Keep Account": "Keep Account",
  // Rate us Popup
  "Let’s Know what you like and where we can get Better. Rat eus adn type your Responses Below.":
      "Let’s Know what you like and where we can get Better. Rat eus adn type your Responses Below.",
  "Rate your experience": "Rate your experience",
  "ouch ! please tell us what we can improve":
      "ouch ! please tell us what we can improve",
  "Contact Us": "Contact Us",
  "Submit": "Submit",
  // Logout Popup
  "Are you Sure you want to Logout": "Are you Sure you want to Logout",
  "No": "No",
  "Yes": "Yes",
};

Map<String, String> EE = {
  // VEHICLE BOOKING ENGLISH LANGUAGE  START ----->
  "LetKWYLAWWCGBREATYRB":
      "Let’s Know what you like and where we can get Better. Rat eus adn type your Responses Below.",
  "Category": "Category",
  "PriceRate": "Price Rate",
  "Fuel": "Fuel",
  "Transmission": "Transmission",
  "Seating": "Seating",
  "SUV": "SUV",
  "Sports": "Sports",
  "Coupe": "Coupe",
  "Sedan": "Sedan",
  "Scorpio": "Scorpio",
  "Casual": "Casual",
  "Vintage": "Vintage",
  "PerHourly": "Per Hourly",
  "PerDay": "Per Day",
  "PerKilometer": "Per Kilometer",
  "Gas": "Gas",
  "Diesel": "Diesel",
  "Automatic": "Automatic",
  "Manual": "Manual",
  "FindMC": "Find My Car",
  "SearchFRC": "Search for rental & cars",
  "CarATWL": "Car added to Wish list",
  "Review": "review",
  "PriceR": "Price Rate (₹)",
  "Introduction": "Introduction",
  "CarDetails": "Car Details",
  "CarMake": "Car Make",
  "Color": "Color",
  "LicensePlateNo": "License Plate no",
  "SeatingCapacity": "Seating Capacity",
  "SimilarVehicles": "Similar Vehicles",
  "Wishlist": "Wishlist",
  "RentNow": "Rent Now",
  "Photos": "Photots",
  "Videos": "Videos",
  // VEHICLE BOOKING ENGLISH LANGUAGE  END ----->

  // BOOKINGS ENGLISH LANGUAGE  START ----->
  "SearchForBookings": "Search for Bookings",
  "Upcoming": "Upcoming",
  "Completed": "Completed",
  "BookingDetails": "Booking Details",
  "Off": "off",
  "Address": "Address",
  "Destination": "Destination",
  "TimeAndDate": "Time & Date",
  "Amount": "Amount",
  "ModeOfPayment": "Mode op Payment",
  "CouponCodeApplied": "Coupon code applied",
  "Cancel": "Cancel",
  "PayNow": "Pay Now",
  "TransactionID": "Transaction ID",
  "PaymentSuccessful": "Payment Sucessfull",
  "PaymentTo": "Payment to",
  "Time": "time",
  "PromoCodeApplied": "Promo code applied",
  "PaidAmount": "Paid Amount",
  // BOOKINGS ENGLISH LANGUAGE  END ----->

  // PAYMENT AND ADDRESS LANGUAGE  START ----->
  "WishList": "Wish list",
  "HerAYSCFTBIWASTWLSYCBLE":
      "here are your selected car for the booking , it will auto save to wish list so you can book later easily",
  "Car": "Car",
  "Payment": "Payment",
  "AddAddress": "Add Address",
  "FillOrSelectLocation":
      "fill or select your location and Destination for the the Booking",
  "AddressDefault": "Address( default )",
  "TotalKilometers": "Total Kilometer’s",
  "Kilometers": " Kilometer’s",
  "PerKm": "per km",
  "HereIYBRFASV": "Here is your Booking Review for all Selected Vehicles",
  "SetTimeAndDate": "Set Time & Date",
  "Cash": "Cash",
  "Online": "Online",
  "SaveMoreOnBooking": "Save more on your booking",
  "Apply": "Apply",
  "Applied": "Applied",
  "TaxPercentGST": "Tax % ( GST )",
  "CouponDiscount": "Coupon Discount",
  "SetTime": "Set Time",
  "SetDate": "Set Date",
  "Reset": "Reset",
  // PAYMENT AND ADDRESS LANGUAGE  END ----->

  // ACCOUNT LANGUAGE  START ----->
  "AvailableBalance": "Available Balance",
  "General": "General",
  "Profile": "Profile",
  "MyAddress": "My Address",
  "Language": "Language",
  "MyTransactions": "My Transactions",
  "SettingsAndPrivacy": "Settings & Privacy",
  "PaymentMethods": "Payment Methods",
  "PrivacyPolicy": "Privacy Policy",
  "TermsAndCondition": "Term’s and  Condition",
  "FAQs": "FAQ’s",
  "HelpAndSupport": "Help & Support",
  "RateUs": "Rate Us",
  "Logout": "Logout",
  "PleaseCAAYNDFYBP":
      "Please check and add your necessary details for your booking Profile",
  "EnterYourName": "enter your name",
  "Mobile": "Mobile",
  "Location": "Location",
  "SearchForLanguages": "Search for languages",
  "Transaction": "Transaction",
  "SearchForTransactions": "Search for Transactions",
  "YourSavedAddresses": "Your Saved Addresses",
  "AddNewAddress": "Add New Address",
  "SearchFASA": "Search for available service area",
  "HouseNoBuildingName": "House No. / Building Name",
  "EnterHouseNo": "Enter House No.",
  "AddressTitle": "Address Tittle",
  "ContactName": "Contact Name",
  "ContactNumber": "Contact Number",
  "StillNeedHelpContactUs": "Still need Help ! Contact Us",
  "Q": "Q",
  "A": "Ans",
  "CurrentMethod": "Current Method",
  "DefaultMethod": "Default Method",
  "ChoosYDPMFOPIWYACOAYC":
      "Choose your desired payment method for online payments in which you are comfortable or add your cards",
  "CashOnDelivery": "Cash on Delivery",
  "IncreaseInCharges": "increase in charges",
  "ExpiresOn": "Expires on",
  "UPI": "UPI",
  "AddYourUPIID": "add your UIP ID",
  "EnterYourUPIID": "Enter your UPI ID",
  "Paytm": "Paytm",
  "AddYourMobileNo": "add your mobile no",
  "AddCard": "Add  Card",
  "AddBankCard": "Add Bank Card",
  "AddNewCard": "Add new card",
  "StreamlineCheckoutProcess":
      "Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.",
  "CardNo": "Card no",
  "ExpiryDate": "Expiry Date",
  "CVV": "CVV",
  "MMYY": "MM/YY",
  "CardholdersName": "Cardholder’s name",
  "EnterCardholdersFullName": "enter cardholder’s full name",
  "BankCardAddedSuccessfully": "Bank Card Added Successfully",
  "PleaseWaitForDetails": "please wait we are taking up Required detials",
  "NotificationSetting": "Notification Setting",
  "InAppNotification": "In App Notifcation",
  "GetInAppNotification": "Get Notification Within App",
  "SystemNotification": "System Notification",
  "GetSystemNotification": "Get Notification outside the App",
  "Behaviour": "Behaviour",
  "AllowNTWTD": "Allow Notification to wake the Device",
  "DisableNV": "Disable Notification Vibration",
  "DoNotDisturb": "Do Not Disctrub",
  "YouCCOEASFYCAH":
      "You can connect our experts and support for your conformations and Hleps",
  "CustomerServices": "Customer Services",
  "WhatsApp": "WhatsApp",
  "DeleteMyAccount": "Delete My Account",
  "TollFreeNumber": "Toll Free Number ",
  "CustomerService": "Customer Service",
  "DeleteAccount": "Delete Account",
  "IfYWTDAYAPTPRFDA":
      "If you want to delete Account you are prompted to provide reason for deleting account ",
  "NoLUTSP": "No Longer Uses the Service Platform",
  "FoundBA": "Found a better alternative",
  "TooMEN": "Too many email / notification",
  "DifficultNIP": "Difficult Navigation in Platform",
  "AccountSC": "Account Security Concerns",
  "PersonalReason": "Personal Reason ",
  "Other": "Other",
  "TypeHere": "type here",
  "AreYouSure": "Are you Sure ?",
  "YouWTDYAP": "You Want to Delete your Account Permanently",
  "EnsuringTTUUCTDTALD":
      "Ensuring that the user understands consequences to deleting their Account ( loss of Data )",
  "KeepAccount": "Keep Account",
  "LetsKWYLAWWCGBREATYRB":
      "Let’s Know what you like and where we can get Better. Rat eus adn type your Responses Below.",
  "RateYourExperience": "Rate your experience",
  "OuchPTUWWCI": "ouch ! please tell us what we can improve",
  "ContactUs": "Contact Us",
  "Submit": "Submit",
  "AreYouSureLogout": "Are you Sure you want to Logout",
  "No": "No",
  "Yes": "Yes",
};
class LanguageConst {
  // AUTHENTICATION LANGUAGE CONST START ----->
  // LOGIN
  static const String welcome = "Welcome";
  static const String gladTSy = "GladTSy";
  static const String userE = "UserE";
  static const String enterUE = "EnterUE";
  static const String password = "Password";
  static const String enterP = "EnterP";
  static const String login = "Login";
  static const String forgotP = "ForgotP?";
  static const String or = "or";
  static const String newTRRn = "NewTR!Rn?";
  // REGISTER FORM
  static const String personalD = "PersonalD";
  static const String pleaseFaRdfR = "PleaseFaRdfR";
  static const String name = "Name";
  static const String enterN = "EnterN";
  static const String phoneN = "PhoneN";
  static const String enterYpn = "EnterYpn";
  static const String email = "Email";
  static const String enterYe = "EnterYe";
  static const String next = "Next";
  // REGISTER ADDRESS
  static const String addressD = "AddressD";
  static const String pleaseFaanaD = "PleaseFaanaD";
  static const String title = "Title";
  static const String enterTfyA = "EnterTfyA";
  static const String streetA = "StreetA";
  static const String fillYsa = "FillYsa";
  static const String city = "City";
  static const String select = "Select";
  static const String state = "State";
  static const String country = "Country";
  static const String postalC = "PostalC";
  static const String enterField = "Enter";
  // REGISTER KYC
  static const String kycD = "KYCD";
  static const String skip = "Skip";
  static const String documentT = "DocumentT";
  static const String selectYdt = "SelectYdt";
  static const String documentN = "DocumentN";
  static const String fillYpdn = "FillYpdn";
  static const String documentED = "DocumentED";
  static const String uploadDmax50mb = "UploadD(max50mb)";
  static const String dragODio = "DragODio";
  static const String browse = "Browse?";
  static const String save = "Save";
  // REGISTER POPUP
  static const String accountCS = "AccountCS";
  static const String pleaseWwtaytlp = "PleaseWwtaytlp";
  // FORGOT PASSWORD
  static const String forgotPassword = "ForgotP";
  static const String pleaseEyemoWcsytvc = "PleaseEyemoWcsytvc";
  static const String emailOrMobile = "EmailOm";
  static const String enterUEOM = "enterUEOM";
  static const String continueText = "Continue";
  static const String backToLogin = "BackTL";
  // FORGOT VERIFICATION
  static const String verificationS = "VerificationS";
  static const String weHsavcoD = "WeHsavcoD";
  static const String secL = "SecL";
  static const String resendOTP = "ResendOTP?";
  static const String verify = "Verify";
  // FORGOT NEW PASSWORD
  static const String createNp = "CreateNp";
  static const String pleaseEynpfyas = "PleaseEynpfyas";
  static const String newP = "NewP";
  static const String confirmP = "ConfirmP";
  // FORGOT POPUP
  static const String passwordCS = "PasswordCS";
  // AUTHENTICATION LANGUAGE CONST END ----->

  // HOME LANGUAGE CONST START ----->
  // HOME POPUP
  static const String allowCRTATDL = "AllowCRTATDL";
  static const String tastIMSLSWTTPA = "TASTIMSLSWTTPA";
  static const String precise = "Precise";
  static const String approximate = "Approximate";
  static const String whileUTA = "WhileUTA";
  static const String onlyTT = "OnlyTT";
  static const String dontA = "DontA";
  // HOME SCREEN
  static const String searchFRAC = "SearchFRAC";
  static const String topRC = "TopRC";
  static const String viewA = "ViewA";
  static const String petrol = "Petrol";
  static const String auto = "Auto";
  static const String seats = "Seats";
  static const String seeD = "SeeD";
  static const String myB = "MyB";
  static const String seeA = "SeeA";
  static const String bookingID = "BookingID";
  static const String day = "Day";
  static const String findYCAP = "FindYCAP";
  static const String findMC = "FindMC";
  static const String reviews = "Reviews";
  static const String hrA = "HrA";
  // BOTTOM NAVIGATION BAR TEXT
  static const String home = "Home";
  static const String bookings = "Bookings";
  static const String account = "Account";
  // NOTIFICATIONS SCREEN
  static const String notifications = "Notifications";
  static const String searchFM = "SearchFM";
  static const String booking = "Booking";
  // HOME LANGUAGE CONST END ----->

  // VEHICLE BOOKING LANGUAGE CONST START ----->
  // Filter
  static const category = "category";
  static const priceRate = "priceRate";
  static const fuel = "fuel";
  static const transmission = "transmission";
  static const seating = "seating";
  static const suv = "suv";
  static const sports = "sports";
  static const coupe = "coupe";
  static const sedan = "sedan";
  static const scorpio = "scorpio";
  static const casual = "casual";
  static const vintage = "vintage";
  // Price rate
  static const perHourly = "perHourly";
  static const perDay = "perDay";
  static const perKilometer = "perKilometer";
  // Fuel
  static const gas = "gas";
  static const diesel = "diesel";
  // Transmission
  static const automatic = "automatic";
  static const manual = "manual";
  // Find Car
  static const searchFRC = "searchFRC";
  static const carATWL = "carATWL";
  // Car Perview
  static const review = "review";
  static const priceR = "priceR";
  static const introduction = "introduction";
  static const carDetails = "carDetails";
  static const carMake = "carMake";
  static const color = "color";
  static const licensePlateNo = "licensePlateNo";
  static const seatingCapacity = "seatingCapacity";
  static const similarVehicles = "similarVehicles";
  static const wishlist = "wishlist";
  static const rentNow = "rentNow";
  // Car image and video
  static const photos = "photos";
  static const videos = "videos";
  // VEHICLE BOOKING LANGUAGE CONST  END ----->

  // BOOKINGS  LANGUAGE CONST  START ----->
  // Bookings
  static const searchForBookings = "searchForBookings";
  static const upcoming = "upcoming";
  static const completed = "completed";
  // Booking detail
  static const bookingDetails = "bookingDetails";
  static const off = "off";
  static const address = "address";
  static const destination = "destination";
  static const timeAndDate = "timeAndDate";
  static const amount = "amount";
  static const modeOfPayment = "modeOfPayment";
  static const couponCodeApplied = "couponCodeApplied";
  static const cancel = "cancel";
  static const payNow = "payNow";
  // Payment Sucessfull popup
  static const transactionID = "transactionID";
  static const paymentSuccessful = "paymentSuccessful";
  static const paymentTo = "paymentTo";
  static const time = "time";
  static const promoCodeApplied = "promoCodeApplied";
  static const paidAmount = "paidAmount";
  // BOOKINGS LANGUAGE CONST END ----->

  // PAYMENT AND ADDRESS LANGUAGE CONST  START ----->
  // Wish list
  static const wishList = "wishList";
  static const herAYSCFTBIWASTWLSYCBLE = "herAYSCFTBIWASTWLSYCBLE";
  static const car = "car";
  static const payment = "payment";
  // Add Address
  static const addAddress = "addAddress";
  static const fillOrSelectLocation = "fillOrSelectLocation";
  static const addressDefault = "addressDefault";
  static const totalKilometers = "totalKilometers";
  static const kilometers = "kilometers";
  static const perKm = "perKm";
  // Payment
  static const hereIYBRFASV = "hereIYBRFASV";
  static const setTimeAndDate = "setTimeAndDate";
  static const cash = "cash";
  static const online = "online";
  static const saveMoreOnBooking = "saveMoreOnBooking";
  static const apply = "apply";
  static const applied = "applied";
  static const taxPercentGST = "taxPercentGST";
  static const couponDiscount = "couponDiscount";
  // Date and Time Popup
  static const setTime = "setTime";
  static const setDate = "setDate";
  static const reset = "reset";
  // PAYMENT AND ADDRESS LANGUAGE CONST  END ----->

  // ACCOUNT LANGUAGE CONST  START ----->
  // Account
  static const availableBalance = "availableBalance";
  static const general = "general";
  static const profile = "profile";
  static const myAddress = "myAddress";
  static const language = "language";
  static const myTransactions = "myTransactions";
  static const settingsAndPrivacy = "settingsAndPrivacy";
  static const paymentMethods = "paymentMethods";
  static const privacyPolicy = "privacyPolicy";
  static const termsAndCondition = "termsAndCondition";
  static const faqs = "faqs";
  static const helpAndSupport = "helpAndSupport";
  static const rateUs = "rateUs";
  static const logout = "logout";
  // Profile
  static const pleaseCAAYNDFYBP = "pleaseCAAYNDFYBP";
  static const enterYourName = "enterYourName";
  static const mobile = "mobile";
  static const location = "location";
  // Language
  static const searchForLanguages = "searchForLanguages";
  // Transaction
  static const transaction = "transaction";
  static const searchForTransactions = "searchForTransactions";
  // My Address
  static const yourSavedAddresses = "yourSavedAddresses";
  // Add New Address
  static const addNewAddress = "addNewAddress";
  static const searchFASA = "searchFASA";
  static const houseNoBuildingName = "houseNoBuildingName";
  static const enterHouseNo = "enterHouseNo";
  static const addressTitle = "addressTitle";
  static const contactName = "contactName";
  static const contactNumber = "contactNumber";
  // FAQ’s
  static const stillNeedHelpContactUs = "stillNeedHelpContactUs";
  static const q = "q";
  static const a = "a";
  // Payment Methods
  static const currentMethod = "currentMethod";
  static const defaultMethod = "defaultMethod";
  static const choosYDPMFOPIWYACOAYC = "choosYDPMFOPIWYACOAYC";
  static const cashOnDelivery = "cashOnDelivery";
  static const increaseInCharges = "increaseInCharges";
  static const expiresOn = "expiresOn";
  static const upi = "upi";
  static const addYourUPIID = "addYourUPIID";
  static const enterYourUPIID = "enterYourUPIID";
  static const paytm = "paytm";
  static const addYourMobileNo = "addYourMobileNo";
  // Add card
  static const addCard = "addCard";
  static const addBankCard = "addBankCard";
  static const addNewCard = "addNewCard";
  static const streamlineCheckoutProcess = "streamlineCheckoutProcess";
  static const cardNo = "cardNo";
  static const expiryDate = "expiryDate";
  static const cvv = "cvv";
  static const mmyy = "mmyy";
  static const cardholdersName = "cardholdersName";
  static const enterCardholdersFullName = "enterCardholdersFullName";
  // Bank Popup
  static const bankCardAddedSuccessfully = "bankCardAddedSuccessfully";
  static const pleaseWaitForDetails = "pleaseWaitForDetails";
  // Notification
  static const notificationSetting = "notificationSetting";
  static const inAppNotification = "inAppNotification";
  static const getInAppNotification = "getInAppNotification";
  static const systemNotification = "systemNotification";
  static const getSystemNotification = "getSystemNotification";
  static const behaviour = "behaviour";
  static const allowNTWTD = "allowNTWTD";
  static const disableNV = "disableNV";
  static const doNotDisturb = "doNotDisturb";
  // Help & Support
  static const youCCOEASFYCAH = "youCCOEASFYCAH";
  static const customerServices = "customerServices";
  static const whatsApp = "whatsApp";
  static const deleteMyAccount = "deleteMyAccount";
  static const tollFreeNumber = "tollFreeNumber";
  // Customer Service
  static const customerService = "customerService";
  // Delete Account
  static const deleteAccount = "deleteAccount";
  static const ifYWTDAYAPTPRFDA = "ifYWTDAYAPTPRFDA";
  static const noLUTSP = "noLUTSP";
  static const foundBA = "foundBA";
  static const tooMEN = "tooMEN";
  static const difficultNIP = "difficultNIP";
  static const accountSC = "accountSC";
  static const personalReason = "personalReason";
  static const other = "other";
  static const typeHere = "typeHere";
  // Delete Account Popup
  static const areYouSure = "areYouSure";
  static const youWTDYAP = "youWTDYAP";
  static const ensuringTTUUCTDTALD = "ensuringTTUUCTDTALD";
  static const keepAccount = "keepAccount";
  // Rate us Popup
  static const letsKWYLAWWCGBREATYRB = "letsKWYLAWWCGBREATYRB";
  static const rateYourExperience = "rateYourExperience";
  static const ouchPTUWWCI = "ouchPTUWWCI";
  static const contactUs = "contactUs";
  static const submit = "submit";
  // Logout Popup
  static const areYouSureLogout = "areYouSureLogout";
  static const no = "no";
  static const yes = "yes";
  // ACCOUNT LANGUAGE CONST  END ----->
}
