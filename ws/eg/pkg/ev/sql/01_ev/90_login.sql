SELECT ws.test('user_login_spec_0');
-- Подписать роль 1 на событие 1 со специфкацией 0
SELECT ev.role_signup_ins( 1, 1, 0 );
-- Сэмулировать логин
SELECT account_name FROM acc.login( '127.0.0.1', 'admin', 'pgws');

-- Найти новое уведомление у аккаунта 1
SELECT ev.new_notifications_count( 1 );
SELECT COUNT(*) FROM ev.notifications_list( 1 );

SELECT ws.test('user_login_spec_1');
-- Подписать роль 1 на событие 1 со специфкацией 1
SELECT ev.role_signup_ins( 1, 1, 1 );
-- Создать юзера с аккаунтом pro_
INSERT INTO wsd.account ( status_id, def_role_id, login, psw, name ) VALUES 
  ( 4, 1, 'pro_admin', 'pro_admin', 'pro_admin' )
;
-- Сэмулировать логин юзера pro_
SELECT account_name FROM acc.login( '127.0.0.1', 'pro_admin', 'pro_admin');

-- Найти новое уведомление
SELECT ev.new_notifications_count( 1 );
SELECT COUNT(*) FROM ev.notifications_list( 1 );

SELECT ws.test('ev.role_signup_del');
-- Удалить подписку
SELECT ev.role_signup_del( 1, 1, 1 );
SELECT ev.role_signup_del( 1, 1, 0 );
-- Убраться за собой
TRUNCATE wsd.event_notify;
TRUNCATE wsd.session;
DELETE FROM wsd.account WHERE login = 'pro_admin' AND psw = 'pro_admin';
