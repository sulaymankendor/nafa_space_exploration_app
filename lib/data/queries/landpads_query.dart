const String landpadsQuery = '''
    query Landpads {
      landpads {
    attempted_landings
    details
    full_name
    id
    landing_type
    location {
      name
    }
    status
    successful_landings
    wikipedia
  }
      }
  ''';
