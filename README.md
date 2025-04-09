# ApelMusic

ApelMusic is a comprehensive web application for a music learning platform where users can browse, purchase, and manage various music courses across different instrument categories. The platform features user authentication, course management, payment processing, and an administrative dashboard.



## Project Overview

This full-stack application is built with:

- **Frontend**: React.js
- **Backend**: ASP.NET Core C#
- **Database**: PostgreSQL

## Features

### User Features
- Browse music courses by category (Piano, Guitar, Drums, etc.)
- View detailed course information 
- Add courses to cart
- View and manage purchased courses
- Account management (registration, login, password reset)


## Technology Stack

### Frontend
- **React.js**: Core UI library
- **Material-UI**: Component library for styling
- **React Router**: For navigation
- **Axios**: For API requests
- **Context API**: For state management

### Backend
- **ASP.NET Core**: Web API framework
- **C#**: Backend programming language
- **JWT Authentication**: For secure user authentication
- **PostgreSQL**: Database for data storage
- **ADO.NET**: Data access technology for direct database operations and custom SQL queries

## Project Structure

### Frontend Structure
- **Components**: Reusable UI components
- **Pages**: Main application views
- **Context**: Application state management
- **API**: API request handlers
- **Routes**: Route definitions and protection
- **Assets**: Static resources

### Backend Structure
- **Controllers**: API endpoints handling
- **Logic**: Business logic implementation
- **Models**: Data structures
- **Authentication**: User authentication handling
- **Database**: Database connection and operations

## Installation and Setup

### Prerequisites
- Node.js and npm
- .NET SDK
- PostgreSQL

### Frontend Setup
1. Clone the repository
```bash
git clone https://github.com/FirTA/apelmusic-project.git
cd apelmusic-project/frontend
```

2. Install dependencies
```bash
npm install
```

3. Run the development server
```bash
npm start
```

4. Access the application at http://localhost:3000

### Backend Setup
1. Navigate to the backend directory
```bash
cd ../backend/apelmusic
```

2. Restore dependencies
```bash
dotnet restore
```

3. Update database connection in `appsettings.json`

4. Run the application
```bash
dotnet run
```

5. API will be available at http://localhost:8471

## API Endpoints

The application provides various endpoints for different functionalities:

### Authentication
- `POST /api/User/Registration`: Register a new user
- `POST /api/User/login`: Login a user
- `PUT /api/User/activation/{token}`: Activate user account
- `POST /api/User/tokenidentity`: Validate user token
- `POST /api/User/resetpassword`: Reset user password

### Courses
- `GET /api/Course/GetCourse`: Get all courses
- `GET /api/Course/GetCourseUser`: Get courses for a specific user
- `GET /api/Course/GetCartUser`: Get cart items for a user
- `POST /api/Course/InsertCourseUser`: Add a course to user's cart
- `DELETE /api/Course/DeleteCourseUser`: Remove a course from cart
- `PUT /api/Course/ChangeCheckedCourseUser`: Update course selection in cart

### Categories
- `GET /api/Category/GetCategory`: Get all course categories

### Payments
- `GET /api/PaymentMethod/GetPayment`: Get all payment methods
- `POST /api/PaymentMethod/InsertPayment`: Add a payment method (admin)
- `PUT /api/PaymentMethod/UpdatePayment`: Update a payment method (admin)
- `PUT /api/PaymentMethod/ChangeStatusPayment`: Enable/disable a payment method (admin)

### Invoices
- `POST /api/Invoice/AddInvoice`: Create a new invoice
- `GET /api/Invoice/GetInvoice`: Get invoices
- `GET /api/Invoice/GetDetailInvoice`: Get invoice details

## Screenshots
![Screenshot 2025-04-09 at 21-19-12 React App](https://github.com/user-attachments/assets/0324393f-830f-4df0-94be-348223112ce0)
![Screenshot 2025-04-09 at 21-19-23 React App](https://github.com/user-attachments/assets/1b674755-8e47-4188-9d51-5c540ce30f68)
![Screenshot 2025-04-09 at 21-19-28 React App](https://github.com/user-attachments/assets/5e473932-beaf-4631-8535-abb9fe9664bc)
![Screenshot 2025-04-09 at 21-19-42 React App](https://github.com/user-attachments/assets/696f217f-dc92-473d-957e-579bfd50cb2f)
![Screenshot 2025-04-09 at 21-19-53 React App](https://github.com/user-attachments/assets/54dcfa16-8898-43f1-95b9-1e0e8700fb93)
![Screenshot 2025-04-09 at 21-20-09 React App](https://github.com/user-attachments/assets/aaded384-d8de-4fed-90b1-9d7ab51739f0)
![Screenshot 2025-04-09 at 21-20-04 React App](https://github.com/user-attachments/assets/3d9c940a-2566-4358-bcb9-3f0d6c7af6ad)


