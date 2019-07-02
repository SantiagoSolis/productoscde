<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Producto')}" />
        <title><g:message code="default.create.label" args="[producto]" /></title>
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
            <g:link class="create btn-Crear" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
        </div>
    </nav>
        <div id="create-product" class="content scaffold-create" role="main">
            <h1><g:message code="default.add.label" args="[entityName]" /></h1>
            <g:form resource="${this.product}" method="POST">
                <fieldset class="form">
                    <f:all class="form-control" bean="product"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
