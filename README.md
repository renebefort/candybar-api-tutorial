# candybar-api-tutorial

Consuming a Candy Bar API in SQL Server, PowerShell, Command Line, and EchoAPI

Don't be afraid to use APIs! There are many ways to interact with a REST API. This tutorial introduces a simple example and demonstrates different ways to connect to the API.

## Project Overview

The project consists of two parts:
1. **The Server:** Built with Python and FastAPI.
2. **The Clients:** Examples using SQL Server, PowerShell, and command-line tools.

## Server

This project provides a simple FastAPI-based REST API for managing a collection of candy bars. It is designed as a tutorial for beginners to demonstrate how to build, consume, and interact with APIs using Python, SQL Server, PowerShell, and command-line tools.

### API Endpoints (Contracts)

- **GET /**  
  Returns a welcome message.  
  **Response:**  
  `{ "message": "Welcome to the CandyBar API" }`

- **GET /candybar**  
  Returns all candies.  
  **Query Parameter:**  
  - `flavor` (optional): Filter candies by flavor (case-insensitive).  
  **Response:**  
  `{ "candies": { <id>: { "id": int, "name": str, "flavor": str, "price": float }, ... } }`

- **GET /candybar/{candy_id}**  
  Returns a specific candy by its ID.  
  **Response:**  
  `{ "id": int, "name": str, "flavor": str, "price": float }`  
  **Error:** 404 if not found.

- **POST /candybar**  
  Adds a new candy.  
  **Request Body:**  
  `{ "id": int, "name": str, "flavor": str, "price": float }`  
  **Response:**  
  `{ "message": "Candy added successfully to the Candy Bar" }`  
  **Validation:**  
  - Fails if `id` already exists (400).
  - Fails if `price >= 10` (400).

- **PUT /candybar/{candy_id}**  
  Updates an existing candy.  
  **Request Body:**  
  `{ "id": int, "name": str, "flavor": str, "price": float }`  
  **Response:**  
  `{ "message": "Candy updated successfully" }`  
  **Error:** 404 if not found.

- **DELETE /candybar/{candy_id}**  
  Deletes a candy by ID.  
  **Response:**  
  `{ "message": "Candy deleted successfully" }`  
  **Error:** 404 if not found.

### Special Use Cases

- **Filtering:**  
  Use the `flavor` query parameter on `GET /candybar` to filter candies by flavor.

- **Validation:**  
  - Cannot add a candy with an existing `id`.
  - Candy `price` must be less than 10.

### Start Server

To run the server the following command is needed

change into folder `\candybar-api-tutorial\server`

execute ``uvicorn main:app --reload``

## Clients

This section shows different ways to interact with the CandyBar API. All examples are beginner-friendly and require no prior experience with APIs.

### Health Check

The first endpoint is a simple health check. You can use this to verify that the server is running and reachable.

- **How to use:**  
  Open your web browser and go to:  
  [http://127.0.0.1:8000](http://127.0.0.1:8000)  
  You should see a welcome message in JSON format.

### Swagger (Interactive API Documentation)

FastAPI automatically generates interactive documentation for your API using Swagger.

- **How to use:**  
  Open your web browser and go to:  
  [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)  
  Here, you can see all available endpoints, try them out directly in the browser, and view example requests and responses.  
  This is a great way to explore the API without writing any code.

### PowerShell

Windows PowerShell is a powerful tool that can send HTTP requests to REST APIs. You can use it to interact with the CandyBar API from the command line.

- **How to use:**  
  Open PowerShell and run the provided scripts.  
  Example scripts included in this project:

  - **AddCandies.ps1**  
    This script adds new candies to the candy bar using the POST endpoint.  
    _Tip: You can open the script in a text editor to see how it works._

  - **GetCandiesAsJson.ps1**  
    This script retrieves all candies from the candy bar and prints the JSON response to the console.

  - **GetCandiesAsGrid.ps1**  
    This script retrieves all candies and displays them in a user-friendly grid format.

- **How to run a script:**  
  In PowerShell, navigate to the folder containing the script and run:  
  ```powershell
  .\AddCandies.ps1
  ```

### MS SQL

Microsoft SQL Server can also interact with HTTP endpoints using built-in functions. This allows you to call the API directly from SQL queries.

- **How to use:**  
  Use the provided SQL script to call the GET endpoint and display the results as a table (grid) in SQL Server Management Studio.

- **Why is this useful?**  
  You can integrate external API data into your database workflows, reports, or automation tasks.

### cURL (Command Line)

cURL is a command-line tool available on most operating systems (including Windows, macOS, and Linux) that allows you to send HTTP requests directly from the terminal or command prompt. It is a great way to quickly test API endpoints without any additional software.

**Example:**  
The following command sends a POST request to the `/candybar` endpoint with invalid data (price too high) to demonstrate how the API responds to validation errors:

```batch
curl -X POST "http://127.0.0.1:8000/candybar" ^
  -H "accept: application/json" ^
  -H "Content-Type: application/json" ^
  -d "{\"id\":99,\"name\":\"ice-cream\",\"flavor\":\"nice\",\"price\":100}"
```

- `-X POST` specifies the HTTP method.
- `-H` adds HTTP headers (here, for JSON content).
- `-d` sends the request body as JSON.

cURL is a simple and powerful way to interact with APIs and see raw responses, including error messages and validation feedback.

### EchoAPI (VS Code Extension)

EchoAPI is a Visual Studio Code extension that allows you to send HTTP requests directly from your editor. It is especially useful for testing and exploring REST APIs without leaving your coding environment.

- **How to use:**
  1. Install the EchoAPI extension from the VS Code marketplace.
  2. Create for each Request a configuretion.
  3. Write your HTTP requests, for example:
     ```
     GET http://127.0.0.1:8000/candybar
     ```
  4. Click the "Send Request" button above the request line, or use the shortcut provided by EchoAPI.
  5. View the response directly in VS Code.

This approach is beginner-friendly and helps you learn how HTTP requests work in practice.

### Postman

Postman is a popular, user-friendly tool for testing and developing APIs. It provides a graphical interface to send requests, inspect responses, and organize your API calls.

- **How to use:**
  1. Download and install Postman (it's free and open source).
  2. Create a new request, enter the API URL, select the HTTP method (GET, POST, etc.), and send the request.
  3. View the response, status codes, and headers in the Postman interface.

Postman is widely used in the industry and is great for both beginners and pro

**Tip for Newbies:**  
- Try each method step by step.
- Use Swagger to experiment with the API before writing scripts or SQL.
- If you get stuck, check the server output for error messages or consult the FastAPI documentation.
- All tools and scripts used in this tutorial are open source. Visual Studio Code is a powerful, free environment that supports extensions like EchoAPI, making it an excellent choice for learning and working with APIs. Try out different tools to see which one fits your workflow best!

With these examples, you will learn how to connect to and use a REST API.