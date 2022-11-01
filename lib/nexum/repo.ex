defmodule Vivere.NexumRepo do

  @moduledoc false

  use Ecto.Repo,
    otp_app: :vivere,
    adapter: Ecto.Adapters.Postgres,
    read_only: true
end
