<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*, java.sql.*, aula_30_outubro.Conexao"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*"%>
		



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LISTAGEM DE ALUNOS</title>
</head>
<body>

<%
	String nome = request.getParameter("nome_aluno");
	String cpf = request.getParameter("cpf_aluno");
	String idade = request.getParameter("idade_aluno");
	
	
	try {
		Connection conn = Conexao.getConexaoMySQL();
		String insert = "INSERT INTO TB_ALUNO (NOME_ALUNO, CPF_ALUNO, IDADE_ALUNO) VALUES (?,?,?)";
		
		PreparedStatement pstm = conn.prepareStatement(insert);
		
		pstm.setString(1, nome);
		pstm.setString(2, cpf);
		pstm.setInt(3, Integer.parseInt(idade));
		pstm.execute();
		pstm.close();
		conn.close();
		
		out.print("SUCESSO!");
	}catch(Exception e){
		out.print("ERRO!" + e);
	}
%>

</body>
</html>