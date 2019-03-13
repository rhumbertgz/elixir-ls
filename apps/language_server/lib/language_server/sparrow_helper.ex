defmodule SparrowLS.SparrowHelper do

  def format_error_messages(diagnostics) do
    Enum.map(diagnostics, fn d ->
        case String.starts_with?(d.message, "** (Sparrow.Exc")  do
          true ->
              [m | rest] = String.split(d.message, "\n")
              [_,line | _] = Enum.reverse(rest)
              [_,ln, _] = String.split(line, ":")
              line_number = String.to_integer(ln)
              m = m <> "\n" <> line
              %Mix.Task.Compiler.Diagnostic{d | message: m, position: line_number}
          false ->
              d
        end
    end)
  end

end
