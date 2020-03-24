const String pxEmployeeByEmail = r'''
  query listPxEmployeeDevs {
    result: listPxEmployeeDevs {
      employee: items {
        candidateId
        address {
          city
          country
          kecamatan
          kelurahan
          letterAddress
          province
          RT
          RW
          street
          type
          zipCode
        }
        benefit
        birthDate
        birthPlace
        company
        education {
          degree
          discipline
          endDate
          faculty
          schoolName
          startDate
        }
        emailAddressOffice
        emailAddressPersonal
        firstName
        fullName
        gender
        identity {
          expired
          file
          number
          type
        }
        isIntro
        isSigned
        isWNA
        jobs
        joinDate
        lastName
        middleName
        onBoardingDate
        phoneNumber {
          type
          value
        }
        recruiter
        renumer {
          currency
          type
          value
        }
      }
    }
  }
''';
