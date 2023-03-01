defmodule TT do
def translate(sentence, dict) do
  String.split(sentence)
  |> Enum.map(fn word -> dict[word] || word end)
  |> Enum.join(" ")
end
end
IO.inspect TT.translate ([" mama ": " mother " ," papa ": " father "] dict)
