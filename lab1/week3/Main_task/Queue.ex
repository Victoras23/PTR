defmodule QueueActor do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, []}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call(:pop, _from, []) do
    {:reply, :empty, []}
  end
end

defmodule Queue do
  def new_queue do
    {:ok, pid} = QueueActor.start_link
    pid
  end

  def push(pid, item) do
    GenServer.cast(pid, {:push, item})
    :ok
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end
end


pid = Queue.new_queue
Queue.push(pid, 10)
Queue.push(pid, 20)
Queue.push(pid, 50)
Queue.push(pid, 80)



IO. inspect Queue.pop(pid)
IO. inspect Queue.pop(pid)
IO. inspect Queue.pop(pid)
IO. inspect Queue.pop(pid)
