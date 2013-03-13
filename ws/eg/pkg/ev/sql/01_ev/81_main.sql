/*

    Copyright (c) 2010, 2012 Tender.Pro http://tender.pro.

    This file is part of PGWS - Postgresql WebServices.

    PGWS is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PGWS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with PGWS.  If not, see <http://www.gnu.org/licenses/>.

    Данные основных таблиц пакета
*/

/* ------------------------------------------------------------------------- */
INSERT INTO status (id, name) VALUES
  /*1*/ (ev.const_status_id_draft()   , 'Ожидает спецификацию')
, /*2*/ (ev.const_status_id_rcpt()    , 'Расчет адресатов')
, /*3*/ (ev.const_status_id_notify()  , 'Подготовка уведомлений')
, /*4*/ (ev.const_status_id_done()    , 'Зарегистировано')
, /*5*/ (ev.const_status_id_archive() , 'Архив')
;

ALTER TABLE wsd.event ADD CONSTRAINT event_fk_status_id FOREIGN KEY (status_id) REFERENCES ev.status(id);

INSERT INTO i18n_def.page ( "code", "up_code", "class_id", "action_id", "sort", "uri", "tmpl", "pkg", "name" )
VALUES ( 'ev.role_signup_list', 'main', 2, 1, 0, 'ev/role-signups$', 'ev/role_signup_list', 'ev', 'Управление подпиской ролей' );

INSERT INTO i18n_def.page ( "code", "up_code", "class_id", "action_id", "sort", "uri", "tmpl", "pkg", "name" )
VALUES ( 'ev.role_signup', 'main', 2, 1, 0, 'ev/role-signup/:i$', 'ev/role_signup', 'ev', 'Управление подпиской роли' );

INSERT INTO i18n_def.page ( "code", "up_code", "class_id", "action_id", "sort", "uri", "tmpl", "pkg", "name" )
VALUES ( 'ev.notifications', 'main', 2, 1, 0, 'ev/notifications$', 'ev/notifications', 'ev', 'Список уведомлений' );

INSERT INTO method ( code, class_id, action_id, cache_id, rvf_id, args_exam, name )
  VALUES ('ev.role_list',         2, 1,  1,      7,             '', 'Список ролей' ),
         ('ev.role_signup_list',  2, 1,  1,      7,    'role_id=1', 'Список подписок роли' ),
         ('ev.kind_list',         2, 1,  1,      7,             '', 'Список видов событий' ),
         ('ev.role_signup_ins',   2, 1,  1,      1, 'role_id=1&kind_id=2&spec_id=1', 'Создание подписки роли' ),
         ('ev.role_signup_del',   2, 1,  1,      1, 'role_id=1&kind_id=2&spec_id=1', 'Удаление подписки роли' ),
         ('ev.notifications_list',2, 1,  1,      7, 'account_id=1', 'Список уведомлений пользователя' ),
         ('ev.new_notifications_count',2, 1, 1, 1, 'account_id=1', 'Количество новых уведомлений пользователя' );

INSERT INTO ev.role ( id, title ) VALUES
( 1, 'admin' ),
( 2, 'user'  );

INSERT INTO ev.signature (  id, name, email, tmpl )
	VALUES ( 1, 'First Signature', 'first_email@example.com', 'first_signature' );

INSERT INTO ev.kind ( id, group_id, class_id,  def_prio, keep_days, has_spec, pkg, signature_id, tmpl, form_codes, name, name_fmt, name_count, spec_name, anno )
  VALUES( 1, 2, 3, 4, 5,  true, 'acc', 1, 'tmpl', ARRAY[1], 'user login', '',  0, 'spec_name', 'anno' ),
        ( 2, 2, 3, 4, 5, false, 'acc', 1, 'tmpl', ARRAY[1],       'test', '',  0, 'spec_name', 'anno' );

INSERT INTO ev.account_role ( account_id, role_id ) VALUES ( 1, 1 );
/* ------------------------------------------------------------------------- */
