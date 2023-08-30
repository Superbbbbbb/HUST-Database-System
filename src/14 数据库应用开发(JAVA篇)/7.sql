public static void insertSC(Connection con, int sno, String col_name, int col_value){
    try {
        PreparedStatement ps = con.prepareStatement("insert into sc values (?, ?, ?)");
        ps.setInt(1, sno);
        ps.setString(2, col_name);
        ps.setInt(3, col_value);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}