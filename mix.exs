defmodule HelloAsh.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_ash,
      version: "0.1.0",
      elixir: "~> 1.16-rc",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HelloAsh.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :ash, "~> 2.17.17" }
    ]
  end
end
