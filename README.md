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
Get all products
[GET] /api/products

Get single product
[GET] /api/products/{id}

Create a product
[POST] /api/products

Update a single product
[PUT] /api/products/{id}

Delete a single product
[DELETE] /api/products/{id}
```
#### Users
```
Get all products
[GET] /api/users

Get a single user
[GET] /api/users/{id}

Create a user
[POST] /api/users

Update a user
[PUT] /api/users/{id}

Delete the user
[DELETE] /api/users/{id}
```
#### Categories
```
Get all categories
[GET] /api/categories

Get a single category
[GET] /api/categories/{id}

Create a category
[POST] /api/categories

Update a category
[PUT] /api/categories/{id}

Delete a category
[DELETE] /api/categories/{id}
```
#### Images
```
Get a single image
[GET] /api/images/{id}

Upload an image
[POST] /api/images

Update a single image
[PUT] /api/images/{id}

Delete a single image
[DELETE] /api/images/{id}
```

