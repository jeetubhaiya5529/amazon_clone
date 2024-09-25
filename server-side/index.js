// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

// IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');

// INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://jkay5529:%23Jkay5529@cluster0.qv6m2.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

// MIDDLEWARE
app.use(express.json());
app.use(authRouter);
app.use(cors({
    origin: '*', 
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization'],
}));
app.use(adminRouter);

// CONNECTIONS
mongoose.connect(DB).then(() => {
    console.log('Connection successful!');
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, () => {
    console.log(`Connected at Port ${PORT}`);
});