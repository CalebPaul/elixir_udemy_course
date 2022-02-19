defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
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
