defmodule Number do
def arrange_digits(a, b, c) do
  [a, b, c]
  |> Enum.sort()
  |> Enum.reverse()
  |> List.to_string()
  |> String.to_integer()
end
end
IO.inspect Number.arrange_digits(4, 5, 3)
