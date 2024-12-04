const { Router } = require('express');
const { getUser, postUser, putUser, deleteUser, patchUser } = require('../handlers/userHandler');
const { getUserMiddleware, postUserMiddleware, putUserMiddleware, deleteUserMiddleware, patchUserMiddleware } = require('../middlewares/userMiddleware');

const router = Router();

// router.method('path', middleware, controller);
router.get('/', getUserMiddleware, getUser);
router.post('/', postUserMiddleware, postUser);
router.put('/:id', putUserMiddleware, putUser);
router.delete('/:id', deleteUserMiddleware, deleteUser);
router.patch('/', patchUserMiddleware, patchUser);

module.exports = router;