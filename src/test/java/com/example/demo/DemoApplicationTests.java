package com.example.demo;

import static org.junit.Assert.assertEquals;

import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.jdbc.Sql;

@Sql({"schema.sql", "test-data.sql"})
class DemoApplicationTests extends AbstractIntegrationTest {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Test
	void contextLoads() {
		String query = "SELECT * FROM EMPLOYEE WHERE ID = 1";
		Map<String, Object> oneEmployee = jdbcTemplate.queryForMap(query);
		assertEquals("James", oneEmployee.get("FIRST_NAME").toString());
	}

}
