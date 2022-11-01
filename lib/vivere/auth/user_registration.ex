defmodule Vivere.Auth.UserRegistration do
  @moduledoc false

  defstruct [:email, :password, :password_confirmation]

  @type t() :: %__MODULE__{}
end
