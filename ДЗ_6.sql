/*
 ДЗ_6 Задача № 2
 Пусть задан некоторый пользователь. 
 Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
 */
SELECT
	p.users_id,
	CONCAT(p.firstname, ' ', p.lastname) AS our_user,
	m.from_users_id AS best_friend_id,
	(SELECT CONCAT(p2.firstname, ' ', p2.lastname) FROM profiles p2 WHERE p2.users_id = m.from_users_id) AS best_friend,
	COUNT(m.id) AS c_messages
FROM 
	profiles p 
LEFT JOIN 
	messages AS m 
ON 
	m.to_users_id = p.users_id
WHERE p.users_id = 60
AND m.from_users_id IN (SELECT 
							IF(from_users_id = 60, to_users_id, from_users_id) 
						FROM friend_requests fr 
						WHERE (from_users_id = 60 OR to_users_id = 60) 
						AND status = 1)
GROUP BY 
		p.users_id,
		our_user,
		best_friend_id,
		best_friend
ORDER BY c_messages DESC 
LIMIT 1;

/*
 ДЗ_6 Задача № 3
 Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
 */

SELECT 
	ys.users_id,
	ys.age,
	COUNT(l.id)
FROM likes l
RIGHT JOIN -- подключаем таблицу с 10 самыми молодыми пользователями
	(SELECT 
		p.users_id,
		TIMESTAMPDIFF(YEAR, p.birthday, NOW()) AS age
	FROM profiles p 
	ORDER BY age
	LIMIT 10) ys 
ON 
	ys.users_id = l.users_id 
GROUP BY ys.users_id,
		 ys.age

					 							
/*
 ДЗ_6 Задача № 4
 Определить кто больше поставил лайков (всего) - мужчины или женщины?
 */

SELECT 
	gen.gender,
	COUNT(l.id)
FROM likes l
JOIN
	(SELECT 
		p.users_id,
		p.gender 
	FROM profiles p) gen
ON 
	gen.users_id = l.users_id 
GROUP BY 
		 gen.gender
		 
/*
 ДЗ_6 Задача № 5
 Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
*/	 
		 
SELECT 
	p2.users_id,
	p2.firstname,
	p2.lastname,
	(IFNULL(fm.c_sent_messages, 0) + IFNULL(tm.c_received_messages, 0) + IFNULL(l.c_likes, 0)) AS activity
FROM profiles p2
LEFT JOIN 
	(SELECT 
   		m2.from_users_id,
	 	COUNT(m2.id) AS c_sent_messages
	 FROM messages m2 
	 GROUP BY 
		m2.from_users_id) AS fm 
ON 
	fm.from_users_id = p2.users_id 
LEFT JOIN
	(SELECT 
		m2.to_users_id,
		COUNT(m2.id) AS c_received_messages
	 FROM messages m2 
	 GROUP BY 
		m2.to_users_id) AS tm
ON 
	tm.to_users_id = p2.users_id 
LEFT JOIN 
	(SELECT 
		l2.users_id,
		COUNT(l2.id) AS c_likes
	 FROM likes l2
	 GROUP BY l2.users_id) AS l
ON 
	l.users_id = p2.users_id 
ORDER BY activity 
LIMIT 10
	
