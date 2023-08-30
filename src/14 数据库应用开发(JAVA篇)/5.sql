public static int passwd(Connection connection,
                             String mail,
                             String password, 
                             String newPass){

    PreparedStatement psmt = null;
    ResultSet rs = null;

    try{
        psmt = connection.prepareStatement("select * from client where c_mail = ?");
        psmt.setString(1, mail);
        rs = psmt.executeQuery();
        if(!rs.next())
            return 2;
            
        psmt = connection.prepareStatement("select * from client where c_mail = ? and c_password = ?");
        psmt.setString(1, mail);
        psmt.setString(2, password);
        rs = psmt.executeQuery();
        if(!rs.next())
            return 3;

        psmt = connection.prepareStatement("update client set c_password = ? where c_mail = ?");
        psmt.setString(1, newPass);
        psmt.setString(2, mail);
        psmt.execute();

    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    return 1;

}