const String rocketsQuery = '''
    query Rockets {
      rockets {
        company
        country
        description
        payload_weights {
          kg
        }
        success_rate_pct
        name
        mass {
          kg
        }
        active
        diameter {
          meters
        }
      }
    }
  ''';
