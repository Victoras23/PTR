import Week1

print_hello()
defmodule TestWeek1 do
  use ExUnit.Case
  import ExUnit.CaptureIO

  ExUnit.start()

  test "prints Hello PTR" do
    assert capture_io(fn ->
      Week1.print_hello()
    end) == "Hello PTR\n"
  end
end
