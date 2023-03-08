defmodule LongestCommonPrefix do
  def longest_common_prefix(strings) do
    case strings do
      [] -> ""
      [string] -> string
      _ ->
        prefix = Enum.take_while(Enum.at(strings, 0), fn (char, index) ->
          Enum.all?(Enum.drop(strings, 1), fn string ->
            String.at(string, index) == char
          end)
        end)

        prefix |> to_string()
    end
  end
end
IO.inspect LongestCommonPrefix.longest_common_prefix ([" flower " ," flow " ," flight "])
