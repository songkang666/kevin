settings =
  development:
    mongo: 'mongodb://localhost/test'
    redis:
      host: 'localhost'
      port: 6379
      db: 2
    port: 3000
    session_time: 60 * 60 * 1000
    domain_name: '127.0.0.1:3000'
    page_size: 10
    site_name: 'Demo'
  
  test:
    mongo: 'mongodb://username:password@hostname:port/db'
    redis:
      host: 'localhost'
      port: 6379
      db: 2
    port: 3000
    session_time: 60 * 60 * 1000
    domain_name: '127.0.0.1:3000'
    page_size: 20
    site_name: 'Net Disk'

  production:
    mongo: 'mongodb://username:password@hostname:port/db'
    redis:
      host: 'localhost'
      port: 6379
      db: 2
    port: 3000
    session_time: 30 * 60 * 1000
    domain_name: '127.0.0.1:3000'
    page_size: 20
    site_name: 'Net Disk'

module.exports = (env) -> settings[env]
