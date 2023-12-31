defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "bmp" -> "image/bmp"
      "gif" -> "image/gif"
      "jpg" -> "image/jpg"
      "png" -> "image/png"
      "exe" -> "application/octet-stream"
      _ -> nil
    end
  end

  def type_from_binary(file_binary) do
    case file_binary do
      <<0x42, 0x4D, _::binary>> -> "image/bmp"
      <<0x47, 0x49, 0x46, _::binary>> -> "image/gif"
      <<0xFF, 0xD8, 0xFF, _::binary>> -> "image/jpg"
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>> -> "image/png"
      <<0x7F, 0x45, 0x4C, 0x46, _::binary>> -> "application/octet-stream"
      _ -> nil
    end
  end

  def verify(file_binary, extension) do
    type_from_binary = type_from_binary(file_binary)

    if type_from_binary && type_from_binary == type_from_extension(extension) do
      {:ok, type_from_binary}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
