defmodule PhoenixBase.LayoutView do
  use PhoenixBase.Web, :view

  def sign_out_options do
    if Mix.env == :test do
      []
    else
      ["ujs-method": "delete"]
    end
  end
end
