module.exports = (app, upload) => {

    const router = require("express").Router();
    const controller = require("../controllers/front/checkout-controller.js");
  
    router.post("/", controller.payment);
 
    app.use('/api/front/checkouts', router);
};