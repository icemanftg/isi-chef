<%@ page import="ro.isi.auth.User" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]" default="List ${entityName}"/></title>
</head>

<body>

<section id="list-user" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}"/>

            <g:sortableColumn property="password" title="${message(code: 'user.email.label', default: 'Email')}"/>

            <g:sortableColumn property="accountExpired"
                              title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}"/>

            <g:sortableColumn property="accountLocked"
                              title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}"/>

            <g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}"/>

            <g:sortableColumn property="passwordExpired"
                              title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${userInstanceList}" status="i" var="userInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                <td>${fieldValue(bean: userInstance, field: "email")}</td>

                <td><g:formatBoolean boolean="${userInstance.accountExpired}"/></td>

                <td><g:formatBoolean boolean="${userInstance.accountLocked}"/></td>

                <td><g:formatBoolean boolean="${userInstance.enabled}"/></td>

                <td><g:formatBoolean boolean="${userInstance.passwordExpired}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${userInstanceTotal}"/>
    </div>
</section>

</body>

</html>
