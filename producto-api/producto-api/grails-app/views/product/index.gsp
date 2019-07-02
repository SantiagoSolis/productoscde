<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Buscar Producto</title>
        <style>
            .btn-Crear{
                display: block;
                height: 30px;
                width: 10%;
                border: 1px solid #000000;
                text-decoration: none;
                border-radius: 5px;
                border-color: #28a745;
                text-align: center;
                line-height: 26px;
                color: #28a745;
            }
            .btn-Crear:hover{
                background-color:#28a745;
                color:#FFFFFF;
            }
            .bg-light {
                background-color: #333333 !important;
            }
        </style>
    </head>
    <body>
    <nav class="navbar navbar-light bg-light justify-content-between">
        <g:link class="create btn-Crear" action="create" >Agregar nuevo producto</g:link>
        <g:form name="buscar" controller="product" class="form-inline" action="index" method="GET" style="float: center;">
            <g:textField class="form-control mr-sm-2" name="filter" placeholder="Buscar Producto" />
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" action="index" name="buscar">Buscar</button>
        </g:form>
    </nav>
    <div class="container">
        <h3 style="text-align: center;">Caso de prueba productos</h3>
            <div class="fieldcontain">
                <label>Buscar Productos</label>
            </div>
        <div>
        </div>
        <div id="list-product" class="content scaffold-list" role="main" >
            <f:table  collection="${productList}" properties="id, nombre, cantidad, descripcion, precio " />
            <div class="pagination">
                <g:paginate total="${productCount ?: 0}" />
            </div>
        </div>
    </div>
    </body>
</html>