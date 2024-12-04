const { response, request } = require('express');

const getUser = (req = request, res = response) => {

    // req.query: get parameters from URL
    const { q = "", name = 'No name', apikey, page = 1, limit } = req.query;

    res.json({
        msg: 'get API - controller',
        q,
        name,
        apikey,
        page,
        limit
    });
}

const postUser = (req = request, res = response) => {

    // req.body: get parameters from body
    const { name, age } = req.body;

    res.json({
        msg: 'post API - controller',
        name,
        age
    });
}

const putUser = (req = request, res = response) => {

    // req.params: get parameters from URL
    const { id } = req.params;

    res.json({
        msg: 'put API - controller',
        id
    });
}

const patchUser = (req = request, res = response) => {
    res.json({
        msg: 'patch API - controller'
    });
}

const deleteUser = (req = request, res = response) => {
    res.json({
        msg: 'delete API - controller'
    });
}



module.exports = { getUser, postUser, putUser, deleteUser, patchUser }