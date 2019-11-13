SELECT na.arrestee_id as arrestee_id
	, na.incident_id as arrestee_incident_id
	, na.arrest_date as arrest_date
	, nat.arrest_type_name as arrest_type_name
	, noti.offense_name as offense_name
	, na.age_num as arrestee_age_num
	, na.sex_code as arrestee_sex_code
	, rr.race_desc as arrestee_race_desc
	, nlt.location_name as arrestee_location_name
	, nv.victim_id as victim_id
	, nvict.victim_type_name as victim_type_name
	, nv.age_num as victim_age_num
	, nv.sex_code as victim_sex_code
	, rrr.race_desc as victim_race_desc
	, nii.agency_id as agency_id
	, ca.ncic_agency_name as agency_name
	, nw.weapon_name as weapon_name
FROM nibrs_arrestee na 
JOIN nibrs_victim nv ON na.incident_id = nv.incident_id
JOIN nibrs_arrest_type nat ON nat.arrest_type_id = na.arrest_type_id
JOIN nibrs_offense_type noti ON noti.offense_type_id = na.offense_type_id
JOIN nibrs_age age ON age.age_id = na.age_id
JOIN ref_race rr ON na.race_id = rr.race_id
JOIN nibrs_offense noff ON na.incident_id = noff.incident_id
JOIN nibrs_location_type nlt ON noff.location_id = nlt.location_id
JOIN nibrs_victim_type nvict ON nv.victim_type_id = nvict.victim_type_id
JOIN ref_race rrr ON nv.race_id = rrr.race_id
JOIN nibrs_incident nii ON na.incident_id = nii.incident_id
JOIN agencies ca ON ca.agency_id = nii.agency_id
JOIN nibrs_weapon nww ON nww.offense_id = noff.offense_id
JOIN nibrs_weapon_type nw ON nw.weapon_id = nww.weapon_id

WHERE noti.offense_type_id IN (1, 32, 38)