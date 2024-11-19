view: discovery_telescope {
  sql_table_name: `planets_dataset.discovery_telescope` ;;

  dimension: discovery_telescope {
    type: string
    sql: ${TABLE}.discovery_telescope ;;
  }
  dimension: facility_id {
    type: number
    sql: ${TABLE}.facility_id ;;
  }
  dimension: telescope_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.telescope_id ;;
  }
  measure: count {
    type: count
  }
  # Measure: count of habitable planets discovered by the telescope
  measure: habitable_count {
    type: count_distinct
    filters: [planet.habitable_dim: "yes"]
    sql: ${TABLE}.telescope_id ;;
  }

  # Measure: accuracy of the telescope (habitable planet detection rate)
  measure: accuracy {
    type: number
    sql: CASE
            WHEN ${count} > 0 THEN ${habitable_count} / ${planet.count}
            ELSE NULL
          END ;;
  }
}
