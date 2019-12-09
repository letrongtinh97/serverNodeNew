let rs = null
const success = (rs) =>{
    return {
        code: 0,
        data: rs
    }
}
const errorAll = () => {
    return {
        code: 1
    }
}

module.exports = {
    success,
    errorAll
}