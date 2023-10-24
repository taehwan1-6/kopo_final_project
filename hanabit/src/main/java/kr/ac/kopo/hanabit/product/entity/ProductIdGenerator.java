package kr.ac.kopo.hanabit.product.entity;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class ProductIdGenerator implements IdentifierGenerator {

	@Override // annotation 추가
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws
		HibernateException { // 수정
		String prefix = "p";
		Connection connection = session.connection();
		try {
			Statement statement = connection.createStatement();

			ResultSet rs = statement.executeQuery("select count(product_code) as Id from hb_products");

			if (rs.next()) {
				int id = rs.getInt(1) + 1;
				String generatedId = prefix + new Integer(id).toString();
				System.out.println("Generated Id: " + generatedId);
				return generatedId;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
