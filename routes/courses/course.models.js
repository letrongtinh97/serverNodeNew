// values


//get data

const getAll = () => {

    return 'select * from tbl_master_course'
}
const getById = (id) => {
    return `select * from tbl_master_course where mcourse_id = ${id}`
}

//create user
const createUser= (data) => {

    return ` INSERT INTO tbl_master_course(
                                                mcourse_name,
                                                mcourse_content,
                                                mcourse_pre,
                                                mcourse_date,
                                                mcourse_salary
                                            )
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

const updateById = (id, data) =>{
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

    return `UPDATE tbl_master_course
            SET ${strIn}
            WHERE mcourse_id = ${id};`
}

const deleteById = (id) =>{
    return `DELETE FROM tbl_master_course WHERE mcourse_id = ${id};`
}
module.exports = {
    getAll,
    getById,
    createUser,
    updateById,
    deleteById,
}