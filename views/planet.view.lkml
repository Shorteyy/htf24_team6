view: planet {
  sql_table_name: `planets_dataset.planet` ;;
  drill_fields: [planet_id]

  dimension: planet_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.planet_id ;;
  }
  dimension: dec_deg {
    type: number
    sql: ${TABLE}.dec_deg ;;
  }
  dimension: dec_sexagesimal {
    type: string
    sql: ${TABLE}.dec_sexagesimal ;;
  }
  dimension: eccentricity {
    type: number
    sql: ${TABLE}.eccentricity ;;
  }
  dimension: equilibrium_temperature_k {
    type: number
    sql: ${TABLE}.equilibrium_temperature_k ;;
  }
  dimension: facility_id {
    type: number
    sql: ${TABLE}.facility_id ;;
  }
  dimension: gaia_magnitude {
    type: number
    sql: ${TABLE}.gaia_magnitude ;;
  }
  dimension: gaia_magnitude_lower_unc {
    type: number
    sql: ${TABLE}.gaia_magnitude_lower_unc ;;
  }
  dimension: gaia_magnitude_upper_unc {
    type: number
    sql: ${TABLE}.gaia_magnitude_upper_unc ;;
  }
  dimension: host_id {
    type: number
    sql: ${TABLE}.host_id ;;
  }
  dimension: impact_parameter {
    type: number
    sql: ${TABLE}.impact_parameter ;;
  }
  dimension: inclination_deg {
    type: number
    sql: ${TABLE}.inclination_deg ;;
  }
  dimension: insolation_flux_earth {
    type: number
    sql: ${TABLE}.insolation_flux_earth ;;
  }
  dimension: ks_2mass_magnitude {
    type: number
    sql: ${TABLE}.ks_2mass_magnitude ;;
  }
  dimension: orbit_semi_major_axis_au {
    type: number
    sql: ${TABLE}.orbit_semi_major_axis_au ;;
  }
  dimension: orbital_period_days {
    type: number
    sql: ${TABLE}.orbital_period_days ;;
  }
  dimension: planet_density {
    type: number
    sql: ${TABLE}.planet_density ;;
  }
  dimension: planet_mass_earth {
    type: number
    sql: ${TABLE}.planet_mass_earth ;;
  }
  dimension: planet_mass_jupiter {
    type: number
    sql: ${TABLE}.planet_mass_jupiter ;;
  }
  dimension: planet_mass_provenance {
    type: string
    sql: ${TABLE}.planet_mass_provenance ;;
  }
  dimension: planet_name {
    type: string
    sql: ${TABLE}.planet_name ;;
  }
  dimension: planet_radius_earth {
    type: number
    sql: ${TABLE}.planet_radius_earth ;;
  }
  dimension: planet_radius_jupiter {
    type: number
    sql: ${TABLE}.planet_radius_jupiter ;;
  }
  dimension: ra_deg {
    type: number
    sql: ${TABLE}.ra_deg ;;
  }
  dimension: ra_sexagesimal {
    type: string
    sql: ${TABLE}.ra_sexagesimal ;;
  }
  dimension: spectral_type {
    type: string
    sql: ${TABLE}.spectral_type ;;
  }
  dimension: v_johnson_magnitude {
    type: number
    sql: ${TABLE}.v_johnson_magnitude ;;
  }
  dimension: stellar_flux {
    type: number
    sql:ROUND(${star.stellar_luminosity} / (4 * 3.141592 * POWER(${orbit_semi_major_axis_au}, 2)),2) ;;
  }
  dimension: habitable_dim {
    type: yesno
    sql: ${habitable} ;;
  }
  measure: count {
    type: count
    drill_fields: [planet_id, planet_name]
  }

  measure: habitable_count {
    type: count
    filters: [habitable: "yes"]
  }

  measure: non_habitable_count {
    type: count
    filters: [habitable: "no"]
  }

  filter: habitable_mass {
    sql: ${planet_mass_earth} > 0.1 AND ${planet_mass_earth} < 10 ;;
  }

  filter: habitable_radius {
    sql:${planet_radius_earth} > 0.5 AND ${planet_radius_earth} < 2.5;;
  }

  filter: habitable_equilibrium {
    sql: ${equilibrium_temperature_k} > 175 AND ${equilibrium_temperature_k} < 274 ;;
  }

  filter: habitable_eccentricity {
    sql: ${eccentricity} < 0.2 ;;
  }

  filter: habitable_density {
    sql: ${planet_density} > 1 ;;
  }

  filter: habitable_stellar_flux {
    sql: ${stellar_flux} >0.7 AND ${stellar_flux} <1.3 ;;
  }

  filter: habitable {
    sql:
    ${planet_mass_earth} > 0.1 AND ${planet_mass_earth} < 10 AND
    ${planet_radius_earth} > 0.5 AND ${planet_radius_earth} < 2.5 AND
    ${equilibrium_temperature_k} > 175 AND ${equilibrium_temperature_k} < 274 AND
    ${eccentricity} < 0.2 AND
    ${planet_density} > 1;;
  }


  filter: habitable_with_slack_5 {
    sql:
    ${planet_mass_earth} > (0.1 * 0.95) AND ${planet_mass_earth} < (10 * 1.05) AND
    ${planet_radius_earth} > (0.5 * 0.95) AND ${planet_radius_earth} < (2.5 * 1.05) AND
    ${equilibrium_temperature_k} > (175 * 0.95) AND ${equilibrium_temperature_k} < (274 * 1.05) AND
    ${eccentricity} < 0.2 AND
    ${planet_density} > (1 * 0.95);;
  }

  filter: habitable_with_slack_10 {
    sql:
    ${planet_mass_earth} > (0.1 * 0.90) AND ${planet_mass_earth} < (10 * 1.10) AND
    ${planet_radius_earth} > (0.5 * 0.90) AND ${planet_radius_earth} < (2.5 * 1.10) AND
    ${equilibrium_temperature_k} > (175 * 0.90) AND ${equilibrium_temperature_k} < (274 * 1.10) AND
    ${eccentricity} < 0.2 AND
    ${planet_density} > (1 * 0.95);;
  }


  filter: habitable_with_slack_15 {
    sql:
    ${planet_mass_earth} > (0.1 * 0.85) AND ${planet_mass_earth} < (10 * 1.15) AND
    ${planet_radius_earth} > (0.5 * 0.85) AND ${planet_radius_earth} < (2.5 * 1.15) AND
    ${equilibrium_temperature_k} > (175 * 0.85) AND ${equilibrium_temperature_k} < (274 * 1.15) AND
    ${eccentricity} < 0.2 AND
    ${planet_density} > (1 * 0.85);;
  }



dimension: dim_habitable {
  type: yesno
    sql:
    ${planet_mass_earth} > 0.1 AND ${planet_mass_earth} < 10 AND
    ${planet_radius_earth} > 0.5 AND ${planet_radius_earth} < 2.5 AND
    ${equilibrium_temperature_k} > 175 AND ${equilibrium_temperature_k} < 274 AND
    ${eccentricity} < 0.2 AND
    ${planet_density} > 1;;
}



  measure: average_mass {
    type: average
    sql: ${TABLE}.planet_mass_earth ;;
  }
}
