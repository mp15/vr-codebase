ALTER TABLE `study` CHANGE COLUMN `study_id` `study_id` INT UNSIGNED NOT NULL AUTO_INCREMENT  ;
ALTER TABLE `project` CHANGE COLUMN `project_id` `project_id` INT UNSIGNED NOT NULL DEFAULT '0'  , CHANGE COLUMN `study_id` `study_id` INT NULL DEFAULT NULL  ;
ALTER TABLE `sample` CHANGE COLUMN `sample_id` `sample_id` INT UNSIGNED NOT NULL DEFAULT '0'  , CHANGE COLUMN `project_id` `project_id` INT UNSIGNED NOT NULL DEFAULT '0'  ;
ALTER TABLE `library` CHANGE COLUMN `library_id` `library_id` INT UNSIGNED NOT NULL DEFAULT '0'  , CHANGE COLUMN `sample_id` `sample_id` INT UNSIGNED NOT NULL DEFAULT '0'  ;
ALTER TABLE `lane` CHANGE COLUMN `lane_id` `lane_id` INT UNSIGNED NOT NULL DEFAULT '0'  , CHANGE COLUMN `library_id` `library_id` INT UNSIGNED NOT NULL DEFAULT '0'  ;
ALTER TABLE `file` CHANGE COLUMN `file_id` `file_id` INT UNSIGNED NOT NULL DEFAULT '0'  , CHANGE COLUMN `lane_id` `lane_id` INT UNSIGNED NOT NULL DEFAULT '0'  ;
ALTER TABLE `seq_request` CHANGE COLUMN `library_id` `library_id` INT UNSIGNED NULL DEFAULT NULL  ;
ALTER TABLE `library_multiplex_pool` CHANGE COLUMN `library_id` `library_id` INT UNSIGNED NOT NULL DEFAULT '0'  ;
ALTER TABLE `mapstats` CHANGE COLUMN `mapstats_id` `mapstats_id` INT UNSIGNED NOT NULL DEFAULT '0'  , CHANGE COLUMN `lane_id` `lane_id` INT UNSIGNED NOT NULL DEFAULT '0'  ;
ALTER TABLE `autoqc` CHANGE COLUMN `mapstats_id` `mapstats_id` INT UNSIGNED NOT NULL DEFAULT '0'  ;


DROP VIEW IF EXISTS `latest_project`;
DROP VIEW IF EXISTS `latest_sample`;
DROP VIEW if EXISTS `latest_lane`;
DROP VIEW if EXISTS `latest_library`;
DROP VIEW IF EXISTS `latest_file`;
DROP VIEW IF EXISTS `latest_mapstats`;
create view latest_mapstats AS SELECT * FROM mapstats WHERE latest=true;
create view latest_file AS SELECT * FROM file WHERE latest=true;
create view latest_lane as select * from lane where latest=true;
create view latest_library as select * from library where latest=true;
create view latest_sample as select * from sample where latest=true;
create view latest_project as select * from project where latest=true;


update schema_version set schema_version='26';

