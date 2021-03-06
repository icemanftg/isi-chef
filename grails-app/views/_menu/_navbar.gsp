<div id="Navbar" class="navbar navbar-fixed-top navbar-inverse">
    <div class="navbar-inner">
        <div class="container">
            <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <a class="brand" href="${createLink(uri: '/')}">
                <img class="logo" src="${resource(dir: 'kickstart/img', file: 'grails.png')}"
                     alt="${meta(name: 'app.name')}"/>
                ${meta(name: 'app.name')}
                <small>v${meta(name: 'app.version')}</small>
            </a>

            <div class="nav-collapse">

                <ul class="nav">
                    <sec:ifAnyGranted roles="${ro.isi.auth.Roles.SUPER}">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message
                                    code="default.browse.label" default="Browse"/> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                                    <li class="controller"><g:link
                                            controller="${c.logicalPropertyName}">${c.fullName.substring(c.fullName.lastIndexOf('.') + 1)}</g:link></li>
                                </g:each>
                            </ul>
                        </li>
                    </sec:ifAnyGranted>
                </ul>

                <div class="pull-left">
                    <%--Left-side entries--%>
                </div>

                <div class="pull-right">
                    <%--Right-side entries--%>
                    <%--NOTE: the following menus are in reverse order due to "pull-right" alignment (i.e., right to left)--%>
                    <g:render template="/_menu/language"/>
                    <g:render template="/_menu/config"/>
                    <g:render template="/_menu/info"/>
                    <g:render template="/_menu/user"/>
                    <sec:ifAnyGranted roles="${ro.isi.auth.Roles.SUPER}">
                        <g:render template="/_menu/admin"/>
                    </sec:ifAnyGranted>
                    <g:render template="/comanda/notificator"/>
                </div>

            </div>

        </div>
    </div>
</div>
