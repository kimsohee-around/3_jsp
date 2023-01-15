package org.iclass.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.iclass.vo.NewMember;

import jdbc.util.OracleUtil;

public class NewMemberDao {
	
	public List<NewMember> selectAll() throws SQLException {
		Connection conn = OracleUtil.getConnection();
		String sql ="select * from new_member";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<NewMember> list = new ArrayList<NewMember>();
		while(rs.next()) {
			list.add(NewMember.builder()
						.id(rs.getString(1))
						.name(rs.getString(2))
						.email(rs.getString(4))
						.age(rs.getInt(5))
						.gender(rs.getString(6))
						.hobbies(rs.getString(7))
						.joinDate2(rs.getDate(8))
						.build()
					);
		}
		
		return list;
	}
	

	public int insert(NewMember member) throws SQLException {
		Connection conn = OracleUtil.getConnection();
		String sql = "INSERT INTO new_member \r\n"
				+ "VALUES (?,?,?,?,?,?,?,sysdate)";
		//id,name,password,email,age,gender
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getName());
		pstmt.setString(3, member.getPassword());
		pstmt.setString(4, member.getEmail());
		pstmt.setInt(5, member.getAge());
		pstmt.setString(6, member.getGender());
		pstmt.setString(7, member.getHobbies());
		
		return pstmt.executeUpdate();
	}
}
