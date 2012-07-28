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

    Реестр свойств. Добавление владельца

*/

/* ------------------------------------------------------------------------- */
INSERT INTO wsd.pkg_script_protected (code, ver) VALUES (:'FILE', :'VER');

/* ------------------------------------------------------------------------- */
INSERT INTO wsd.prop_group (pogc, sort, name) VALUES
  ('job',   4, 'Демон Job')
;

/* ------------------------------------------------------------------------- */
INSERT INTO wsd.prop_owner (pogc, poid, sort, name) VALUES
  ('job',   1,  1,  'Первичный Демон Job')
;

/* ------------------------------------------------------------------------- */
UPDATE ws.prop SET pogc_list = array_append(pogc_list, 'job') WHERE code IN (
  'ws.daemon.startup.pm.n_processes'
, 'ws.daemon.startup.pm.die_timeout'
, 'ws.daemon.mgr.listen_wait'
, 'ws.daemon.mgr.listen.job'
);
