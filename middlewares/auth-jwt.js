const jwt = require("jsonwebtoken");
const dotenv = require('dotenv').config();
const process = require('process');
const db = require("../models");

verifyUserToken = (req, res, next) => {
    
    if (!req.headers.authorization) {
        return res.status(403).send({
            message: "No se ha entregado el token."
        });
    }

    let token = req.headers.authorization.split(' ')[1];


    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {

        if (err) {
            return res.status(401).send({
                message: "No tiene permiso."
            });
        }

        req.userId = decoded.id;
        next();
    });
};

const authJwt = {
    verifyUserToken: verifyUserToken,
};

module.exports = authJwt;