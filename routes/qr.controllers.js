const express = require('express')
const app = express()
const QRCode = require('qrcode')
const statusOut = require('../models/status')

const middleWare = (req, res, next) => {

}
app.router('/',middleWare(), async (req, res, next) => {
    try {
        const data = await QRCode.toDataURL(req.body)
        return res.status(200).json(statusOut.success(data))
    } catch (e) {
        return res.status(200).json(statusOut.errorAll())
    }
})
module.exports = {
    generateQR,
    middleWare
}