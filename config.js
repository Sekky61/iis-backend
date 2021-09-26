module.exports = {
    port: process.env.PORT || 3000,
    pg_conn_string: process.env.PG_CONN_STRING || process.env.DATABASE_URL || 'no default string'
}