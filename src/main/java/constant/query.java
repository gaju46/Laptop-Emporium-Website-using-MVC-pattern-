package constant;

public interface query {
	String INSERT_QUERY = "insert into user"
			+ "(firstName,lastName,username,birthday,gender,phoneNumber,email,password)"
			+ " values(?,?,?,?,?,?,?,?)";
	String SELECT_ALL_QUERY = "select count(*) from user";
	String CHECK_USER_EXISTENCE_QUERY = "select username,email,phoneNumber from user";
}
