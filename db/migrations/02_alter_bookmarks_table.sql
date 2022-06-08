-- ./db/migrations/02_alter_bookmarks_table.sql

ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);
