view: discovery_facility {
  sql_table_name: `planets_dataset.discovery_facility` ;;

  dimension: discovery_facility {
    type: string
    sql: ${TABLE}.discovery_facility ;;
  }
  dimension: facility_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.facility_id ;;
  }
  measure: count {
    type: count
  }
  measure: succes_rate {
    type: sum
    sql: ${planet.facility_id} ;;
  }

  measure: habitable_count {
    type: count_distinct
    filters: [planet.habitable_dim: "yes"]
    sql: ${TABLE}.facility_id ;;
  }

  measure: count_planets {
    type: count_distinct
    sql: ${planet.planet_id} ;;
  }

  measure: accuracy {
    type: number
    sql: CASE
            WHEN ${count} > 0 THEN ${habitable_count} / ${planet.count}
            ELSE NULL
          END ;;
  }
}
