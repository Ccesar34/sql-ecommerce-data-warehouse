import pandas as pd
import random
from faker import Faker

fake = Faker('pt_BR')

# -------------------------
# Customers
# -------------------------

customers = []

for i in range(1, 1001):
    customers.append({
        "customer_id": i,
        "name": fake.name(),
        "email": fake.email(),
        "city": fake.city(),
        "state": fake.estado_sigla(),
        "signup_date": fake.date_between(start_date='-2y', end_date='today')
    })

df_customers = pd.DataFrame(customers)
df_customers.to_csv("customers.csv", index=False)

# -------------------------
# Products
# -------------------------

categories = ["Eletrônicos", "Informática", "Casa", "Escritório", "Games"]

products = []

for i in range(1, 51):
    products.append({
        "product_id": i,
        "product_name": fake.word().capitalize(),
        "category": random.choice(categories),
        "price": round(random.uniform(50, 5000), 2)
    })

df_products = pd.DataFrame(products)
df_products.to_csv("products.csv", index=False)

# -------------------------
# Orders
# -------------------------

orders = []

for i in range(1, 10001):
    orders.append({
        "order_id": i,
        "customer_id": random.randint(1, 1000),
        "order_date": fake.date_between(start_date='-1y', end_date='today'),
        "status": random.choice(["Delivered", "Shipped", "Cancelled"])
    })

df_orders = pd.DataFrame(orders)
df_orders.to_csv("orders.csv", index=False)

# -------------------------
# Order Items
# -------------------------

order_items = []

for i in range(1, 20001):
    product_id = random.randint(1, 50)

    order_items.append({
        "order_item_id": i,
        "order_id": random.randint(1, 10000),
        "product_id": product_id,
        "quantity": random.randint(1, 5),
        "unit_price": round(random.uniform(50, 5000), 2)
    })

df_order_items = pd.DataFrame(order_items)
df_order_items.to_csv("order_items.csv", index=False)

print("Datasets gerados com sucesso!")