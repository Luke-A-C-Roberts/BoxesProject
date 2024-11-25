defmodule BoxesProj.Repo do
  use Ecto.Repo,
    otp_app: :boxes_proj,
    adapter: Ecto.Adapters.Postgres
end
