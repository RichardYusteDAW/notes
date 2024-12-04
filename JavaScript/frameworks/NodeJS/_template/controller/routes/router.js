// controller/routes/router.js
const router = require('express').Router();

// Import routes
const userRoutes = require('./userRoutes');
const movieRoutes = require('./movieRoutes');
const directorRoutes = require('./directorRoutes');
const actorRoutes = require('./actorRoutes');

// Mount routes
router.use('/user', userRoutes);
router.use('/movie', movieRoutes);
router.use('/director', directorRoutes);
router.use('/actor', actorRoutes);

module.exports = router;