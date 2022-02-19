defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> mirror_row
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    # `| _tail` lets us discard the other list items while still pattern matching
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
  hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

  %Identicon.Image{hex: hex}
  end

end
