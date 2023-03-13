# packageHut Api Documentation: v1

This a RESTful API that allows you to access packageHut's data.

## Table of Contents

- [Authentication](#authentication)
  - [Shop Authentication](#shop-authentication)
    - [create Shop](#create-shop)
    - [show owner login](#show-owner-login)
  - [User](#user)
    - [User Register](#user-register)
    - [user login][def]

## Shop Authentication

### create Shop

```js
POST /api/v1/shop
```

```js
{
    "Id": "Shop ID",
    "name": "Shop Name",
    "logo": "Shop Logo",
    "description": "Shop Description",
    "owner": "Shop Owner",
    "email": "Shop Email",
    "phone": "Shop Phone",
    "password": "Shop Password",
    "address": "Shop Address",
    "city": "Shop City",
    "location": {
        "lat": "Shop Latitude",
        "lng": "Shop Longitude"
    },
    "created": "Shop Created",
    "updated": "Shop Updated"
}
```

```js
    200 ok
```

## create shop response

```js
{
    "Id": "Shop ID",
    "name": "Shop Name",
    "logo": "url to Shop Logo",
    "description": "Shop Description",
    "owner": "Shop Owner",
    "email": "Shop Email",
    "phone": "Shop Phone",
    "token": "Shop Token",
}
```

### show owner login

```js
POST /api/v1/shop/login
```

```js
{
    "email": "Shop Email",
    "password": "Shop Password"
}
```

```js
    200 ok
```

## login shop response

```js
{
    "Id": "Shop ID",
    "name": "Shop Name",
    "logo": "url to Shop Logo",
    "description": "Shop Description",
    "owner": "Shop Owner",
    "email": "Shop Email",
    "phone": "Shop Phone",
    "token": "Shop Token",
}
```

## User

### User Register

```js
POST /api/v1/user
```

```js
{
    "Id": "User ID",
    "name": "User Name",
    "email": "User Email",
    "phone": "User Phone",
    "location": {
        "lat": "User Latitude",
        "lng": "User Longitude"
    },
    "password": "User Password",
    "created": "User Created",
    "updated": "User Updated"
}
```

```js
    200 ok
```

#### User Resgister Response

```js
{
    "Id": "User ID",
    "name": "User Name",
    "email": "User Email",
    "phone": "User Phone",
    "token": "User Token",
}
```

### user login

```js
{
    "email": "User Email",
    "password": "User Password"
}
```

```js
    200 ok
```

#### user login response

```js
{
    "Id": "User ID",
    "name": "User Name",
    "email": "User Email",
    "phone": "User Phone",
    "token": "User Token",
}
```

[def]: #user-login

## Inventory

### create Inventory

```js
POST /api/v1/inventory
```

```js
{
    "Id": "Inventory ID",
    "shop": "shop Id",
    "name": "Inventory Name",
    "description": "Inventory Description",
    "price": "Inventory Price",
    "quantity": "Inventory Quantity",
    "shop": "Inventory Shop",
    "created": "Inventory Created",
    "updated": "Inventory Updated"
}
```

```js
    200 ok
```

#### create Inventory response

```js
{
    "Id": "Inventory ID",
    "shop": "shop Id",
    "name": "Inventory Name",
    "description": "Inventory Description",
    "price": "Inventory Price",
    "quantity": "Inventory Quantity",
    "shop": "Inventory Shop",
    "created": "Inventory Created",
    "updated": "Inventory Updated"
}
```

### show Inventory

```js  
GET /api/v1/inventory/:id
```

```js
    200 ok
```

#### show Inventory response

```js
{
    "Id": "Inventory ID",
    "shop": "shop Id",
    "name": "Inventory Name",
    "description": "Inventory Description",
    "price": "Inventory Price",
    "quantity": "Inventory Quantity",
    "shop": "Inventory Shop",
    "created": "Inventory Created",
    "updated": "Inventory Updated"
}
```

### update Inventory

```js
PUT /api/v1/inventory/:id
```

```js
{
    "Id": "Inventory ID",
    "shop": "shop Id",
    "name": "Inventory Name",
    "description": "Inventory Description",
    "price": "Inventory Price",
    "quantity": "Inventory Quantity",
    "shop": "Inventory Shop",
    "created": "Inventory Created",
    "updated": "Inventory Updated"
}
```

```js
    200 ok
```

#### update Inventory response

```js
{
    "Id": "Inventory ID",
    "shop": "shop Id",
    "price": "Inventory Price",
    "quantity": "Inventory Quantity",
    "created": "Inventory Created",
    "updated": "Inventory Updated"
}
```

## Products

### create Product

```js
POST /api/v1/product
```

```js
{
    "Id": "Product ID",
    "inventory": "Inventory ID",
    "name": "Product Name",
    "description": "Product Description",
    "price": "Product Price",
    "quantity": "Product Quantity",
    "created": "Product Created",
    "updated": "Product Updated"
}
```

```js
    200 ok
```
