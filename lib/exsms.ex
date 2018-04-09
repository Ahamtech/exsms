defmodule Exsms do

  def send(service, payload) do
    case check_service(service) do
      :true ->
        process_response_body(service, payload)
      :false ->
        {:error, "Service Not Found"}
    end
  end

  def process_response_body(service, body) do
    config = serviceconfig(service)
    headers = auth_headers(service, config)
    build_payload(config, service, body)
    |> Poison.encode
    |> case  do
      {:ok, payload} ->
        request(config[:type], config[:url], payload, headers)
      {:error, error} ->
        {:error, error}
    end
  end

  def build_payload(config, service, payload) do
    case service do
      :textlocal ->
        Map.put_new payload, :apiKey, config[:api]
      _->
        payload
    end
  end

  def auth_headers(service, config) do
    case service do
      :sendinblue ->
        [{"api-key", config[:api]}, {"Content-Type", "application/json"}]
      :mailjet ->
        [{"Authorization", "Bearer " <> config[:api]}, {"Content-Type", "application/json"}]
      :textlocal->
        []
    end
  end

  def serviceconfig(service) do
    case service do
      :sendinblue ->
        Application.get_env(:exsms, :sendinblue)
      :mailjet ->
        Application.get_env(:exsms, :mailjet)
      :textlocal ->
        Application.get_env(:exsms, :textlocal)
      _ ->
        "Service Not Found"
    end
  end

  defp check_service(service) do
    case service do
      service when service in [:sendinblue, :mailjet, :textlocal] ->
        :true
      _ ->
        :false
    end
  end

  def request(method, url, body, headers) do
    url = String.to_charlist(url)
    HTTPoison.request(method,url, body, headers)
    |> normalise_response
  end

  defp normalise_response(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body}} ->
          {:ok, body}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
