import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :web, Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/4rmfUd+xo6RykLqpOGI1oJsiUCSnYGVCaLtV0ppdmZVyBjO7xdXxMJqKgyogpP5",
  server: false
