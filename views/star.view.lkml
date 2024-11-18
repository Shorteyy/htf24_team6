view: star {
  sql_table_name: `planets_dataset.star` ;;

  dimension: distance_pc {
    type: number
    sql: ${TABLE}.distance_pc ;;
  }
  dimension: host_id {
    type: number
    sql: ${TABLE}.host_id ;;
  }
  dimension: host_name {
    type: string
    sql: ${TABLE}.host_name ;;
  }
  dimension: number_of_planets {
    type: number
    sql: ${TABLE}.number_of_planets ;;
  }
  dimension: number_of_stars {
    type: number
    sql: ${TABLE}.number_of_stars ;;
  }
  dimension: stellar_effective_temperature_k {
    type: number
    sql: ${TABLE}.stellar_effective_temperature_k ;;
  }
  dimension: stellar_luminosity {
    type: number
    sql: ${TABLE}.stellar_luminosity ;;
  }
  dimension: stellar_mass_solar {
    type: number
    sql: ${TABLE}.stellar_mass_solar ;;
  }
  dimension: stellar_surface_gravity {
    type: number
    sql: ${TABLE}.stellar_surface_gravity ;;
  }
  measure: count {
    type: count
    drill_fields: [host_name]
  }
}
