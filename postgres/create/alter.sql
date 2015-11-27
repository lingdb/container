-- Necessary change to django_content_type since Django 1.8:
ALTER TABLE django_content_type DROP COLUMN name;
-- Dropping last_login NOT NULL to make sure users can be created:
ALTER TABLE auth_user ALTER COLUMN last_login DROP NOT NULL;
-- Remove NOT NULL constraints from tables:
ALTER TABLE lexicon_cognateclass ALTER COLUMN data DROP NOT NULL;
ALTER TABLE lexicon_cognatejudgement ALTER COLUMN data DROP NOT NULL;
ALTER TABLE lexicon_languagelist ALTER COLUMN data DROP NOT NULL;
ALTER TABLE lexicon_lexeme ALTER COLUMN data DROP NOT NULL;
ALTER TABLE lexicon_meaning ALTER COLUMN data DROP NOT NULL;
ALTER TABLE lexicon_meaninglist ALTER COLUMN data DROP NOT NULL;
ALTER TABLE lexicon_source ALTER COLUMN data DROP NOT NULL;
