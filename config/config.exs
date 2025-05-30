import Config

if File.exists?(Path.expand("config/dev.secret.exs")) do
  import_config "dev.secret.exs"
end
