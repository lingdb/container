-- Necessary migrations for flask:
UPDATE Page_Translations SET ImagePath = CONCAT('static/',ImagePath)
