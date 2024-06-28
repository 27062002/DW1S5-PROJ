<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import = "java.util.List,br.edu.ifsp.arq.ads.model.entities.Animal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jakarta.tags.core -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!-- jakarta.tags.functions -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/home.css">
<title>Adoção - Página principal</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="homeServlet">Adoção</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" href="animal-register.jsp">Animal</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="funcionario-register.jsp">Funcionário</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="adm-register.jsp">Administrador</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Estatísticas</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            ${sessionScope.user.nome}
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">Minha Conta</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="logout">Sair</a></li>
	          </ul>
	        </li>
	      </ul>
	      <form class="d-flex">
	        <input class="form-control me-2" type="search" placeholder="Pesquisar">
	        <button class="btn btn-outline-success" type="submit">Pesquisar</button>
	      </form>
	    </div>
	  </div>
	</nav>
	<div class="container">
		<div class="center col-lg-10 col-sm-12">
			<div class="col-12">
				<h1 class="text-center">Listagem de Animais</h1>
			</div>
			
			<form action="animalSearch" method="post">
				<div class="row">
					<div class="col-12 col-lg-3">
					  	<div class="mb-2">
							<label for="especie">Espécie</label> 
							<select class="form-select"
								name="especie" id="especie">
								<option value="" selected>Selecione</option>
								<option value="CACHORRO">Cachorro</option>
								<option value="GATO">Gato</option>
							</select>
						</div>
					</div>
					
					<div class="col-12 col-lg-3 mt-4">
						<button type="submit" class="btn btn-primary">Filtrar</button>
					</div>  
				</div>
			</form>
			
			
			
			<c:choose>
				<c:when test="${fn:length(animals) > 0}">
					<table class="table table-responsive table-striped table-hover" >
						<tr>
							<th>#</th>
							<th>Nome</th>
							<th>Espécie</th>
							<th>Idade</th>
							<th>Sexo</th>
						</tr>
						<c:forEach var="animal" items="${animals}" varStatus="index">
							<tr>
								<td>${index.count}</td>
								<td>${animal.nome}</td>
								<td>${animal.especie}</td>
								<td>${animal.idade}</td>
								<td>${animal.sexo}</td>
								<td>
									<a class="btn" data-bs-toggle="tooltip" data-bs-placement="top" title="Editar"
                						href="animalRegister?action=update&animal-id=${animal.id}">
                						<img src="img/pencil-square.svg" alt="Editar">
                					</a>
                					<a class="btn" data-bs-toggle="tooltip" data-bs-placement="top" title="Excluir"
                						href="animalRegister?action=delete&animal-id=${animal.id}">
                						<img src="img/trash.svg" alt="Excluir">
                					</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<c:out value="Sem nenhum animal registrado."></c:out>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/home.js"></script>
</body>
</html>