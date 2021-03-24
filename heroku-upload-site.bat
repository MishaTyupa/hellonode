@ECHO OFF
set HEROKU_API_KEY=HEROKU_API_KEY
@ECHO %HEROKU_API_KEY%
cmd %HEROKU_API_KEY%="bd28dc5d-b976-479e-8727-8c8de3cb2f23" heroku container:push web -a infinite-escarpment-38882
cmd %HEROKU_API_KEY%="bd28dc5d-b976-479e-8727-8c8de3cb2f23" heroku container:release web -a infinite-escarpment-38882