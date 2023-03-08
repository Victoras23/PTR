defmodule Averager do
  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end

  def init(initial_value) do
    {:ok, initial_value}
  end

  def handle_cast({:add, num}, sum) do
    average = (sum + num) / 2.0
    IO.puts "Current average is #{average}"
    GenServer.cast(__MODULE__, {:average, num})
    {:noreply, sum + num}
  end

  def add(pid, num) do
    GenServer.cast(pid, {:add, num})
  end
end

{:ok, pid} = Averager.start_link(0)
Averager.add(pid, 10)
Averager.add(pid, 20)
Averager.add(pid, 50)
