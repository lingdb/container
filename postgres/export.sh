#!/bin/bash
docker cp export.sql lingdb_postgres:/tmp/
docker exec -it lingdb_postgres psql -f /tmp/export.sql -U ielexuser ielexdb201510
docker cp lingdb_postgres:/tmp/author.csv export/
docker cp lingdb_postgres:/tmp/clade.csv export/
docker cp lingdb_postgres:/tmp/cognateclass.csv export/
docker cp lingdb_postgres:/tmp/cognateclasscitation.csv export/
docker cp lingdb_postgres:/tmp/cognatejudgement.csv export/
docker cp lingdb_postgres:/tmp/cognatejudgementcitation.csv export/
docker cp lingdb_postgres:/tmp/dyencognateset.csv export/
docker cp lingdb_postgres:/tmp/language.csv export/
docker cp lingdb_postgres:/tmp/languageclade.csv export/
docker cp lingdb_postgres:/tmp/languagelist.csv export/
docker cp lingdb_postgres:/tmp/languagelistorder.csv export/
docker cp lingdb_postgres:/tmp/lexeme.csv export/
docker cp lingdb_postgres:/tmp/lexemecitation.csv export/
docker cp lingdb_postgres:/tmp/meaning.csv export/
docker cp lingdb_postgres:/tmp/meaninglist.csv export/
docker cp lingdb_postgres:/tmp/meaninglistorder.csv export/
docker cp lingdb_postgres:/tmp/nexusexport.csv export/
docker cp lingdb_postgres:/tmp/sndcomp.csv export/
docker cp lingdb_postgres:/tmp/source.csv export/
docker exec -it lingdb_postgres rm /tmp/export.sql /tmp/author.csv /tmp/clade.csv /tmp/cognateclass.csv /tmp/cognateclasscitation.csv /tmp/cognatejudgement.csv /tmp/cognatejudgementcitation.csv /tmp/dyencognateset.csv /tmp/language.csv /tmp/languageclade.csv /tmp/languagelist.csv /tmp/languagelistorder.csv /tmp/lexeme.csv /tmp/lexemecitation.csv /tmp/meaning.csv /tmp/meaninglist.csv /tmp/meaninglistorder.csv /tmp/nexusexport.csv /tmp/sndcomp.csv /tmp/source.csv
