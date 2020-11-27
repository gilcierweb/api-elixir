defmodule ApiElixir.Insert do
  alias ApiElixir.{Order, Store, OrderItem, Payment,Customer, Repo}

  def create(params) do
#    customer = Customer.changeset(%Customer{}, params)
#    customer = Repo.insert!(customer)
#    order = Ecto.build_assoc(customer, :orders, params)
    order = Order.changeset(%Order{}, params)
#    order = customer |> Order.changeset(%Order{}, params)
##    order = Ecto.build_assoc(customer, :orders, params)
    order = Repo.insert!(order)

#    customer = Ecto.build_assoc(order, :customer, params[:buyer])
#    customer = Repo.insert!(customer)
  end

  def add(params) do
    #    json = params |> Jason.decode!(as: params)
    #    data = %Order{json: json}
    #    Repo.insert(data)
  end
end