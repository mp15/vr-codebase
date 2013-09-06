ALTER TABLE lane MODIFY auto_qc_status enum('no_qc','passed','failed','warning') DEFAULT 'no_qc'; 
ALTER TABLE library MODIFY auto_qc_status enum('no_qc','passed','failed','warning') DEFAULT 'no_qc';

DROP VIEW if EXISTS `latest_lane`;
DROP VIEW if EXISTS `latest_library`;
create view latest_lane as select * from lane where latest=true;
create view latest_library as select * from library where latest=true;

update schema_version set schema_version='25';

