<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Producto')}" />
        <title>Ver Producto</title>
        <style>
        .btn-Crear{
            display: inline;
            padding: 8px;
            width: 74%;
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
        <div style="float: left;">
           %{-- <g:link class="create btn-Crear" action="create" >Agregar nuevo producto</g:link>--}%
            <g:link class="create btn-Crear" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
        </div>
    </nav>
        <div id="show-product" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]"/></h1>
            <<f:display bean="product"/>
            <g:form resource="${this.product}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.product}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>

        </div>
    </body>
</html>
