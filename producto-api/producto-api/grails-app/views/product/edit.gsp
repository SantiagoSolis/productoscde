<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Producto')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
        <a href="#edit-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <nav class="navbar navbar-light bg-light justify-content-between">
        <div style="float: left;">
            <g:link class="create btn-Crear" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
        </div>
    </nav>
        <div id="edit-product" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form resource="${this.product}" method="PUT">
                <g:hiddenField name="version" value="${this.product?.version}" />
                <fieldset class="form">
                    <f:all bean="product"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
