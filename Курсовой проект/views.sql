/*Представление сводным стат данным */
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `summary_stats` AS
    SELECT 
        `main_table`.`mon` AS `mon`,
        `main_table`.`yea` AS `yea`,
        `main_table`.`orders` AS `orders`,
        `main_table`.`rides` AS `rides`,
        `main_table`.`MAU_pass` AS `MAU_pass`,
        `main_table`.`MAU_drivers` AS `MAU_drivers`,
        `main_table`.`total_gmv` AS `total_gmv`,
        (`main_table`.`orders` / `main_table`.`MAU_pass`) AS `AVG_orders_per_pass`,
        (`main_table`.`orders` / `main_table`.`MAU_drivers`) AS `AVG_orders_per_driver`,
        (`main_table`.`total_gmv` / `main_table`.`orders`) AS `AVG_check`
    FROM
        (SELECT 
            MONTH(`tbl_order`.`created_at`) AS `mon`,
                YEAR(`tbl_order`.`created_at`) AS `yea`,
                COUNT(`tbl_order`.`order_id`) AS `orders`,
                COUNT(IF((`tbl_order`.`status` = 'done'), `tbl_order`.`order_id`, NULL)) AS `rides`,
                COUNT(DISTINCT `tbl_order`.`pass_id`) AS `MAU_pass`,
                COUNT(DISTINCT `tbl_order`.`driver_id`) AS `MAU_drivers`,
                SUM(IF((`tbl_order`.`status` = 'done'), `tbl_order`.`price`, NULL)) AS `total_gmv`
        FROM
            `tbl_order`
        GROUP BY `yea` , `mon`
        ORDER BY `yea` , `mon`) `main_table`;
        
        
/*Представление по данным о машинах пользователей */        
 CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `users_cars` AS
    SELECT 
        `tu`.`user_id` AS `user_id`,
        `tu`.`first_name` AS `first_name`,
        `tu`.`last_name` AS `last_name`,
        `t_bra`.`carbrand_name` AS `carbrand_name`,
        `t_mod`.`carmodel_name` AS `carmodel_name`,
        `t_nam`.`class_name` AS `class_name`
    FROM
        ((((`tbl_user` `tu`
        LEFT JOIN `tbl_carmodel` `t_mod` ON ((`t_mod`.`carmodel_id` = `tu`.`carmodel_id`)))
        LEFT JOIN `tbl_carbrand` `t_bra` ON ((`t_bra`.`carbrand_id` = `tu`.`carbrand_id`)))
        LEFT JOIN `tbl_car_class` `t_cla` ON (((`t_cla`.`carmodel_id` = `t_mod`.`carmodel_id`)
            AND (`t_cla`.`carbrand_id` = `tu`.`carbrand_id`))))
        LEFT JOIN `tbl_class_name` `t_nam` ON ((`t_nam`.`carclass_id` = `t_cla`.`carclass_id`)));       