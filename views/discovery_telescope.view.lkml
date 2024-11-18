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
    sql: ${TABLE}.telescope_id ;;
  }
  measure: count {
    type: count
  }
}
