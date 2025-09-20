const String launchesQuery = '''
    query Launches {
     launches {
    mission_name
    launch_date_local
    launch_site {
      site_name_long
    }
    rocket {
      rocket_name
      first_stage {
        cores {
          core {
            status
          }
        }
      }
    }
    links {
      article_link
      video_link
    }
  }
    }
  ''';
