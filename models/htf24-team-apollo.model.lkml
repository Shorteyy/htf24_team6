connection: "htf2024"

# Include all views
include: "/views/**/*.view.lkml"

# Explore for Discovery Facility
explore: discovery_facility {
  join: planet {
    type: left_outer
    relationship: one_to_many
    sql_on: ${discovery_facility.facility_id} = ${planet.facility_id} ;;
  }
  join: discovery_telescope {
    type: left_outer
    relationship: one_to_many
    sql_on: ${discovery_facility.facility_id} = ${discovery_telescope.facility_id} ;;
  }
  join: star {
    type: inner
    relationship: many_to_one
    sql_on: ${planet.host_id} = ${star.host_id} ;;
  }
}

# Explore for Discovery Telescope
explore: discovery_telescope {
  # Join planet to count habitable planets detected by each telescope
  join: planet {
    type: left_outer
    relationship: one_to_many
    sql_on: ${discovery_telescope.facility_id} = ${planet.facility_id} ;;
  }

  # Join star to access star details related to planets
  join: star {
    type: inner
    relationship: many_to_one
    sql_on: ${planet.host_id} = ${star.host_id} ;;
  }

  # Optional: You can also join discovery_facility if you need more details about the facility
  join: discovery_facility {
    type: left_outer
    relationship: one_to_many
    sql_on: ${discovery_telescope.facility_id} = ${discovery_facility.facility_id} ;;
  }
}


# Explore for Planets
explore: planet {
  join: star {
    type: inner
    relationship: many_to_one
    sql_on: ${planet.host_id} = ${star.host_id} ;;
  }
}

# Explore for Star (if needed for star data)
explore: star {}
