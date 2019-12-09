// values


//get data

const getAll = () => {

     return 'select * from tbl_profile_user'
}
const getById = (id) => {
    return `select * from tbl_profile_user where user_id = ${id}`
}

//create user
const createUser= (data) => {

    return `INSERT INTO tbl_profile_user(
                                          user_name, 
                                          user_cmnd, 
                                          user_phone, 
                                          user_address, 
                                          user_mail, 
                                          user_password,
                                          user_username
                                         
                                          )
                                  VALUES (
                                          '${data.user_name ? data.user_name : ''}',
                                          '${data.user_cmnd }',
                                          '${data.user_phone ? data.user_phone : ''}',
                                          '${data.user_address ? data.user_address : ''}',
                                          '${data.user_mail ? data.user_mail : ''}',
                                          '${data.user_password ? data.user_password: ''}',
                                          '${data.user_username ? data.user_username: ''}'
                                         
                                  ) ;`
}

const updateById = (id, data) =>{
    let str = ''


    Object.keys(data).forEach(key => {
        if (data[key] === undefined) {
            delete data[key];
        }
    });
    Object.keys(data).forEach(key =>{
        str+=(key + '='+data[key])
        str+=','
    })
    const strIn = str.substring(0,str.length-1)
    console.log(strIn)

    return `UPDATE tbl_profile_user
            SET ${strIn}
            WHERE user_id = ${id};`
}

const deleteById = (id) =>{
    return `DELETE FROM tbl_profile_user WHERE user_id = ${id};`
}
module.exports = {
    getAll,
    getById,
    createUser,
    updateById,
    deleteById,
}