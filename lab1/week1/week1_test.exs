defmodule TestWeek1 do
  use ExUnit.Case
  import ExUnit.CaptureIO

  setup do
    ExUnit.start()
    :ok
  end

  test "prints Hello PTR" do
    assert capture_io(fn ->
      Week1.print_hello()
    end) == "Hello PTR\n"
  end
end
