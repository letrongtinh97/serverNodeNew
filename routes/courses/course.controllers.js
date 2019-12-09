
var express = require('express')
var app = express()
const db = require('../../models/db')
const queries = require('./course.models')
const statusOut = require('../../models/status')
/* GET users listing. */
app.route('/')
    .get( (req, res,next) => {
        db.postgre
            .run(queries.getAll())
            .then((rs)=>{
                return res.status(200).json(
                    statusOut.success(rs.rows)
                )
            })
            .catch(()=>{
                return res.status(500).json(
                    statusOut.errorAll()
                )
            })
    })
    .post((req, res, next) => {

        const  { mcourse_name,mcourse_content,mcourse_pre,mcourse_date,mcourse_salary } = req.body
        const data = {
            mcourse_name,mcourse_content,mcourse_pre,mcourse_date,mcourse_salary
        }
        db.postgre
            .run(queries.createUser(data))
            .then((rs)=>{
                return res.status(200).json(statusOut.success())
            })
            .catch((rs)=>{
                return res.status(500).json(statusOut.errorAll())
            })
    })
    .put((req, res) => {
        res.send('Put no use')
    })

app.route('/:id')
    .get((req, res) => {
        db.postgre
            .run(queries.getById(req.params.id))
            .then((rs)=> {
                return res.status(200).json(statusOut.success(rs.rows))
            })
            .catch(()=>{
                return res.status(500).json(statusOut.errorAll())
            })
    })
    .post((req, res) => {
        res.send('no use post')
    })
    .put((req, res) =>{
        const {user_name, user_cmnd, user_phone, user_address, user_mail, user_password, user_username} = req.body

        const data = {
            user_name,
            user_cmnd,
            user_phone,
            user_address,
            user_mail,
            user_password,
            user_username
        }
        console.log(queries.updateById(req.params.id,data))
        db.postgre
            .run(queries.updateById(req.params.id,data))
            .then((rs)=> {
                return res.status(200).json(statusOut.success(rs.rows))
            })
            .catch(()=>{
                return res.status(500).json(statusOut.errorAll())
            })
    })
    .delete((req, res) =>{
        db.postgre
            .run(queries.deleteById(req.params.id))
            .then((rs)=> {
                return res.status(200).json(statusOut.success(rs.rows))
            })
            .catch(()=>{
                return res.status(500).json(statusOut.errorAll())
            })
    })


module.exports = app;
