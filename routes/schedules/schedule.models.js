// values


//get data

const getAll = () => {

    return 'select * from tbl_schedule'
}
const getById = (id) => {
    return `select * from tbl_schedule where schedule_id = ${id}`
}

//create user
const createUser= (data) => {

    return ` INSERT INTO tbl_schedule(...)
                                            values
                                            (
                                                '${data.mcourse_name ? data.mcourse_name : null}',
                                                '${data.mcourse_content ? data.mcourse_content : null}',
                                                '${data.mcourse_pre ? data.mcourse_pre : null}',
                                                '${data.date ? data.date : ""}',
                                                '${data.mcourse_salary ? data.mcourse_salary : null}'
                                            )
                                            RETURNING;`
}

const updateById = (id, data) => {
    let str = ''


    Object.keys(data).forEach(key => {
        if (data[key] === undefined) {
            delete data[key];
        }
    });
    Object.keys(data).forEach(key =>{
        str+=(key + `='`+data[key])+`'`
        str+=','
    })
    const strIn = str.substring(0,str.length-1)
    //console.log(strIn)

    return `UPDATE tbl_schedule
            SET ${strIn}
            WHERE schedule_id = ${id};`
}

const deleteById = (id) =>{
    return `DELETE FROM tbl_schedule WHERE schedule_id = ${id};`
}
module.exports = {
    getAll,
    getById,
    createUser,
    updateById,
    deleteById,
}