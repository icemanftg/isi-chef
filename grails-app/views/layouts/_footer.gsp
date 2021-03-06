<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="span2">
                <h4><g:message code="default.product.label" default="Product"/></h4>
                <ul class="unstyled">
                    <li>
                        <a href="${createLink(uri: '/credits')}"><g:message code="default.credits.label" default="Credits"/></a>
                    </li>
                </ul>
            </div>

            <div class="span2">
                <h4>Company</h4>
                <ul class="unstyled">
                    <li><a href="${createLink(uri: '/about')}"><g:message code="default.about.label"
                                                                          default="About"/></a></li>
                    <li><a href="${createLink(uri: '/contact')}"><g:message code="default.contact.label"
                                                                            default="Contact"/></a></li>
                </ul>
            </div>

            <div class="span8">
                <h4><g:message code="default.information.label" default="Information"/></h4>

                <p><g:message code="default.footer.information"
                              default="Designed and built with Twitter's ${'<a href="http://twitter.github.com/bootstrap/" target="_blank">Bootstrap</a>'}.
				Code licensed under the ${'<a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License v2.0</a>'}.
				Documentation licensed under ${'<a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>'}."/></p>

                <p><g:message code="default.footer.incons.information"
                              default="Icons from ${'<a href="http://glyphicons.com">Glyphicons Free</a>'}, licensed under ${'<a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>'}."/></p>
            </div>
        </div>
        <h4><g:message code="default.footer.disclaimer.label" default="Disclaimer"/></h4>

        <p><g:message code="default.footer.disclaimer1" default="This Web site may contain other proprietary notices and copyright information, the terms of which must be observed and followed.
		Information on this Web site may contain technical inaccuracies or typographical errors. 
		Information may be changed or updated without notice."/>
        </p>

        <p><g:message code="default.footer.disclaimer2" default="The operator and author may also make improvements and/or changes in the products and/or the programs described in this information
		at any time without notice. For documents and software available from this server, the operator and author does not warrant or 
		assume any legal liability or responsibility for the accuracy, completeness, or usefulness of any information,
		apparatus, product, or process disclosed."/>
        </p>

        <p class="pull-right"><a href="#"><g:message code="default.footer.back.message" default="Back to top"/></a></p>
    </div>
</footer>
