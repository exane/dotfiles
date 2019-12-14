Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
  colors: [enabled: true, eval_result: [:cyan, :bright]],
  default_prompt:
    [
      "\e[G",
      [:blue, :bright],
      "%prefix",
      ">",
      :reset
    ]
    |> IO.ANSI.format()
    |> IO.chardata_to_string()
)
