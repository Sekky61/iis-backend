psql -d iis-dev -a -f util/schema.sql > /dev/null
node util/db_seed.js
echo "RESET DONE"