<%@ page import="ro.isi.restaurant.ComandaStatus; ro.isi.restaurant.Comanda" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'comanda.label', default: 'Comanda')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<section id="list-comanda" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <th><g:message code="comanda.label" default="Order"/></th>

            <th><g:message code="comanda.masa.label" default="Masa"/></th>

            <th><g:message code="comanda.waiter.label" default="Waiter"/></th>

            <th><g:message code="comanda.cook.label" default="Cook"/></th>

            <th><g:message code="comanda.operations.label" default="Operations"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${comandaInstanceList}" status="i" var="comandaInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>
                    <g:link controller="comanda" action="show" id="${comandaInstance.id}">
                        ${comandaInstance.id}
                    </g:link>
                </td>
                <td>${fieldValue(bean: comandaInstance, field: "masa.number")}</td>

                <td>${fieldValue(bean: comandaInstance, field: "waiter.username")}</td>

                <td>${fieldValue(bean: comandaInstance, field: "cook.username")}</td>

                <td>
                    <div class="left">
                        <g:link class="btn btn-small btn-info" action="show" id="${comandaInstance.id}">
                            ${message(code: 'default.button.show.label', default: 'Show')}
                        </g:link>
                    </div>
                    <g:if test="${drinks == true}">
                        <div class="left">
                            <g:form controller="comanda" action="deliverDrink" style="margin: 0px">
                                <input type="hidden" name="orderId" value="${comandaInstance.id}">
                                <g:submitButton name="submit" class="btn btn-small btn-inverse"
                                                value="${message(code: 'comanda.drinks.label', default: 'Deliver drink')}"/>

                            </g:form>
                        </div>
                    </g:if>
                    <g:if test="${comandaInstance.status.equals(ComandaStatus.DELIVERED)}">
                        <div class="left">
                            <g:link class="btn btn-small btn-warning" action="nota" id="${comandaInstance.id}">
                                ${message(code: 'nota.label', default: 'Nota')}
                            </g:link>
                        </div>
                    </g:if>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <g:if test="${!drinks}">
        <div class="pagination">
            <bs:paginate total="${comandaInstanceTotal}"/>
        </div>

    </g:if>
</section>

</body>

</html>
