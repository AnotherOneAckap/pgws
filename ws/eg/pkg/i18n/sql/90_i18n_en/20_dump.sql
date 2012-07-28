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

    ATTENTION! This file was AUTOGENERATED by pgws/ws/bin/i18n2dump.pl en

*/

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;

--
-- Name: i18n_en; Type: SCHEMA; Schema: -; Owner: -
--



--
-- Name: SCHEMA i18n_en; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA i18n_en IS 'WebService (PGWS) default internationalization data';


SET search_path = i18n_en, pg_catalog;

--
-- Name: amount2words(numeric, integer); Type: FUNCTION; Schema: i18n_en; Owner: -
--

CREATE FUNCTION amount2words(source numeric, up_mode integer) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$ /* ws:ws:51_i18n.sql / 60 */ 
/*
  Сумма прописью в рублях и копейках
  up_mode = 0 - все символы строчные
          = 1 - Первый символ строки - прописной

  Оригинальное название: number2word
  Источник: http://oraclub.trecom.tomsk.su/db/web.page?pid=461
  В конференцию relcom.comp.dbms.oracle поместил "Igor Volkov" (volkov@rdtex.msk.ru)
*/
DECLARE
  result TEXT;
BEGIN
  -- k - копейки
  result := ltrim(to_char( source,
    '9,9,,9,,,,,,9,9,,9,,,,,9,9,,9,,,,9,9,,9,,,.99')) || 'k';
  -- t - тысячи; m - милионы; M - миллиарды;
  result := replace( result, ',,,,,,', 'eM');
  result := replace( result, ',,,,,', 'em');
  result := replace( result, ',,,,', 'et');
  -- e - единицы; d - десятки; c - сотни;
  result := replace( result, ',,,', 'e');
  result := replace( result, ',,', 'd');
  result := replace( result, ',', 'c');
  --
  result := replace( result, '0c0d0et', '');
  result := replace( result, '0c0d0em', '');
  result := replace( result, '0c0d0eM', '');
  --
  result := replace( result, '0c', '');
  result := replace( result, '1c', 'сто' || ' ');
  result := replace( result, '2c', 'двести' || '  ');
  result := replace( result, '3c', 'триста' || '  ');
  result := replace( result, '4c', 'четыреста' || '  ');
  result := replace( result, '5c', 'пятьсот' || '  ');
  result := replace( result, '6c', 'шестьсот' || '  ');
  result := replace( result, '7c', 'семьсот' || '  ');
  result := replace( result, '8c', 'восемьсот' || '  ');
  result := replace( result, '9c', 'девятьсот' || '  ');
  --
  result := replace( result, '1d0e', 'десять' || '  ');
  result := replace( result, '1d1e', 'одиннадцать' || '  ');
  result := replace( result, '1d2e', 'двенадцать' || '  ');
  result := replace( result, '1d3e', 'тринадцать' || '  ');
  result := replace( result, '1d4e', 'четырнадцать' || '  ');
  result := replace( result, '1d5e', 'пятнадцать' || '  ');
  result := replace( result, '1d6e', 'шестнадцать' || '  ');
  result := replace( result, '1d7e', 'семнадцать' || '  ');
  result := replace( result, '1d8e', 'восемнадцать' || '  ');
  result := replace( result, '1d9e', 'девятнадцать' || '  ');
  --
  result := replace( result, '0d', '');
  result := replace( result, '2d', 'двадцать' || '  ');
  result := replace( result, '3d', 'тридцать' || '  ');
  result := replace( result, '4d', 'сорок' || '  ');
  result := replace( result, '5d', 'пятьдесят' || '  ');
  result := replace( result, '6d', 'шестьдесят' || '  ');
  result := replace( result, '7d', 'семьдесят' || '  ');
  result := replace( result, '8d', 'восемьдесят' || '  ');
  result := replace( result, '9d', 'девяносто' || '  ');
  --
  result := replace( result, '0e', '');
  result := replace( result, '5e', 'пять' || '  ');
  result := replace( result, '6e', 'шесть' || '  ');
  result := replace( result, '7e', 'семь' || '  ');
  result := replace( result, '8e', 'восемь' || '  ');
  result := replace( result, '9e', 'девять' || '  ');
  --
  result := replace( result, '1e.', 'один рубль' || '  ');
  result := replace( result, '2e.', 'два рубля' || '  ');
  result := replace( result, '3e.', 'три рубля' || '  ');
  result := replace( result, '4e.', 'четыре рубля' || '  ');
  result := replace( result, '1et', 'одна тысяча' || '  ');
  result := replace( result, '2et', 'две тысячи' || '  ');
  result := replace( result, '3et', 'три тысячи' || '  ');
  result := replace( result, '4et', 'четыре тысячи' || '  ');
  result := replace( result, '1em', 'один миллион' || '  ');
  result := replace( result, '2em', 'два миллиона' || '  ');
  result := replace( result, '3em', 'три миллиона' || '  ');
  result := replace( result, '4em', 'четыре миллиона' || '  ');
  result := replace( result, '1eM', 'один миллиард' || '  ');
  result := replace( result, '2eM', 'два миллиарда' || '  ');
  result := replace( result, '3eM', 'три миллиарда' || '  ');
  result := replace( result, '4eM', 'четыре миллиарда' || '  ');
  --

  --  блок для написания копеек без сокращения 'коп'
  result := replace( result, '11k', '11 копеек');
  result := replace( result, '12k', '12 копеек');
  result := replace( result, '13k', '13 копеек');
  result := replace( result, '14k', '14 копеек');
  result := replace( result, '1k', '1 копейка');
  result := replace( result, '2k', '2 копейки');
  result := replace( result, '3k', '3 копейки');
  result := replace( result, '4k', '4 копейки');
  result := replace( result, 'k', ' ' || 'копеек');
  --
  result := replace( result, '.', 'рублей' || '  ');
  result := replace( result, 't', 'тысяч' || '  ');
  result := replace( result, 'm', 'миллионов' || '  ');
  result := replace( result, 'M', 'миллиардов' || '  ');

  -- сокращенные коп
  -- result := replace( result, 'k', ' ' || 'коп');
  --
  IF up_mode = 1 THEN
    result := upper(substr(result, 1, 1)) || substr(result, 2);
  END IF;
  RETURN result;
END
$$;


--
-- Name: FUNCTION amount2words(source numeric, up_mode integer); Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON FUNCTION amount2words(source numeric, up_mode integer) IS 'Сумма прописью в рублях и копейках';


--
-- Name: date_name(date); Type: FUNCTION; Schema: i18n_en; Owner: -
--

CREATE FUNCTION date_name(a_date date) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$ /* ws:ws:51_i18n.sql / 11 */ 
  DECLARE
    m_names TEXT := 'january february march april may june july august september october november december';
  BEGIN
    RETURN date_part('day', a_date)
          ||' '||split_part(m_names, ' '::text, date_part('month', a_date)::int)
          ||' '||date_part('year', a_date)
    ;
  END
$$;


--
-- Name: FUNCTION date_name(a_date date); Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON FUNCTION date_name(a_date date) IS 'Название даты вида "1 января 2007"';


--
-- Name: date_name_doc(date); Type: FUNCTION; Schema: i18n_en; Owner: -
--

CREATE FUNCTION date_name_doc(a_date date) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$ /* ws:ws:51_i18n.sql / 25 */ 
  SELECT CASE WHEN date_part('day', $1) < 10 THEN '0' ELSE '' END || date_name($1)
$_$;


--
-- Name: FUNCTION date_name_doc(a_date date); Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON FUNCTION date_name_doc(a_date date) IS 'Название даты вида "01 января 2007"';


--
-- Name: month_amount_name(integer); Type: FUNCTION; Schema: i18n_en; Owner: -
--

CREATE FUNCTION month_amount_name(a_id integer) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$ /* ws:ws:51_i18n.sql / 45 */ 
  SELECT CASE
    WHEN $1 % 10 = 1 AND $1 <> 11 THEN $1::text || ' ' || 'месяц'
    WHEN $1 IN (24,36,48) THEN $1/12 || ' ' || 'года'
    WHEN $1 = 12     THEN '1 год'
    WHEN $1 % 12 = 0 THEN $1/12 || ' ' || 'лет'
    WHEN $1 % 10 BETWEEN 1 AND 4 AND $1 NOT BETWEEN 11 AND 14 THEN $1::text || ' ' || 'месяца'
    ELSE $1::text || ' ' || 'месяцев'
  END
;
$_$;


--
-- Name: FUNCTION month_amount_name(a_id integer); Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON FUNCTION month_amount_name(a_id integer) IS 'Название периода из заданного числа месяцев (252 max)';


--
-- Name: month_name(date); Type: FUNCTION; Schema: i18n_en; Owner: -
--

CREATE FUNCTION month_name(a_date date) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$ /* ws:ws:51_i18n.sql / 32 */ 
  DECLARE
    m_names TEXT := 'january february march april may june july august september october november december';
  BEGIN
    RETURN split_part(m_names, ' '::text, date_part('month', a_date)::int)
          ||' '||date_part('year', a_date)
    ;
  END
$$;


--
-- Name: FUNCTION month_name(a_date date); Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON FUNCTION month_name(a_date date) IS 'Название месяца вида "январь 2007"';


SET default_with_oids = false;

--
-- Name: error_message; Type: TABLE; Schema: i18n_en; Owner: -
--

CREATE TABLE error_message (
    code ws.d_errcode NOT NULL,
    id_count ws.d_cnt DEFAULT 0 NOT NULL,
    message ws.d_format NOT NULL
);


--
-- Name: error; Type: VIEW; Schema: i18n_en; Owner: -
--

CREATE VIEW error AS
    SELECT error_message.code, error_message.id_count, error_message.message FROM error_message;


--
-- Name: VIEW error; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON VIEW error IS 'Error description';


--
-- Name: page_name; Type: TABLE; Schema: i18n_en; Owner: -
--

CREATE TABLE page_name (
    code ws.d_code NOT NULL,
    name text NOT NULL
);


--
-- Name: page; Type: VIEW; Schema: i18n_en; Owner: -
--

CREATE VIEW page AS
    SELECT d.code, d.up_code, d.class_id, d.action_id, d.group_id, d.sort, d.uri, d.tmpl, d.id_fixed, d.id_session, d.is_hidden, d.target, d.uri_re, d.uri_fmt, d.pkg, n.name FROM (ws.page_data d JOIN page_name n USING (code));


--
-- Name: VIEW page; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON VIEW page IS 'Site page';


--
-- Name: COLUMN page.code; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.code IS 'Page ID';


--
-- Name: COLUMN page.up_code; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.up_code IS 'id of parent level page';


--
-- Name: COLUMN page.class_id; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.class_id IS 'Class ID page corresponds with';


--
-- Name: COLUMN page.action_id; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.action_id IS 'Action ID page corresponds with';


--
-- Name: COLUMN page.group_id; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.group_id IS 'Manu page group ID';


--
-- Name: COLUMN page.sort; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.sort IS 'page order in one level menu';


--
-- Name: COLUMN page.uri; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.uri IS 'metamask with variable names for request uri lookup';


--
-- Name: COLUMN page.tmpl; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.tmpl IS 'template file (NULL for external URL)';


--
-- Name: COLUMN page.id_fixed; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.id_fixed IS 'ID объекта взять из этого поля';


--
-- Name: COLUMN page.id_session; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.id_session IS 'Session field to get object ID from';


--
-- Name: COLUMN page.is_hidden; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.is_hidden IS 'Запрет включения внешних блоков в разметку страницы';


--
-- Name: COLUMN page.target; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.target IS 'value of target attribute in generated links';


--
-- Name: COLUMN page.uri_re; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.uri_re IS 'regexp for URI, calculated by insert/update trigger';


--
-- Name: COLUMN page.uri_fmt; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.uri_fmt IS 'format string for URI generation, filled by insert/update trigger';


--
-- Name: COLUMN page.pkg; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.pkg IS 'пакет, в котором зарегистрирована страница';


--
-- Name: COLUMN page.name; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page.name IS 'Sitemap page title';


--
-- Name: page_group; Type: TABLE; Schema: i18n_en; Owner: -
--

CREATE TABLE page_group (
    id ws.d_id32 NOT NULL,
    name text NOT NULL
);


--
-- Name: TABLE page_group; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON TABLE page_group IS 'Menu page group';


--
-- Name: COLUMN page_group.id; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page_group.id IS 'Group ID';


--
-- Name: COLUMN page_group.name; Type: COMMENT; Schema: i18n_en; Owner: -
--

COMMENT ON COLUMN page_group.name IS 'Название';


--
-- Name: id_count; Type: DEFAULT; Schema: i18n_en; Owner: -
--

ALTER TABLE ONLY error ALTER COLUMN id_count SET DEFAULT 0;


--
-- Name: target; Type: DEFAULT; Schema: i18n_en; Owner: -
--

ALTER TABLE ONLY page ALTER COLUMN target SET DEFAULT ''::text;


--
-- Data for Name: error_message; Type: TABLE DATA; Schema: i18n_en; Owner: -
--

INSERT INTO error_message VALUES ('Y0001', 0, 'required value does not given');
INSERT INTO error_message VALUES ('Y0002', 2, 'value does not conform to condition "%s %s"');
INSERT INTO error_message VALUES ('Y0003', 1, 'value does not conform to template "%s %s"');
INSERT INTO error_message VALUES ('Y0010', 0, 'no data');
INSERT INTO error_message VALUES ('Y0101', 1, 'incorrect acl code "%s"');
INSERT INTO error_message VALUES ('Y0102', 1, 'внешний доступ к методу с "%s" запрещен');
INSERT INTO error_message VALUES ('Y0103', 0, 'authorization required (no session id)');
INSERT INTO error_message VALUES ('Y0104', 1, 'incorrect session id "%s"');
INSERT INTO error_message VALUES ('Y0105', 1, 'no check for acl "%s"');
INSERT INTO error_message VALUES ('Y0106', 1, 'incorrect status id "%s"');
INSERT INTO error_message VALUES ('Y0301', 0, 'неправильный пароль');
INSERT INTO error_message VALUES ('Y0302', 0, 'неизвестный логин');
INSERT INTO error_message VALUES ('Y0303', 1, 'статус пользователя (%s) не допускает авторизацию');
INSERT INTO error_message VALUES ('Y0021', 1, 'no access to sum result when a = %i');
INSERT INTO error_message VALUES ('Y0022', 1, 'no data for a = %i');
INSERT INTO error_message VALUES ('Y9901', 1, 'Не найдена группа "%s"');
INSERT INTO error_message VALUES ('Y9902', 1, 'Версия документа (%s) не актуальна и(или) устарела');
INSERT INTO error_message VALUES ('Y9903', 1, 'Документ с таким адресом уже создан (%s)');
INSERT INTO error_message VALUES ('Y9904', 0, 'Документ не содержит изменений');
INSERT INTO error_message VALUES ('Y9905', 0, 'Документ не найден');


--
-- Data for Name: page_group; Type: TABLE DATA; Schema: i18n_en; Owner: -
--



--
-- Data for Name: page_name; Type: TABLE DATA; Schema: i18n_en; Owner: -
--

INSERT INTO page_name VALUES ('main', 'API');
INSERT INTO page_name VALUES ('api', 'API docs');
INSERT INTO page_name VALUES ('api.smd', 'Methods');
INSERT INTO page_name VALUES ('api.map', 'Pages');
INSERT INTO page_name VALUES ('api.xsd', 'Types');
INSERT INTO page_name VALUES ('api.class', 'Classes');
INSERT INTO page_name VALUES ('api.smd1', 'Methods via JS');
INSERT INTO page_name VALUES ('api.class.single', 'Class');
INSERT INTO page_name VALUES ('login', 'Вход');
INSERT INTO page_name VALUES ('logout', 'Выход');
INSERT INTO page_name VALUES ('api.test', 'Test page');
INSERT INTO page_name VALUES ('wiki.wk', 'Вики');
INSERT INTO page_name VALUES ('wiki.wk.edit', 'Редактирование');
INSERT INTO page_name VALUES ('wiki.wk.history', 'История изменений');


--
-- Name: error_message_pkey; Type: CONSTRAINT; Schema: i18n_en; Owner: -
--

ALTER TABLE ONLY error_message
    ADD CONSTRAINT error_message_pkey PRIMARY KEY (code);


--
-- Name: page_group_pkey; Type: CONSTRAINT; Schema: i18n_en; Owner: -
--

ALTER TABLE ONLY page_group
    ADD CONSTRAINT page_group_pkey PRIMARY KEY (id);


--
-- Name: page_name_pkey; Type: CONSTRAINT; Schema: i18n_en; Owner: -
--

ALTER TABLE ONLY page_name
    ADD CONSTRAINT page_name_pkey PRIMARY KEY (code);


--
-- Name: error_ins; Type: RULE; Schema: i18n_en; Owner: -
--

CREATE RULE error_ins AS ON INSERT TO error DO INSTEAD (INSERT INTO ws.error_data (code) VALUES (new.code); INSERT INTO error_message (code, id_count, message) VALUES (new.code, new.id_count, new.message); );


--
-- Name: page_ins; Type: RULE; Schema: i18n_en; Owner: -
--

CREATE RULE page_ins AS ON INSERT TO page DO INSTEAD (INSERT INTO ws.page_data (code, up_code, class_id, action_id, group_id, sort, uri, tmpl, id_fixed, id_session, is_hidden, target, uri_re, uri_fmt, pkg) VALUES (new.code, new.up_code, new.class_id, new.action_id, new.group_id, new.sort, new.uri, new.tmpl, new.id_fixed, new.id_session, DEFAULT, DEFAULT, new.uri_re, new.uri_fmt, COALESCE(new.pkg, (ws.pg_cs())::text)); UPDATE ws.page_data SET is_hidden = COALESCE(new.is_hidden, page_data.is_hidden), target = COALESCE(new.target, page_data.target) WHERE ((page_data.code)::text = (new.code)::text); INSERT INTO page_name (code, name) VALUES (new.code, new.name); );


--
-- Name: error_message_code_fkey; Type: FK CONSTRAINT; Schema: i18n_en; Owner: -
--

ALTER TABLE ONLY error_message
    ADD CONSTRAINT error_message_code_fkey FOREIGN KEY (code) REFERENCES ws.error_data(code) ON DELETE CASCADE;


--
-- Name: page_name_code_fkey; Type: FK CONSTRAINT; Schema: i18n_en; Owner: -
--

ALTER TABLE ONLY page_name
    ADD CONSTRAINT page_name_code_fkey FOREIGN KEY (code) REFERENCES ws.page_data(code) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

