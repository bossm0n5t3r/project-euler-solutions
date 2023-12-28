defmodule FileUtil do
  def read_file(filename) do
    path = Path.expand("../resources/#{filename}", __DIR__)

    case File.read(path) do
      {:ok, lines} ->
        lines |> String.replace("\n", "")

      {:error, _} ->
        IO.puts("Error: #{filename} file not found")
        System.halt(1)
    end
  end
end
