database = "crystal_toolbox_#{Lucky::Env.name}"

LuckyRecord::Repo.configure do
  if Lucky::Env.production?
    settings.url = ENV.fetch("DATABASE_URL")
  else
    settings.url = LuckyRecord::PostgresURL.build(
      hostname: "localhost",
      database: database
    )
  end
  settings.lazy_load_enabled = Lucky::Env.production?
end

LuckyMigrator::Runner.configure do
  settings.database = database
end
