public static int insertClient(Connection connection,int c_id, String c_name, String c_mail,String c_id_card, String c_phone,String c_password){
        String sql = "insert into client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) values (?,?,?,?,?,?)";
    PreparedStatement ptmt = null;
    try{
        ptmt = connection.prepareStatement(sql);
        ptmt.setInt(1, c_id);
        ptmt.setString(2, c_name);
        ptmt.setString(3, c_mail);
        ptmt.setString(4, c_id_card);
        ptmt.setString(5, c_phone);
        ptmt.setString(6, c_password);
        ptmt.execute();
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    return 0;
}