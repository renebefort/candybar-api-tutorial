
# 🧩 Introduction to APIs

## WHAT IS AN API?

- **API** stands for **Application Programming Interface**.
- An **API** is a clearly defined interface that allows **software applications to communicate** and **exchange data or functions**.
- Think of an API like a **waiter at a restaurant**: it takes your order (request), tells the kitchen (server) what you want, and brings the response (your meal) back to you.

## BENEFITS OF AN API

- **Access Data Anywhere (Public and Private)**
  - APIs allow apps to access external services (e.g., real-time weather, stock prices, location info).
  - Example: A travel app gets flight prices from different airline APIs.
  - No need to build or maintain your own infrastructure (e.g., sensors, databases).

- **Simplified Logins**
  - APIs power "Login with Google/Facebook" buttons.
  - One login gives access to many services securely (OAuth standard).

- **Integration with the Operating System**
  - APIs allow software to use OS capabilities like saving files or printing.
  - Example: Apps use the Windows API to create/open/save files without knowing how the OS internally works.

- **Seamless Collaboration between Applications**
  - Apps can exchange information smoothly and automate workflows.
  - Example: Slack can send alerts when a GitHub pull request is created.


## TYPES OF API

### 🔗 REST API
- **Most widely used** API type for web applications.
- Uses standard **HTTP methods** like `GET`, `POST`, `PUT`, `DELETE` – also known as **CRUD** (Create, Read, Update, Delete).
- Data typically exchanged in **JSON** format.

### 🧼 SOAP API
- **Standardized and XML-based**.
- Strict protocol with built-in error handling and security.
- Common in **enterprise or legacy systems** (e.g., banking, insurance).

### 🔍 GraphQL API
- Clients specify **exact data requirements**, which minimizes data transfer.
- **More efficient** than REST when dealing with complex or nested data.
- Useful for mobile apps with bandwidth limits.

### 📡 WebSocket API
- Enables **real-time, two-way communication** (e.g., chat apps, games, stock tickers).
- Keeps a persistent connection between client and server.

### 💻 Operating System API
- Lets programs **interact with the OS** (e.g., open files, create windows).
- Example: Windows API, macOS Cocoa, Linux system calls.

### 🗃️ Database API
- Interface to **query or manipulate data** in a database.
- Examples: JDBC (Java), ODBC (cross-platform), Python’s SQLite module.

### ⚙️ Hardware API
- Allows software to control **hardware devices** like cameras, printers, or GPUs.
- Example: OpenGL (for 3D graphics), DirectX (Windows gaming APIs).

## REST API (In Depth)

- **REST = Representational State Transfer**
- Communication via **stateless** HTTP requests.
- Each call contains **all necessary data**; the server **does not store client session info**.
- Ideal for web services and **scalable, platform-independent** applications.

### HTTP Methods (aka Verbs)

| Method   | Action               |
| -------- | -------------------- |
| `GET`    | Retrieve data        |
| `POST`   | Create new data      |
| `PUT`    | Update existing data |
| `DELETE` | Remove data          |

> **Note:** REST APIs are simple, open, and form the **foundation of modern web services**.

## HOW DOES AN API WORK?

1. A **client** (e.g., your browser or mobile app) sends a **request** to an API over the internet.
2. The API acts as a **middleman** between the client and a **backend server**.
3. The **server processes the request**, interacts with a **database**, and prepares the response.
4. The API sends the **response** (data, status) back to the client.

> 🧠 **Analogy**:  
> The client is the customer, the API is the waiter, and the backend is the kitchen.

## THE ANATOMY OF A REST API REQUEST

### 📤 POST Request Example

```http
POST http://127.0.0.1:8000/candybars
````

**HTTP Headers:**

```http
Content-Type: application/json  
Accept: application/json  
Authorization: Basic <auth-token>
```

**Request Body:**

```json
{
  "id": "1",
  "name": "hazelnut ice-cream",
  "flavor": "nutty",
  "price": "1.23"
}
```

### ✅ Explanation

* **Method (Verb):** What action you're performing (`GET`, `POST`, etc.).
* **Endpoint (URL):** The exact location you're interacting with.
* **Headers:** Metadata about the request.

  * `Content-Type`: Type of data you're sending (e.g., JSON).
  * `Accept`: Expected response format (e.g., JSON).
  * `Authorization`: Token for secure access.
* **Body:** Data sent to the server (only for POST/PUT).


### 📥 POST Response Example

**Status Code:**

```htttp
200 OK
```

**Response Headers:**

```http
Content-Type: application/json  
Content-Length: 50
```

**Response Body:**

```json
{
  "message": "CandyBar updated successfully"
}
```

### 💡 Common HTTP Status Codes

| Code | Meaning                         |
| ---- | ------------------------------- |
| 200  | OK – Request successful         |
| 201  | Created – New resource made     |
| 400  | Bad Request – Invalid input     |
| 401  | Unauthorized – No/invalid token |
| 404  | Not Found – Resource missing    |
| 500  | Server Error – API crashed      |

## 📑 API CONTRACT – What to Consider

An **API contract** is a documented **agreement** between API providers and consumers. It defines how the API behaves.

### Key Elements:

* ✅ **Understand the purpose** – What does the API solve?
* 👥 **Define the users** – Internal team, partners, or public?
* 📄 **Choose the format** – JSON, XML, etc.
* 🔁 **Specify HTTP methods** – GET, POST, etc.
* 🧾 **List parameters** – Required fields, data types, examples.
* ❌ **Define error handling** – Error codes and messages.
* 🧩 **Structure endpoints** – Consistent, predictable URL paths.
* 🔐 **Consider authentication** – API keys, tokens, OAuth2.
* 📝 **Document everything** – Use Swagger/OpenAPI or Markdown.

## 🧠 IN A NUTSHELL

### ✅ Benefits of APIs

* **Real-Time Data Access**

  * Live updates from third-party systems (e.g., weather, delivery status).

* **System Integration**

  * Connect diverse systems, apps, and platforms.

* **Data Integration and Validation**

  * Merge and verify data from multiple sources.

* **Scalability and Reusability**

  * Modular and reusable – write once, use many times.

* **Driving Innovation**

  * Connect to AI, IoT, and cloud platforms with ease.

* **Enhanced User Experience**

  * Single sign-on, smart form completion, personalized services.

> 🚀 **Summary**: APIs are the **key to greater efficiency, openness, and innovation** in modern IT ecosystems. They are the glue that holds the digital world together.
