
var express = require('express')
var app = express()
/* GET users listing. */
app.route('/')
    .get(function (req, res) {
      res.send('Get a random book')
    })
    .post(function (req, res) {
      res.send('Add a book')
    })
    .put(function (req, res) {
      res.send('Update the book')
    })

app.route('/:id')
    .get(function (req, res) {
        //
        // console.log(req.params.id)
        res.send(`Get a random book ${req.params.id}`)
    })
    .post(function (req, res) {
        res.send('Add a book')
    })
    .put(function (req, res) {
        res.send('Update the book')
    })
module.exports = app;
