const String launchpadsQuery = '''
    query Launchpads {
        launchpads {
    attempted_launches
    details
    id
    name
    status
    successful_launches
    wikipedia
  }
      }
  ''';
