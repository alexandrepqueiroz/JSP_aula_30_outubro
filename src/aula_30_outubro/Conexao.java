package aula_30_outubro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	public static String status = "Não conectou...";

	public Conexao() {

	}

	public static Connection getConexaoMySQL() {

		Connection connection = null;

		try {

			String driverName = "com.mysql.cj.jdbc.Driver";

			Class.forName(driverName);

			String serverName = "localhost";

			String mydatabase = "aula_30_outubro?serverTimezone=UTC"; 

			String url = "jdbc:mysql://" + serverName + "/" + mydatabase;

			String username = "root"; 

			String password = "1270apc16"; 

			connection = DriverManager.getConnection(url, username, password);

			if (connection != null) {

				status = ("STATUS--->Conectado com sucesso!");

			} else {

				status = ("STATUS--->Não foi possivel realizar conexão");

			}

			return connection;

		} catch (ClassNotFoundException e) { 

			System.out.println("O driver expecificado nao foi encontrado.");

			return null;

		} catch (SQLException e) {

			
			System.out.println("Nao foi possivel conectar ao Banco de Dados.");

			return null;

		}

	}
}
