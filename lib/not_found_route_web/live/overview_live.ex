defmodule NotFoundRouteWeb.OverviewLive do
  use NotFoundRouteWeb, :live_view
  alias Mix.Phoenix, as: Phoenix
  @searchable_fields [:helper, :path, :plug, :plug_opts, :verb]

  def routes do
    router = Module.concat(["#{Phoenix.base()}Web", "Router"])
    router.__routes__()
  end

  def mount(_, _, socket) do
    socket = socket |> assign(:routes, routes()) |> assign(:keyword, "")
    {:ok, socket}
  end

  def handle_event("search", %{"search" => %{"keyword" => ""}}, socket) do
    {:noreply, assign(socket, :routes, routes())}
  end

  def handle_event("search", %{"search" => %{"keyword" => input}}, socket) do
    filtered_routes = routes() |> Enum.filter(&match_keyword(&1, search_input(input)))

    socket =
      socket
      |> assign(:routes, filtered_routes)
      |> assign(:keyword, input)

    {:noreply, socket}
  end

  def handle_event("set-" <> action, _, %{assigns: %{keyword: input}} = socket) do
    new_input = new_input(input, action)

    filtered_routes = routes() |> Enum.filter(&match_keyword(&1, search_input(new_input)))

    socket =
      socket
      |> assign(:routes, filtered_routes)
      |> assign(:keyword, new_input)

    {:noreply, socket}
  end

  def match_keyword(phoenix_route, {action, keyword}) do
    phoenix_route
    |> Map.take(searchable_fields(action))
    |> Enum.map(fn {_, searchable} ->
      Task.async(fn ->
        searchable |> stringify() |> String.downcase() |> matches?(keyword)
      end)
    end)
    |> Enum.any?(&Task.await(&1))
  end

  def matches?("", _), do: false

  def matches?(string, keyword),
    do: String.jaro_distance(string, keyword) > 0.8 or String.contains?(string, keyword)

  def stringify({type, path}), do: "#{inspect(type)} #{inspect(path)}"
  def stringify([type, path]), do: "#{type} #{path}"
  def stringify(action) when is_binary(action) or is_atom(action), do: "#{action}"
  def stringify(_), do: ""

  def search_input(input) do
    input
    |> normalize()
    |> String.split("#")
    |> action_keyword_return
  end

  def action_keyword_return([keyword]), do: {nil, keyword}
  def action_keyword_return([action, keyword]), do: {action, keyword}
  def action_keyword_return([action | rest]), do: {action, Enum.join(rest, "#")}

  def normalize(keyword), do: keyword |> String.trim() |> String.downcase()

  def searchable_fields("action"), do: [:plug_opts]
  def searchable_fields(nil), do: @searchable_fields

  def searchable_fields(action) do
    action = String.to_existing_atom(action)

    if action in @searchable_fields do
      [action]
    else
      @searchable_fields
    end
  end

  def new_input(input, action) do
    keyword =
      if String.contains?(input, "#") do
        {_, keyword} = search_input(input)
        keyword
      else
        input
      end

    action <> "#" <> keyword
  end

  def plug_opts({type, path}), do: "#{type} #{path}"
  def plug_opts([type, path]), do: "#{type} #{path}"
  def plug_opts(action) when is_binary(action) or is_atom(action), do: action
  def plug_opts(_), do: ""

  def route_plug(plug), do: plug |> Module.split() |> Enum.join(".")

  def handle_info(_, state) do
    {:noreply, state}
  end
end
