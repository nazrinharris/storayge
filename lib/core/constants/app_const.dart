// ignore_for_file: constant_identifier_names

/// [Hive] paths, Entries and Boxes.
///
/// Do not change.
const String HIVE_BOX_STORAYGE_USER = 'storayge_user';
const String HIVE_BOX_SHELF = 'shelf';

const String HIVE_KEY_IS_FIRST_TIME_OPENING_APP = 'isFirstTimeOpeningApp';
const String HIVE_KEY_STORAYGE_USER = 'current_storayge_user';

/// [CloudFirestore] collection and subcollection paths.
///
/// Do not change.
const String FIRESTORE_USER_COLLECTION = 'users';
const String FIRESTORE_SHELF_COLLECTION = 'shelf';

/// [FirebaseException] plugins.
///
/// These have been set manually and can be changed but it is advised not to.
const String FIRESTORE_PLUGIN = 'cloud_firestore';

/// [FirebaseException] Messages and Codes
///
/// Can be modified but care must be taken to not change it's purpose
const String FIRESTORE_ERROR_DOCUMENT_NOT_FOUND =
    'FIRESTORE_ERROR_DOCUMENT_NOT_FOUND';
const String FIRESTORE_MESSAGE_DOCUMENT_NOT_FOUND =
    'Sorry, but the firestore document does not exist';

/// Local App [ErrorCodes]
///
/// Do not change.
const String ERROR_NO_INTERNET_CONNECTION = 'ERROR_NO_INTERNET_CONNECTION';
const String ERROR_NOT_SAME_PASSWORD = 'ERROR_NOT_SAME_PASSWORD';
const String ERROR_USER_NOT_FOUND = 'ERROR_USER_NOT_FOUND';
const String ERROR_UNKNOWN_OCCURED = 'ERROR_UNKNOWN_OCCURED';
const String ERROR_EMAIL_ALREADY_USED = 'ERROR_EMAIL_ALREADY_USED';

/// Local App [ErrorMessages]
///
/// Can be changed.
const String MESSAGE_NO_INTERNET_CONNECTION =
    'Sorry, it seems like you are not connected to the internet, please try again';
const String MESSAGE_NOT_SAME_PASSWORD =
    'Sorry, the passwords you entered are not the same';
const String MESSAGE_USER_NOT_FOUND = 'Sorry, you are not logged in';
const String MESSAGE_EMAIL_ALREADY_IN_USE =
    'Sorry, this email is already in use';

/// Local App [OperationMessages]
///
/// Can be changed
/// //! Cabinet
const String OPERATION_MESSAGE_GET_SHELF =
    'Currently retrieving requested Shelf';
const String OPERATION_MESSAGE_STORE_SHELF = 'Currently saving requested Shelf';

/// //! Auth
const String OPERATION_MESSAGE_REGISTER_WITH_EMAIL_AND_PASSWORD =
    'Currently registering your account';
const String OPERATION_MESSAGE_LOGIN_WITH_EMAIL_AND_PASSWORD =
    'Currently logging into your account';
