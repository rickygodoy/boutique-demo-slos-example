# Diagrams Code

## Diagram generated with: https://www.websequencediagrams.com/

## View Cart

```
title View Cart

participant User as user
participant Frontend as fe
participant ProductCatalog Svc as pc
participant Cart Svc as cs
participant Redis as db
participant Currency Svc as cus
participant Recomm Svc as rs
participant Shipping Svc as ss

user->fe: GET /cart
fe->cus: gRPC: getCurrencies
cus->fe: currency codes
fe->cs: gRPC: getCart
cs->db: GetCart
db->cs: 
cs->fe: retun cart itens
fe->rs: gRPC: getRecommendations
rs->fe: recomendation list
fe->ss: gRPC: getShippingQuote
ss->fe: shipping costs
loop For all cart products
fe->pc: gRPC: getProduct
pc->fe: product details
fe->cus: gRPC: convertCurrency
cus->fe: converted product price
end
fe->fe: build view \n render template
fe->user: HTTP response
```

## Add Product to Cart 

```
title Add product to cart

participant User as user
participant Frontend as fe
participant ProductCatalog Svc as pc
participant Cart Svc as cs
participant Redis as db
participant Currency Svc as cus
participant Recomm Svc as rs
participant Shipping Svc as ss

user->fe: POST /cart \n (Add To Cart Button)
fe->pc: gRPC: getProduct
pc->fe: product details
fe->cs: gRPC: insertCart
cs->db: AddItem
db->cs: 
cs->fe: 
fe->user: HTTP response 302 \n redirect to /cart
user->fe: GET /cart
fe->cus: gRPC: getCurrencies
cus->fe: currency codes
fe->cs: gRPC: getCart
cs->db: GetCart
db->cs: 
cs->fe: retun cart itens
fe->rs: gRPC: getRecommendations
rs->fe: recomendation list
fe->ss: gRPC: getShippingQuote
ss->fe: shipping costs
loop For all cart products
fe->pc: gRPC: getProduct
pc->fe: product details
fe->cus: gRPC: convertCurrency
cus->fe: converted product price
end
fe->fe: build view \n render template
fe->user: HTTP response
```

## Place Order

```
title Place Order

participant User as user
participant Frontend as fe
participant Checkout Svc as ch
participant Currency Svc as curr
participant Recomm Svc as reco
participant Product Catalog Svc as pc
participant Assets Svc as ast
participant CDN as cdn


user->fe: POST /cart/checkout \n(with form data in body)

fe->ch: gRPC: PlaceOrder
ch->fe: order details

fe->curr: gRPC: GetSupportedCurrencies
curr->fe: currency codes

fe->reco: gRPC: ListRecommendations
reco->fe: product list

loop For all recomms
    fe->pc: gRPC: GetProduct
    pc->fe: product details
end

fe->fe: build view \n render template
fe->user: HTTP response

user->ast: GET /static/*
ast->user: file bytes

user->cdn: GET: JS/CSS
cdn->user: asset file
```

## Load Home Page

```
title Load Home Page

participant User as user
participant Frontend as fe
participant Currency Svc as curr
participant ProductCatalog Svc as pc
participant Cart Svc as cart


user->fe: GET / \n(home page)
fe->curr: gRPC: GetSupportedCurrencies
curr->fe: currency codes

fe->pc: gRPC: ListProducts
pc->fe: product list

fe->cart: gRPC: GetCart
cart->fe: item list

fe->fe: build view \n render template

fe->user: HTTP response
```

## Load Product Details Page

```
title View Product Details

participant User as user
participant Frontend as fe
participant ProductCatalog Svc as pc
participant Currency Svc as curr
participant Cart Svc as cart
participant Recomm Svc as reco
participant Ad Svc as ad
participant Assets Svc as ast


user->fe: GET /product/{ID} \n(product page)

fe->pc: gRPC: GetProduct
pc->fe: product details


fe->curr: gRPC: GetSupportedCurrencies
curr->fe: currency codes


fe->cart: gRPC: GetCart
cart->fe: cart item list

fe->curr: gRPC ConvertCurrency
curr->fe: converted value

fe->reco: gRPC: ListRecommendations
reco->fe: product list

loop For all recomms
    fe->pc: gRPC: GetProduct
    pc->fe: product details
end

fe->ad: gRPC: GetAds
ad->fe: ad list


fe->fe: build view \n render template
fe->user: HTTP response

user->fe: GET /static/img/products/{PRODUCT_NAME}
fe->ast: static image request
ast->fe: image bytes
fe->user: image bytes
```