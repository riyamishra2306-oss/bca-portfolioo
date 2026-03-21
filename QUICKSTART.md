# Portfolio Website - Quick Start Guide

## 🚀 Fast Setup (5 Minutes)

### Step 1: Install Dependencies
```bash
cd portfolio-website
npm install
cd backend
npm install
```

### Step 2: Ensure MongoDB is Running
```bash
# Windows
net start MongoDB

# Mac (if installed via Homebrew)
brew services start mongodb-community

# Or use MongoDB Atlas (cloud) - update MONGO_URI in .env
```

### Step 3: Start Frontend + Backend (Single Command)
```bash
# From portfolio-website folder
cd ..
npm start

# Output should show:
# ╔═══════════════════════════════════════╗
# ║   Portfolio Server Running!           ║
# ║   Port: 5000                         ║
# ...
```

### Step 4: Open Portfolio in Browser
Go to: `http://localhost:3000/index.html`

Backend API runs at: `http://localhost:5000`
 
## ✅ Test It Works

1. **Fill out the contact form** on your portfolio
2. **Submit** - you should see a success message
3. **Check MongoDB** to verify data was saved

## 📊 Verify Backend is Running

Open another terminal and run:
```bash
curl http://localhost:5000/api/health
```

Should return:
```json
{
  "status": "Server is running",
  "timestamp": "2024-02-25T..."
}
```

## 🗄️ View Data in MongoDB

### Using MongoDB Compass (GUI)
1. Download MongoDB Compass
2. Connect to: `mongodb://localhost:27017`
3. Browse database → Collections → View contacts

### Using MongoDB Shell
```bash
mongosh

# Then:
use portfolio
db.contacts.find()
```

## 🎨 Customize Your Portfolio

Edit these files:
- **Content**: `frontend/index.html`
- **Styles**: `frontend/css/styles.css`
- **Logic**: `frontend/js/script.js`

Update with:
- Your name, email, phone
- Project descriptions
- Skill list
- Profile information

## 🔗 File Locations

```
📁 portfolio-website/
  📄 README.md                    ← Full documentation
  📄 QUICKSTART.md                ← This file
  📁 frontend/
    📄 index.html                 ← Portfolio HTML
    📁 css/
      📄 styles.css               ← All styling & animations
    📁 js/
      📄 script.js                ← Form logic & interactions
  📁 backend/
    📄 server.js                  ← Express server
    📄 package.json               ← Dependencies
    📄 .env                       ← Configuration
    📁 config/
      📄 db.js                    ← MongoDB connection
    📁 models/
      📄 Contact.js               ← Database schema
    📁 routes/
      📄 contact.js               ← API endpoints
```

## 💾 Environment Setup

The `.env` file is already configured for local MongoDB:
```
PORT=5000
NODE_ENV=development
MONGO_URI=mongodb://localhost:27017/portfolio
```

**To use MongoDB Atlas instead:**
1. Create account: https://www.mongodb.com/cloud/atlas
2. Get connection string
3. Update `MONGO_URI` in `.env`

## 🐛 Common Issues

| Problem | Solution |
|---------|----------|
| Can't connect to MongoDB | Install MongoDB or use Atlas cloud |
| Backend won't start | Check port 5000 is free: `netstat -ano \| findstr :5000` |
| Form doesn't submit | Check browser console (F12) for errors |
| Styles look wrong | Clear browser cache (Ctrl+Shift+Del) |
| CORS errors | Backend and frontend must both be running |

## 📡 API Endpoints Quick Reference

```bash
# Submit contact form
POST http://localhost:5000/api/contact
{
  "name": "Your Name",
  "email": "email@example.com",
  "message": "Your message here..."
}

# Get all submissions
GET http://localhost:5000/api/contact/all

# Get statistics
GET http://localhost:5000/api/contact/stats/overview

# Health check
GET http://localhost:5000/api/health
```

## 🎯 Next Steps

1. ✅ Get it running (follow setup above)
2. 🎨 Customize with your information
3. 📸 Add your projects and skills
4. 🚀 Deploy to Heroku, Vercel, or your hosting
5. 🔗 Add your own domain name

## 📚 Full Documentation

For complete details on features, customization, deployment, and troubleshooting, see `README.md`

## ✨ Features Overview

- ✅ Beautiful responsive design
- ✅ Contact form with validation
- ✅ MongoDB database integration
- ✅ Express REST API
- ✅ Smooth animations
- ✅ Mobile-friendly
- ✅ Well-documented code
- ✅ Production-ready

---

**You're all set! 🎉 Start coding your portfolio!**
