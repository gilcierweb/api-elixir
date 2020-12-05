defmodule ApiElixirTest do
  use ExUnit.Case
  use Plug.Test
  doctest ApiElixir
  alias ApiElixir.Router
  import Plug.Conn

  @opts Router.init([])

  test "greets the world" do
    assert ApiElixir.hello() == :world
  end

  test "API alive" do
    resp = HTTPoison.get!("http://localhost:4000")
    assert resp.status_code == 200
  end

  test "GET /gilcierweb" do
    resp = HTTPoison.get!("http://localhost:4000/gilcierweb")
    assert resp.status_code == 200
  end

  test "GET /success" do
    resp = HTTPoison.get!("http://localhost:4000/success")
    assert resp.status_code == 200
  end

  #  test "POST error /checkout" do
  #    resp = HTTPoison.post!("http://localhost:4000/checkout",[])
  #    assert resp.status_code == 415
  #  end

  #  test "POST /checkout" do
  #    params = '
  #      {
  #    "id": 9987071,
  #    "store_id": 282,
  #    "date_created": "2019-06-24T16:45:32.000-04:00",
  #    "date_closed": "2019-06-24T16:45:35.000-04:00",
  #    "last_updated": "2019-06-25T13:26:49.000-04:00",
  #    "total_amount": 49.9,
  #    "total_shipping": 5.14,
  #    "total_amount_with_shipping": 55.04,
  #    "paid_amount": 55.04,
  #    "expiration_date": "2019-07-22T16:45:35.000-04:00",
  #    "total_shipping": 5.14,
  #    "order_items": [
  #      {
  #        "item": {
  #          "id": "IT4801901403",
  #          "title": "Produto de Testes"
  #        },
  #        "quantity": 1,
  #        "unit_price": 49.9,
  #        "full_unit_price": 49.9
  #      }
  #    ],
  #    "payments": [
  #      {
  #        "id": 12312313,
  #        "order_id": 9987071,
  #        "payer_id": 414138,
  #        "installments": 1,
  #        "payment_type": "credit_card",
  #        "status": "paid",
  #        "transaction_amount": 49.9,
  #        "taxes_amount": 0,
  #        "shipping_cost": 5.14,
  #        "total_paid_amount": 55.04,
  #        "installment_amount": 55.04,
  #        "date_approved": "2019-06-24T16:45:35.000-04:00",
  #        "date_created": "2019-06-24T16:45:33.000-04:00"
  #      }
  #    ],
  #    "shipping": {
  #      "id": 43444211797,
  #      "shipment_type": "shipping",
  #      "date_created": "2019-06-24T16:45:33.000-04:00",
  #      "receiver_address": {
  #        "id": 1051695306,
  #        "address_line": "Rua Fake de Testes 3454",
  #        "street_name": "Rua Fake de Testes",
  #        "street_number": "3454",
  #        "comment": "teste",
  #        "zip_code": "85045020",
  #        "city": {
  #          "name": "Cidade de Testes"
  #        },
  #        "state": {
  #          "name": "São Paulo"
  #        },
  #        "country": {
  #          "id": "BR",
  #          "name": "Brasil"
  #        },
  #        "neighborhood": {
  #          "id": null,
  #          "name": "Vila de Testes"
  #        },
  #        "latitude": -23.629037,
  #        "longitude": -46.712689,
  #        "receiver_phone": "41999999999"
  #      }
  #    },
  #    "status": "paid",
  #    "buyer": {
  #      "id": 136226073,
  #      "nickname": "JOHN DOE",
  #      "email": "john@doe.com",
  #      "phone": {
  #        "area_code": 41,
  #        "number": "999999999"
  #      },
  #      "first_name": "John",
  #      "last_name": "Doe",
  #      "billing_info": {
  #        "doc_type": "CPF",
  #        "doc_number": "09487965477"
  #      }
  #    }
  #  }'
  #
  #    resp = HTTPoison.post!("http://localhost:4000/checkout",  params)
  #    assert resp.status_code == 200
  #  end

  test "POST returns checkout" do
    params = ~s({
    "id": 9987071,
    "store_id": 282,
    "date_created": "2019-06-24T16:45:32.000-04:00",
    "date_closed": "2019-06-24T16:45:35.000-04:00",
    "last_updated": "2019-06-25T13:26:49.000-04:00",
    "total_amount": 49.9,
    "total_shipping": 5.14,
    "total_amount_with_shipping": 55.04,
    "paid_amount": 55.04,
    "expiration_date": "2019-07-22T16:45:35.000-04:00",
    "total_shipping": 5.14,
    "order_items": [
      {
        "item": {
          "id": "IT4801901403",
          "title": "Produto de Testes"
        },
        "quantity": 1,
        "unit_price": 49.9,
        "full_unit_price": 49.9
      }
    ],
    "payments": [
      {
        "id": 12312313,
        "order_id": 9987071,
        "payer_id": 414138,
        "installments": 1,
        "payment_type": "credit_card",
        "status": "paid",
        "transaction_amount": 49.9,
        "taxes_amount": 0,
        "shipping_cost": 5.14,
        "total_paid_amount": 55.04,
        "installment_amount": 55.04,
        "date_approved": "2019-06-24T16:45:35.000-04:00",
        "date_created": "2019-06-24T16:45:33.000-04:00"
      }
    ],
    "shipping": {
      "id": 43444211797,
      "shipment_type": "shipping",
      "date_created": "2019-06-24T16:45:33.000-04:00",
      "receiver_address": {
        "id": 1051695306,
        "address_line": "Rua Fake de Testes 3454",
        "street_name": "Rua Fake de Testes",
        "street_number": "3454",
        "comment": "teste",
        "zip_code": "85045020",
        "city": {
          "name": "Cidade de Testes"
        },
        "state": {
          "name": "São Paulo"
        },
        "country": {
          "id": "BR",
          "name": "Brasil"
        },
        "neighborhood": {
          "id": null,
          "name": "Vila de Testes"
        },
        "latitude": -23.629037,
        "longitude": -46.712689,
        "receiver_phone": "41999999999"
      }
    },
    "status": "paid",
    "buyer": {
      "id": 136226073,
      "nickname": "JOHN DOE",
      "email": "john@doe.com",
      "phone": {
        "area_code": 41,
        "number": "999999999"
      },
      "first_name": "John",
      "last_name": "Doe",
      "billing_info": {
        "doc_type": "CPF",
        "doc_number": "09487965477"
      }
    }
  }
)
    json = params

    conn =
      conn(:post, "/checkout", json)
      |> put_req_header("content-type", "application/json")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

#  test "POST Error checkout" do
#    params = ~s({ })
#    json = params
#    conn =
#      conn(:post, "/checkout", json)
#      |> put_req_header("content-type", "application/json")
#      |> Router.call(@opts)
#
#    assert conn.state == :sent
#    assert conn.status == 422
#  end

  test "returns welcome" do
    conn =
      :get
      |> conn("/", "")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "returns 404" do
    conn =
      :get
      |> conn("/missing", "")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
  end

  test "returns hello world" do
    options = ApiElixirPlug.init([])

    conn =
      conn(:get, "/hello")
      |> ApiElixirPlug.call(options)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello, World!"
  end
end
