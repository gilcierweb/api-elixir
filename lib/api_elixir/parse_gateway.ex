defmodule ApiElixir.ParseGateway do

  def parse_data(params) do
    %{
      externalCode: params["id"],
      storeId: params["store_id"],
      subTotal: params["total_amount"],
      deliveryFee: params["total_shipping"],
      total: params["total_amount_with_shipping"],
      country: params["shipping"]["receiver_address"]["country"]["id"],
      state: params["shipping"]["receiver_address"]["state"]["name"],
      city: params["shipping"]["receiver_address"]["city"]["name"],
      district: params["shipping"]["receiver_address"]["neighborhood"]["name"],
      street: params["shipping"]["receiver_address"]["street_name"],
      complement: params["shipping"],
      latitude: params["shipping"]["receiver_address"]["latitude"],
      longitude: params["shipping"]["receiver_address"]["longitude"],
      dtOrderCreate: date_current(),
      postalCode: params["shipping"]["receiver_address"]["zip_code"],
      number: "0",
      customer: parse_customer(params),
      items: Enum.map(params["order_items"], &parse_item/1),
      payments: Enum.map(params["payments"], &parse_payment/1),
      total_shipping: params["total_shipping"]
    }
  end

  def parse_customer(params) do
    %{
      externalCode: params["buyer"]["id"],
      name: params["buyer"]["nickname"],
      email: params["buyer"]["email"],
      contact: "#{params["buyer"]["phone"]["area_code"]}#{params["buyer"]["phone"]["number"]}",
    }
  end

  def parse_item(params) do
    %{
      externalCode: params["item"]["id"],
      name: params["item"]["title"],
      price: params["unit_price"],
      quantity: params["quantity"],
      total: params["full_unit_price"],
      subitems: []
    }
  end

  def parse_payment(params) do
    %{
      type: params["payment_type"],
      value: params["total_paid_amount"]
    }
  end

  def date_current do
    DateTime.utc_now
    |> DateTime.to_string
  end
end
