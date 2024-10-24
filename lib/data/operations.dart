class Operations {
  static const String register = r'''
mutation Register($registerData: RegisterDto!) {
  register(registerData: $registerData) {
    id
    name
    mobileNo
    email
    age
    feet
    inches
    weight
    isLoggedIn
    lastMenstrualDate
    createdBy
    createdAt
    updatedAt
    userType
    slug
    parentId
    superParentId
    state
    district
    city
    tehsil
    maternityId
  }
}
''';

  static const String addFamilyMember =
      r'''mutation CreateFamilyMember($createUserDto: FamilyMemberDto!) {
  createFamilyMember(createUserDto: $createUserDto) {
    id
    name
    mobileNo
    email
    age
    height
    weight
    status
    createdBy
    createdAt
    updatedAt
    parentId
    superParentId
    state
    district
    city
    tehsil
    maternityId
  }
}''';

  static const String editProfile =
      r'''mutation EditProfile($data: UpdateUserDto!) {
  editProfile(data: $data) {
    id
    name
    mobileNo
    email
    age
    feet
    inches
    weight
    status
    isLoggedIn
    lastMenstrualDate
    createdBy
    createdAt
    updatedAt
    userType
    slug
    parentId
    superParentId
    state
    district
    city
    tehsil
    maternityId
  }
}''';

  static const String getFamily = r'''
query GetFamilyMembers($parentId: Int!) {
  getFamilyMembers(parentId: $parentId) {
     id
    name
    mobileNo
    email
    age
    feet
    inches
    weight
    status
    isLoggedIn
    lastMenstrualDate
    createdBy
    createdAt
    updatedAt
    userType
    slug
    parentId
    superParentId
    state
    district
    city
    tehsil
    maternityId
  }
}
''';
  static const String otpRequest = r'''
 mutation RequestOtp($otpRequestData: OtpRequestDto!) {
  requestOtp(otpRequestData: $otpRequestData){
    otp
  }
}
  ''';
  static const String login = r'''
  mutation Login($loginData: LoginDto!) {
  login(loginData: $loginData) {
    accessToken
    user {
      age
      createdAt
      email
      height
      id
      lastMenstrualDate
      mobileNo
      name
      updatedAt
      weight
      maternityId
      userType
    }
  }
}
   ''';

  static const String newLogin = r'''
  mutation LoginMobile($loginData: LoginDtoMobile!) {
  loginMobile(loginData: $loginData) {
    user {
      id
      name
      mobileNo
      email
      age
      feet
      inches
      weight
      status
      isLoggedIn
      lastMenstrualDate
      createdBy
      createdAt
      updatedAt
      userType
      slug
      parentId
      superParentId
      state
      district
      city
      tehsil
      maternityId
    }
    accessToken
  }
}
  ''';

  static const String ancCheckup = r'''
query GetCheckupsByMaternityId($maternityId: Float!) {
  getCheckupsByMaternityId(maternityId: $maternityId) {
    id
    maternityId
    weekNumber
    weight
    bloodPressure
    hemoGlobin
    testDate
    createdAt
    updatedAt
    isCompleted
  }
}
''';

  static const String updateAncCheckup = r'''
mutation SubmitWeeklyCheckup($maternityId: Float!, $weekNumber: Float!, $formData: UpdateCheckupInformationDto!) {
  submitWeeklyCheckup(maternityId: $maternityId, weekNumber: $weekNumber, formData: $formData) {
    id
    maternityId
    weekNumber
    weight
    bloodPressure
    hemoGlobin
    testDate
    isCompleted
    createdAt
    updatedAt
  }
}''';

  static const String maternity =
      r'''query FindMaternityById($findMaternityByIdId: Float!) {
  findMaternityById(id: $findMaternityByIdId) {
    id
    name
    age
    bmi
    expectedDateOfDelivery
    lastMenstrualDate
    createdAt
    updatedAt
    userId
    highRisks {
      id
      highBloodPressure
      gestationalDiabetes
      highBloodPressure
      priorCaesareanOperation
      severeAnemia
      teenagePregnancy
      maternityId
      createdAt
      updatedAt
    }
  }
}''';
static const String PagiganationUser = r'''
query PaginatedPatients($paginationInput: UserPaginationInput!) {
  paginatedPatients(paginationInput: $paginationInput) {
    meta {
      totalItems
      totalPages
      currentPage
      limit
    }
    data {
      id
      name
      mobileNo
      email
      age
      feet
      inches
      weight
      status
      isLoggedIn
      lastMenstrualDate
      createdBy
      createdAt
      updatedAt
      userType
      slug
      parentId
      superParentId
      state
      district
      city
      tehsil
      maternityId
    }
  }
}''';
}
