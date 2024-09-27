const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const Product = require('../models/product');

// Add Product
adminRouter.post('/admin/add-product', admin, async(req, res) => {
    try {
        const {name, description, images, quantity, price, category} = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        product = await product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({error: error.message});
    }
});

// Get Product
adminRouter.get('/admin/get-products', admin, async (req, res) => {
    try {
       const products = await Product.find({});
       res.json(products);
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});

// Delete Product
adminRouter.post('/admin/delete-product', admin, async (req, res) => {
    try {
        const {id} = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json('All Good!');
    } catch (e) {
        res.status(500).json({error: e.message});
    }
})

module.exports = adminRouter;