defmodule PrintInput do
  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:print, message}, state) do
    IO.puts(message)
    {:noreply, state}
  end

  def handle_info(_message, state) do
    {:noreply, state}
  end
end

{:ok, pid} = PrintInput.start_link
GenServer.cast(pid, {:print, "I've resived this Message"})
GenServer.cast(pid, {:print, "Also this one"})
GenServer.cast(pid, {:print, "And this"})
