# Full Stack Portfolio Website

A modern, responsive portfolio website with a beautiful frontend and a backend API for contact form submissions.

## Features

### Frontend
- Responsive design with smooth scrolling
- Gradient UI with animations
- Mobile-friendly
- Navigation bar with hamburger menu
- Contact form with validation

### Backend
- Express.js server with REST API
- SQLite database integration (file-based, no server setup)
- Form validation (server-side)
- CORS enabled
- Contact message storage
- Admin stats endpoint
- Message status management (new, responded, archived)

### Database
- SQLite stored in `backend/data/portfolio.db`
- Contact table with timestamps
- Indexed fields for performance

## Project Structure

```
portfolio-website/
├── frontend/
│   ├── index.html
│   ├── css/
│   │   └── styles.css
│   └── js/
│       └── script.js
├── backend/
│   ├── server.js
│   ├── package.json
│   ├── .env
│   ├── .env.example
│   ├── config/
│   │   └── sqlite.js
│   └── routes/
│       └── contact.js
└── README.md
```

## Getting Started

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn

### Installation

#### 1. Open the project
```bash
cd portfolio-website
```

#### 2. Backend setup
```bash
cd backend

# Install dependencies
npm install

# Create .env file (copy from .env.example if needed)
# Edit .env for SQLITE_PATH if you want a different location

# Start the backend server
npm start

# For development with auto-reload:
npm run dev
```

Backend will run on `http://localhost:5000`.

#### 3. Frontend setup

The frontend is static and can be served in multiple ways:

**Option A: Using Python (Python 3)**
```bash
cd frontend
python -m http.server 3000
```

**Option B: Using Node.js & http-server**
```bash
npm install -g http-server
cd frontend
http-server -p 3000 -c-1
```

**Option C: Using VS Code Live Server**
- Install "Live Server" extension in VS Code
- Right-click on `index.html` -> "Open with Live Server"

Frontend will run on `http://localhost:3000`.

#### Optional: Serve frontend from backend (single URL)
You can serve the frontend directly from the Express backend so you only need to run the backend server. After starting the backend (`npm start`) open:

```
http://localhost:5000/
```

This will serve the `frontend/index.html` and all static assets, and the contact API will be available at `http://localhost:5000/api/contact`.

#### 4. Access the Website
Open your browser and go to: `http://localhost:3000`.

## SQLite Notes

- No separate database server is required.
- The database file is created automatically at `backend/data/portfolio.db`.
- To change location, update `SQLITE_PATH` in `backend/.env`.

## API Endpoints

### POST - Submit Contact Form
```
POST /api/contact
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "message": "Hello, I would like to work with you..."
}
```

### GET - Get All Contacts (Admin)
```
GET /api/contact/all?status=new&limit=10&skip=0
```

### GET - Get Single Contact
```
GET /api/contact/:id
```

### GET - Get Statistics
```
GET /api/contact/stats/overview
```

### PUT - Update Contact Status
```
PUT /api/contact/:id
Content-Type: application/json

{
  "status": "responded",
  "read": true
}
```

### DELETE - Delete Contact
```
DELETE /api/contact/:id
```

## Form Validation

### Frontend Validation
- Name: 2-50 characters
- Email: valid format
- Message: 10-1000 characters

### Backend Validation
- Same validation rules applied on server
- Inputs are trimmed and normalized

## Dependencies

### Backend
- express
- sqlite3
- cors
- dotenv
- nodemon (dev)

### Frontend
- Pure HTML, CSS, and vanilla JavaScript

## Troubleshooting

### SQLite File Not Created
```
Solution:
1. Ensure the backend server started successfully
2. Check write permissions in backend/data
3. Verify SQLITE_PATH in .env
```

### CORS Error
```
Solution:
1. Ensure backend is running on port 5000
2. Frontend must be on http://localhost:3000
3. Check CORS configuration in server.js
4. Try clearing browser cache
```

### Form Not Submitting
```
Solution:
1. Open browser console (F12)
2. Check for errors
3. Verify backend is running
4. Check network tab in DevTools
```

### Port Already in Use
```
Solution:
# Find and kill process using the port
# Windows:
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Mac/Linux:
lsof -i :5000
kill -9 <PID>
```

## License

This project is licensed under the MIT License.
