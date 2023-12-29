defmodule FileUtil do
  @spec read_text(String.t()) :: String.t()
  def read_text(filename) do
    path = Path.expand("../resources/#{filename}", __DIR__)

    case File.read(path) do
      {:ok, lines} ->
        lines

      {:error, _} ->
        IO.puts("Error: #{filename} file not found")
        System.halt(1)
    end
  end

  @spec read_lines(String.t()) :: list(String.t())
  def read_lines(filename) do
    path = Path.expand("../resources/#{filename}", __DIR__)

    case File.read(path) do
      {:ok, lines} ->
        lines |> String.split("\n", trim: true)

      {:error, _} ->
        IO.puts("Error: #{filename} file not found")
        System.halt(1)
    end
  end
end
