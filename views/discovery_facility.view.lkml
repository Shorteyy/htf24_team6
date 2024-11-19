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
}
