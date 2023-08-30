public static int removeBankCard(Connection connection,
                                   int b_c_id, String b_number){

    String sql = "delete from bank_card where b_number = ? and b_c_id = ?";
    PreparedStatement psmt = null;
    int c=0;
    try{
        psmt = connection.prepareStatement(sql);
        psmt.setString(1, b_number);
        psmt.setInt(2, b_c_id);
        c=psmt.executeUpdate();
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    return c;

}
