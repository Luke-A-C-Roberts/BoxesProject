defmodule BoxesProj.Repo do
  use Ecto.Repo,
    otp_app: :boxes_proj,
    adapter: Ecto.Adapters.MyXQL
end
