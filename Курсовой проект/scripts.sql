/* ТОП-10 городов в котором больше всего заказов */
SELECT to2.city_id, 
	   tc.city_name, 
       count(to2.order_id) AS orders,
       count(if(status = 'done', to2.order_id, NULL)) AS rides
  FROM tbl_order to2
  LEFT JOIN tbl_city AS tc ON tc.city_id = to2.city_id
GROUP BY to2.city_id, tc.city_name
ORDER BY orders DESC
LIMIT 10;


/* Сводная статистика по месяцам, годам */
SELECT *,
	  orders / MAU_pass AS AVG_orders_per_pass,
	  orders / MAU_drivers AS AVG_orders_per_driver,
      total_gmv / orders AS AVG_check
FROM (SELECT 
		   MONTH(created_at) AS mon,
			YEAR(created_at) AS yea,
			COUNT(order_id) AS orders,
			COUNT(if(status = 'done', order_id, NULL)) AS rides,
			COUNT(DISTINCT pass_id) AS MAU_pass,
			COUNT(DISTINCT driver_id) AS MAU_drivers,
			SUM(if(status = 'done', price, NULL)) AS total_gmv
	 FROM tbl_order
	 GROUP BY yea, mon
	 ORDER BY yea, mon
	) AS main_table
;
    
    
/* Количество водителей по классам их машин */
SELECT t_nam.class_name, count(distinct user_id)
FROM tbl_user tu
LEFT JOIN tbl_carmodel t_mod ON t_mod.carmodel_id = tu.carmodel_id
LEFT JOIN tbl_carbrand t_bra ON t_bra.carbrand_id = tu.carbrand_id
LEFT JOIN tbl_car_class t_cla ON t_cla.carmodel_id = t_mod.carmodel_id AND t_cla.carbrand_id = tu.carbrand_id
LEFT JOIN tbl_class_name t_nam ON t_nam.carclass_id = t_cla.carclass_id
WHERE tu.mode = 'driver'
AND class_name IS NOT NULL
-- AND t_nam.class_name LIKE 'комфорт'
GROUP BY t_nam.class_name;

/* Список машин и их классы */ 
SELECT tb.carbrand_name, tm.carmodel_name, tcn.class_name
FROM tbl_car_class tcc
LEFT JOIN tbl_carmodel tm ON tcc.carmodel_id = tm.carmodel_id
LEFT JOIN tbl_carbrand tb ON tb.carbrand_id = tcc.carbrand_id
LEFT JOIN tbl_class_name tcn ON tcn.carclass_id = tcc.carclass_id
ORDER BY tcn.class_name;

/* Список забаненных пользователей */
SELECT user_id, first_name, last_name, tu.ban_id, ban_reason FROM tbl_user tu
LEFT JOIN tbl_ban tb ON tb.ban_id = tu.ban_id
WHERE tu.ban_id IS NOT NULL
