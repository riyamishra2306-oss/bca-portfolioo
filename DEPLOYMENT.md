 # Deployment Guide

## 🚀 Deploy Your Portfolio

### Option 1: Deploy Backend to Heroku

#### Prerequisites
- Heroku account (free at https://www.heroku.com)
- Heroku CLI installed
- Git installed

#### Steps

**1. Login to Heroku**
```bash
heroku login
```

**2. Create Heroku App**
```bash
cd backend
heroku create your-portfolio-app
```

**3. Set Environment Variables**
```bash
heroku config:set MONGO_URI=your_mongodb_atlas_connection_string
heroku config:set NODE_ENV=production
```

**4. Create Procfile (if not exists)**
```bash
echo "web: node server.js" > Procfile
```

**5. Deploy**
```bash
git push heroku main
```

**6. View Logs**
```bash
heroku logs --tail
```

Backend URL: `https://your-portfolio-app.herokuapp.com`

---

### Option 2: Deploy Frontend to Netlify

#### Prerequisites
- Netlify account (free at https://www.netlify.com)

#### Steps

**1. Prepare Frontend Files**
```bash
cd frontend
```

**2. Update API Endpoint**
Edit `frontend/js/script.js` and change:
```javascript
const response = await fetch('http://localhost:5000/api/contact', {
```

To:
```javascript
const response = await fetch('https://your-portfolio-app.herokuapp.com/api/contact', {
```

**3. Drag and Drop Deploy**
- Go to https://app.netlify.com
- Drag and drop the `frontend` folder
- Done! Your site is live

Frontend URL: `https://your-site-name.netlify.app`

---

### Option 3: Deploy to AWS

#### Using Elastic Beanstalk (Backend)

**1. Install AWS CLI**
```bash
pip install awsebcli --upgrade --user
```

**2. Initialize Application**
```bash
cd backend
eb init -p "Node.js 18" my-portfolio --region us-east-1
```

**3. Create Environment**
```bash
eb create production
```

**4. Set Environment Variables**
```bash
eb setenv MONGO_URI=your_mongodb_uri
eb setenv NODE_ENV=production
```

**5. Deploy**
```bash
eb deploy
```

---

### Option 4: Deploy to DigitalOcean (Full Stack)

#### Using App Platform

**1. Create Account** at https://www.digitalocean.com

**2. Push to GitHub**
```bash
git init
git add .
git commit -m "Initial commit"
git push origin main
```

**3. Connect Repository**
- Create DigitalOcean App Platform project
- Connect your GitHub repository
- Configure build command: `npm install && cd backend && npm install`
- Configure start command: `cd backend && npm start`

**4. Add MongoDB**
- Use DigitalOcean's managed MongoDB
- Or update `.env` to use MongoDB Atlas

**5. Deploy**
- DigitalOcean will auto-deploy on git push

---

### Option 5: Docker Deployment

#### Create Docker Image

**1. Dockerfile for Backend**
```dockerfile
# backend/Dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5000

CMD ["node", "server.js"]
```

**2. Build Image**
```bash
cd backend
docker build -t portfolio-backend .
```

**3. Run Container**
```bash
docker run -p 5000:5000 -e MONGO_URI=your_uri portfolio-backend
```

**4. Push to Docker Hub**
```bash
docker tag portfolio-backend your-username/portfolio-backend
docker push your-username/portfolio-backend
```

---

## 📊 Environment Setup for Production

### Update .env for Production
```
PORT=5000
NODE_ENV=production
MONGO_URI=mongodb+srv://user:password@cluster.mongodb.net/portfolio
FRONTEND_URL=https://your-frontend-url.com
```

### Security Checklist
- [ ] Use environment variables (never commit secrets)
- [ ] Enable MongoDB authentication
- [ ] Use HTTPS everywhere
- [ ] Set CORS to specific frontend domain
- [ ] Add rate limiting to API
- [ ] Enable security headers

### Add Rate Limiting
```bash
npm install express-rate-limit
```

Then in `server.js`:
```javascript
const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});

app.use('/api/contact', limiter);
```

---

## 🔄 CI/CD Pipeline with GitHub Actions

### Create `.github/workflows/deploy.yml`
```yaml
name: Deploy Portfolio

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Deploy to Heroku
      uses: akhileshns/heroku-deploy@v3.12.12
      with:
        heroku_api_key: ${{secrets.HEROKU_API_KEY}}
        heroku_app_name: "your-portfolio-app"
        heroku_email: "your-email@example.com"
```

---

## 📈 Monitoring & Maintenance

### Monitor Application
- **Heroku Dashboard**: https://dashboard.heroku.com
- **DigitalOcean Dashboard**: https://cloud.digitalocean.com
- **AWS Console**: https://console.aws.amazon.com

### View Logs
```bash
# Heroku
heroku logs --tail

# DigitalOcean
doctl apps logs list
```

### Update Code
```bash
git push origin main  # Automatically deploys
```

---

## 💰 Cost Estimates (Monthly)

| Service | Cost | Notes |
|---------|------|-------|
| Heroku | Free - $7 | Free tier available |
| Netlify | Free | Unlimited static sites |
| MongoDB Atlas | Free - $15 | Free tier with limits |
| DigitalOcean | $5 - $20 | Simple pricing |
| AWS | Free - $50+ | Free tier available |

---

## 🆘 Deployment Troubleshooting

### Heroku Deploy Fails
```bash
# Check build logs
heroku logs --tail

# Restart
heroku restart

#  Clear cache and redeploy
git push heroku main --force
```

### MongoDB Connection Error in Production
- Whitelist server IP in MongoDB Atlas
- Verify connection string is correct
- Check MONGO_URI environment variable

### CORS Issues After Deployment
Update `FRONTEND_URL` in server.js:
```javascript
const corsOptions = {
  origin: [
    'https://your-frontend-url.com',
    'https://your-site-name.netlify.app'
  ]
};
```

---

## 📚 Additional Resources

- [Heroku Documentation](https://devcenter.heroku.com)
- [Netlify Docs](https://docs.netlify.com)
- [DigitalOcean Guide](https://www.digitalocean.com/help)
- [AWS Documentation](https://docs.aws.amazon.com)
- [MongoDB Atlas Guide](https://docs.atlas.mongodb.com)

---

**Choose a deployment option above and get your portfolio live! 🎉**
