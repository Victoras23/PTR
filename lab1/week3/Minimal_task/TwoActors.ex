defmodule TargetActor do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(args) do
    IO.puts "TargetActor : TargetActor started"
    {:ok, args}
  end

  def handle_cast(:stop, _state) do
    IO.puts "TargetActor : TargetActor received stop cast"
    {:stop, :normal, []}
  end
end

defmodule MonitorActor do
  use GenServer

  def start_link(target_pid) do
    GenServer.start_link(__MODULE__, target_pid, name: __MODULE__)
  end

  def init(target_pid) do
    IO.puts "MonitorActor : MonitorActor started"
    Process.monitor(target_pid)
    {:ok, target_pid}
  end

  def handle_info({:DOWN, ref, :process, pid, reason}, target_pid) do
    IO.puts "MonitorActor : Actor with PID #{inspect(pid)} has stopped for reason: #{inspect(reason)}"
    {:stop, reason, target_pid}
  end
end

{:ok, target_pid} = TargetActor.start_link([])
{:ok, monitor_pid} = MonitorActor.start_link(target_pid)
GenServer.cast(target_pid, :stop)
