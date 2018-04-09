defmodule Exsms.MixProject do
  use Mix.Project

  def project do
    [
      app: :exsms,
      version: "0.1.0",
      elixir: "~> 1.6",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Exsms",
      source_url: "https://gitlab.com/ahamtech/elixir/exsms"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:httpoison]
    ]
  end

  defp description() do
    "Exsms: A Elixir library for sending transactional SMS - supoprts Sendinblue, mailjet and textlocal"
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
  defp package() do
    [
      name: "exsms",
      files: ["lib", "mix.exs", "README*","LICENSE*"],
      maintainers: ["Anwesh Reddy","Mahesh Reddy", "Malreddy Ankanna"],
      licenses: ["GNU Lesser General Public License v3.0"],
      links: %{"GitHub" => "https://gitlab.com/ahamtech/elixir/exsms"}
    ]
  end

end
