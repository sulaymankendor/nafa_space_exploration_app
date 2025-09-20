const String capsulesQuery = '''
    query Capsules {
     capsules {
    id
    landings
    original_launch
    reuse_count
    status
    type
    dragon {
      description
      crew_capacity
      active
      id
      launch_payload_mass {
        kg
      }
      name
      wikipedia
    }
    missions {
      name
      flight
    }
  }
    }
  ''';
