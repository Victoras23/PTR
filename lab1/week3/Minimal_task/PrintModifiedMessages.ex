defmodule PrintModifiedMessages do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, []}
  end

  def handle_cast(message, state) do
    modified_message =
      case message do
        n when is_integer(n) ->
          IO.puts "Integers Received: #{n + 1}"
          n
        s when is_binary(s) ->
          modified_string = String.downcase(s)
          IO.puts "Strings Received: #{modified_string}"
          modified_string
        _ ->
          IO.puts "Received: I don’t know how to HANDLE this!"
          message
      end

    {:noreply, [modified_message | state]}
  end
end


{:ok, pid} = PrintModifiedMessages.start_link()
GenServer.cast(pid, 10)
GenServer.cast(pid, "Hello")
GenServer.cast(pid, {10, "Hello"})
