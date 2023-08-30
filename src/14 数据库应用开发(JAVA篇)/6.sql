public static boolean transferBalance(Connection connection,
                             String sourceCard,
                             String destCard, 
                             double amount){

    PreparedStatement psmt = null;
    ResultSet rs1 = null;
    ResultSet rs2 = null;
        
    try{
        connection.setAutoCommit(false);
        psmt = connection.prepareStatement("select * from bank_card where b_number = ?");
        psmt.setString(1, sourceCard);
        rs1 = psmt.executeQuery();
        psmt = connection.prepareStatement("select * from bank_card where b_number = ?");
        psmt.setString(1, destCard);
        rs2 = psmt.executeQuery();        
        if(!rs1.next()||!rs2.next()){
            connection.rollback();
            return false;
        }
        double balance = rs1.getDouble("b_balance");
        String type1 = rs1.getString("b_type");
        String type2 = rs2.getString("b_type");
        if(type1.equals("信用卡")||balance<amount){
            connection.rollback();
            return false;
        }
        psmt = connection.prepareStatement("update bank_card set b_balance = b_balance-? where b_number = ?");
        psmt.setDouble(1, amount);
        psmt.setString(2, sourceCard);
        psmt.addBatch();
        psmt.setDouble(1, type2.equals("信用卡")?amount:0-amount);
        psmt.setString(2, destCard);
        psmt.addBatch();
        psmt.executeBatch();
        connection.commit();

    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
                
    return true;
}