defmodule ExClubhouse.Ops.File do
  @moduledoc """
  File ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :file_list,
      method: :get,
      path: "files"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(file_public_id) do
    %Operation{
      id: :file_get,
      method: :get,
      path: "files/#{file_public_id}"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.File.t()) :: ExClubhouse.Operation.t()
  def update(file_public_id, %Input.File{} = file_input) do
    %Operation{
      id: :file_update,
      method: :put,
      body: Map.from_struct(file_input),
      path: "files/#{file_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(file_public_id) do
    %Operation{
      id: :file_delete,
      method: :delete,
      path: "files/#{file_public_id}"
    }
  end

  @spec upload(binary() | [binary()]) :: ExClubhouse.Operation.t()
  def upload(file_paths) do
    %Operation{
      id: :file_upload,
      method: :post,
      path: "files",
      body: build_multipart(file_paths)
    }
  end

  defp build_multipart(file_path) when is_binary(file_path) do
    {:multipart, [single_file_path(file_path)]}
  end

  defp build_multipart(file_paths) when is_list(file_paths) do
    multipart =
      file_paths
      |> Enum.map(fn file_path ->
        single_file_path(file_path)
      end)

    {:multipart, multipart}
  end

  defp single_file_path(file_path) do
    {:file, file_path, {"form-data", [name: Path.basename(file_path), filename: Path.basename(file_path)]}, []}
  end
end
