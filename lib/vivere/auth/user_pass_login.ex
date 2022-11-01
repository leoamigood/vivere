defmodule Vivere.Auth.UserPassLogin do
  @moduledoc false

  defstruct [:email, :password]

  @type t() :: %__MODULE__{}
end
