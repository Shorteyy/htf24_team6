view: raw_planets {
  sql_table_name: `planets_dataset.raw_planets` ;;

  dimension: dec {
    type: number
    sql: ${TABLE}.dec ;;
  }
  dimension: decstr {
    type: string
    sql: ${TABLE}.decstr ;;
  }
  dimension: disc_facility {
    type: string
    sql: ${TABLE}.disc_facility ;;
  }
  dimension: disc_telescope {
    type: string
    sql: ${TABLE}.disc_telescope ;;
  }
  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }
  dimension: pl_bmasse {
    type: number
    sql: ${TABLE}.pl_bmasse ;;
  }
  dimension: pl_bmassj {
    type: number
    sql: ${TABLE}.pl_bmassj ;;
  }
  dimension: pl_bmassprov {
    type: string
    sql: ${TABLE}.pl_bmassprov ;;
  }
  dimension: pl_dens {
    type: number
    sql: ${TABLE}.pl_dens ;;
  }
  dimension: pl_eqt {
    type: number
    sql: ${TABLE}.pl_eqt ;;
  }
  dimension: pl_imppar {
    type: number
    sql: ${TABLE}.pl_imppar ;;
  }
  dimension: pl_insol {
    type: number
    sql: ${TABLE}.pl_insol ;;
  }
  dimension: pl_name {
    type: string
    sql: ${TABLE}.pl_name ;;
  }
  dimension: pl_orbeccen {
    type: number
    sql: ${TABLE}.pl_orbeccen ;;
  }
  dimension: pl_orbincl {
    type: number
    sql: ${TABLE}.pl_orbincl ;;
  }
  dimension: pl_orbper {
    type: number
    sql: ${TABLE}.pl_orbper ;;
  }
  dimension: pl_orbsmax {
    type: number
    sql: ${TABLE}.pl_orbsmax ;;
  }
  dimension: pl_rade {
    type: number
    sql: ${TABLE}.pl_rade ;;
  }
  dimension: pl_radj {
    type: number
    sql: ${TABLE}.pl_radj ;;
  }
  dimension: ra {
    type: number
    sql: ${TABLE}.ra ;;
  }
  dimension: rastr {
    type: string
    sql: ${TABLE}.rastr ;;
  }
  dimension: st_logg {
    type: number
    sql: ${TABLE}.st_logg ;;
  }
  dimension: st_lum {
    type: number
    sql: ${TABLE}.st_lum ;;
  }
  dimension: st_mass {
    type: number
    sql: ${TABLE}.st_mass ;;
  }
  dimension: st_spectype {
    type: string
    sql: ${TABLE}.st_spectype ;;
  }
  dimension: st_teff {
    type: number
    sql: ${TABLE}.st_teff ;;
  }
  dimension: sy_dist {
    type: number
    sql: ${TABLE}.sy_dist ;;
  }
  dimension: sy_gaiamag {
    type: number
    sql: ${TABLE}.sy_gaiamag ;;
  }
  dimension: sy_gaiamagerr1 {
    type: number
    sql: ${TABLE}.sy_gaiamagerr1 ;;
  }
  dimension: sy_gaiamagerr2 {
    type: number
    sql: ${TABLE}.sy_gaiamagerr2 ;;
  }
  dimension: sy_kmag {
    type: number
    sql: ${TABLE}.sy_kmag ;;
  }
  dimension: sy_pnum {
    type: number
    sql: ${TABLE}.sy_pnum ;;
  }
  dimension: sy_snum {
    type: number
    sql: ${TABLE}.sy_snum ;;
  }
  dimension: sy_vmag {
    type: number
    sql: ${TABLE}.sy_vmag ;;
  }
  dimension: ttv_flag {
    type: number
    sql: ${TABLE}.ttv_flag ;;
  }
  measure: count {
    type: count
    drill_fields: [hostname, pl_name]
  }
}
