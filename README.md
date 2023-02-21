# :memo: E-commerce database design

## Group member:
- Anup Nepal
- Quan Nguyen
- Maksim Pasnitsenko
- Nhu Nguyen

## Tasks have been done
1. Create ERD diagram for database 
2. Design the API endpoints, following REST API architecture.
3. Database queries using to create database, and CRUD operations.

### ERD diagram for E-commerce database
![ERD diagram](assets/images/ERD.PNG)

### Design REST API endpoints
#### Products 
```
Get single product
[GET] /api/v1/products/{id}

Create a product
[POST] /api/v1/products

Update a single product
[PUT] /api/v1/products/{id}

Delete a single product
[DELETE] /api/v1/products/{id}

Get all products
[GET] /api/v1/products

Pagination for products
[GET] /api/v1/products?offset={offset}&limit={limit}

Sort all products based on {field} (can be first_name, last_name, etc.). It works with pagnation as well.
[GET] /api/v1/products?sortBy={field}&sortOrder={order}

Search for a product / user by date
[GET] /api/v1/products?creation-date={dateFrom}
[GET] /api/v1/products?creation-date={dateFrom}

Filter products by price
[GET] /api/v1/products?price={price}

Filter products by price range
[GET] /api/v1/products?price_min={minPrice}&price_max={maxPrice}

Filter by category
[GET] /api/v1/products?category_id={id}

```
#### Users
```
Get all users' names
[GET] /api/v1/users

Sort all users based on {field} (can be first_name, last_name, etc.)
[GET] /api/v1/users?sortBy={field}&sortOrder={order}

Get a single user
[GET] /api/v1/users/{id}

Create a user
[POST] /api/v1/users

Update a user
[PUT] /api/v1/users/{id}

Delete the user
[DELETE] /api/v1/users/{id}

Authenticate user and generate access token
[POST] /api/v1/auth

```
#### Categories
```
Get all categories
[GET] /api/v1/categories

Get all products from a single category
[GET] /api/v1/categories/{id}
[GET] /api/v1/categories?offset={offset}&limit={limit}/{id}

Create a category
[POST] /api/v1/categories

Update a category
[PUT] /api/v1/categories/{id}

Delete a category
[DELETE] /api/v1/categories/{id}
```
#### Images
```
Get a single image
[GET] /api/v1/images/{id}

Get all images from a specific products or category or user
[GET] /api/v1/images?group={group}

Upload an image
[POST] /api/v1/images

Update a single image
[PUT] /api/v1/images/{id}

Delete a single image
[DELETE] /api/v1/images/{id}

```

