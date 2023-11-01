const String defaultAssetImage ='';
const String emptyEmailField = 'Email address cannot be empty';
const String emptyTextField = 'Field cannot be empty!';
const String emptyPasswordField = 'Password cannot be empty';
const String invalidEmailField =
    'Email provided isn\'t valid.Try another email address';
const String passwordLengthError = 'Password length must be greater than 8';
const String emptyUsernameField = 'Name  cannot be empty';
const String usernameLengthError = 'Username length must be greater than 5';
// ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, unnecessary_string_escapes
const String emailRegex = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' +
    '\\@' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
    '(' +
    '\\.' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
    ')+';
const String phoneNumberRegex = r'0[789][01]\d{8}';
const String upperCaseRegex = r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$';
const String lowerCaseRegex = r'^(?=.*?[a-z]).{8,}$';
const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{8,}$';
const String digitRegex = r'^(?=.*?[0-9]).{8,}$';
const String passwordDigitError = 'Password must have at least one digit';
const String passwordUppercaseError =
    'Password must have at least one Upper case';
const String passwordSymbolError =
    'Password must have a least one special character';
const String phoneNumberLengthError = 'Phone number must be 11 digits';
const String invalidPhoneNumberField =
    'Number provided isn\'t valid.Try another phone number';
const String emailVerificationUnauthenticated = 'Unauthenticated.';
const String createAccountSuccess = 'User Created Successfully';
const String imagesBasePath = 'assets/images';
const String iconsBasePath = 'assets/icons';
const String signUpPasswordMessage =
    'Password must have at least 8 characters with a mix of uppercase and lowercase characters, digits and symbols';
const String chatGptSummaryPrompt =
    'Identify the 3-5 most interesting topics discussed in the following conversation and the relevant timestamps to listen to them: Format your response using a JSON key-value pair data structure with a \'data\' key which contains a list of these topics. Each item in the list will also be in JSON format and will contain the title for the topic, its description, and both the start and end times. For example, the format for each item in the list would be: { "topic": "", "description": "", "start": 0.0, "end": 0.0 }. Make sure datatype of "start" and "end" keys are double.\nHere is the conversation: ';
const String uploadRecordingInstruction =
    'Select an audio or video file to upload. If video, only the audio portion will be used';
const String inspireMeGuide =
    'Generate topics to help spark a conversation';
const String nudgeResponseMailError =
    'Response email for nudging could not be sent. Please try again later.';
const String deletePersonWarning =
    'Are you sure you want to delete this person? You will no longer be able to access their stories.';
const String removePersonWarning =
    'Are you sure you want to remove this person? You will no longer be able to access their stories.';
const String reminderNotificationBody = 'Never a better time than now to record and remember';

