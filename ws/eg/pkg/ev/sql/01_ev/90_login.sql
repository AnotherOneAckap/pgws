SELECT ws.test('user_login_spec_0');
-- Подписать роль 1 на событие 1 со специфкацией 0
SELECT ev.role_signup_ins( 1, 1, 0 );
-- Сэмулировать логин вставкой в таблицу сессий
INSERT INTO wsd.session (  account_id, role_id, ip, is_ip_checked ) VALUES
  ( 1, 1, '127.0.0.1', false )
;
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
-- Сэмулировать логин юзера pro_ вставкой в таблицу сессий
INSERT INTO wsd.session (  account_id, role_id, ip, is_ip_checked ) VALUES
  ( ( SELECT id FROM wsd.account WHERE login = 'pro_admin' ), 1, '127.0.0.1', false )
;
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
