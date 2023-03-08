# Functional Programming / The Actor Model

### Course: Real Time Programming
### Author: Botnaru Victor, FAF-202

## Tasks:

## Week 1 :
### Minimal Tasks 
Follow an installation guide to install the language / development environ-
ment of your choice.

Write a script that would print the message “Hello PTR” on the screen. Execute it.

### Implimentation
```elixir
    defmodule Week1 do
        def print_hello() do
            IO.puts ("Hello PTR")
        end
    end
```

### Main Task 
Initialize a VCS repository for your project. 

### Bonus Task
Push your project to a remote repo. 

Write a comprehensive readme for your repository.

Create a unit test for your project. Execute it.

### Implimentation
```elixir
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

```

## Week 2 :