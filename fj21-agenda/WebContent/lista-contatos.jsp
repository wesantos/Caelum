<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:import url="cabecalho.jsp"/>
	
	
	<!-- Cria DAO -->
	<!-- <jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao" /> -->

	<table border="1">

		<tr bgcolor='00008B	'>
			<td>Nome</td>
			<td>Email</td>
			<td>Endereço</td>
			<td>Nascimento</td>

		</tr>

		<!-- percorre contatos montando as linhas da tabela -->
		<c:forEach var="contato" items="${contatos}">


			<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }">
				<td>${contato.nome }</td>
				<td>
					<c:if test="${not empty contato.email}">
						<a href="mailto:${contato.email }">${contato.email }</a>
					</c:if>
					
					<c:if test="${empty contato.email }">
						E-mail não informado
					</c:if> 
				</td>
				<td>${contato.endereco }</td>
				<td> <fmt:formatDate value="${contato.dataNascimento.time}"
							pattern="dd/MM/yyyy" /> </td>
							
				<td> 
				<a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a>
				</td>
				
			</tr>

		</c:forEach>
	</table>
	<c:import url="rodape.jsp" />
</body>
</html>