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
	
	public int update(NewMember member) throws SQLException {
		Connection conn = OracleUtil.getConnection();
		String sql = "UPDATE new_member \r\n"
				+ "SET email = ?, hobbies = ? \r\n"
				+ "WHERE id = ?";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getEmail());
		pstmt.setString(2, member.getHobbies());
		pstmt.setString(3, member.getId());
		
		return pstmt.executeUpdate();
	}
	
	public int delete(String id) throws SQLException {
		Connection conn = OracleUtil.getConnection();
		String sql ="DELETE FROM new_member  "
				+ "where id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		return pstmt.executeUpdate();
	}
	
	public NewMember selectById(String id) throws SQLException {
		Connection conn = OracleUtil.getConnection();
		String sql ="select * from new_member where id = ?";   //id는 PK -> 1개 행 조회
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		NewMember member = null;
		if(rs.next()) {		//조회 결과가 있다면 객체 생성
			return NewMember.builder()
						.id(rs.getString(1))
						.name(rs.getString(2))
						.email(rs.getString(4))
						.age(rs.getInt(5))
						.gender(rs.getString(6))
						.hobbies(rs.getString(7))
						.joinDate2(rs.getTimestamp(8))   // 필드 형식에 맞춰 변경
						.build();
		}
		
		return member;
		
	}
	
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
						.joinDate2(rs.getTimestamp(8))
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
