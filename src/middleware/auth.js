const jwt = require ('jsonwebtoken')

const authMiddleware = (req, res, next) => {
    const authHeader = req.header('Authorization');

    if (!authHeader){
        res.status(401).send('No esta autorizado, necesita un token.');
        return;
    }

    const token = authHeader.replace('Bearer ', '');

    try{
        const decoded = jwt.verify(token, process.env.JWT_SECRET);

        req.user = decoded;   

        next();
    } catch (error) {
        res.status(401).send('El token no es valido o ha expirado.');
    }
};

module.exports = authMiddleware;
