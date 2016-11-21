defmodule PhoenixBase.SecretKey do
  @moduledoc """
    Secret key init
  """

  def fetch do
    System.get_env("SECRET_KEY_PASSPHRASE") || "example"
  end
end
