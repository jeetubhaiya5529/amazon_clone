const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require('jsonwebtoken');
const auth = require("../middlewares/auth");
const authRouter = express.Router();

// SIGN UP
authRouter.post('/api/signup', async (req, res) => {
    try {
        console.log('Signup request received:', req.body);
        // get the data from client
        const {username, email, password} = req.body;

        // check if the user already exist
        const existingUser = await User.findOne({email});
        if(existingUser) {
            return res.status(400).json({msg: "User with same email already exist"});
        }
        // Hash the Password
        const hashedPassword = await bcryptjs.hash(password, 8);

        // create a new user
        let user = new User({
            email,
            password : hashedPassword,
            username,
        })
        // Save the user to the database
        const savedUser = await user.save();

        // Return the saved user data (excluding password for security)
        res.status(201).json({
            id: savedUser._id,
            username: savedUser.username,
            email: savedUser.email,
        });
    } catch (e) {
        console.error(e); 
        res.status(500).json({error: e.message});
    }
});

//SIGN IN
authRouter.post('/api/signin', async (req, res) => {
    try {
        const {email, password} = req.body;

        const user = await User.findOne({email});
        if (!user) {
            return res.status(400).json({msg: 'User with this email does not exist!'});
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if(!isMatch) {
            return res.status(400).json({msg: 'Incorrect Password!'});
        }

        const token = jwt.sign({id: user._id}, "passwordKey");
        res.json({token, ...user._doc}) // ... object destructuring

    } catch (e) {
        res.status(500).json({error: e.message});
    }
});

authRouter.post("/tokenIsValid", async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if(!token) return res.json(false);
        const verified = jwt.verify(token, 'passwordKey');
        if(!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});

//get user data
authRouter.get('/', auth, async (req, res) =>  {
    const user = await User.findById(req.user);
    res.json({...user._doc, token: req.token});
})

module.exports = authRouter;