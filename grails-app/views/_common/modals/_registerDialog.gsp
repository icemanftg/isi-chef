<div class="modal hide" id="RegisterModal">
    <g:formRemote novalidate="novalidate" class="form-horizontal" method="post" id="register_form" name="register_form"
                  url="[controller: 'register', action: 'registerr']"
                  onSuccess="alert('success')" onComplete="alert('complete')">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">x</button>

            <h3><g:message code="security.register.title"/></h3>
        </div>

        <div class="modal-body">
            <div class="control-group">
                <label class="control-label"
                       for="username">${message(code: 'security.firstname.label', default: 'Firstname')}</label>

                <div class="controls">
                    <input type="text" class="span3 input-xlarge" name="username" id="username"
                           placeholder="${message(code: 'security.username.label', default: 'Username')}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"
                       for="email">${message(code: 'security.email.label', default: 'Email')}</label>

                <div class="controls">
                    <input type="text" class="span3" name="email" id="email"
                           placeholder="${message(code: 'security.email.label', default: 'Email')}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"
                       for="password">${message(code: 'security.password.label', default: 'Password')}</label>

                <div class="controls">
                    <input type="password" class="span3" name="password" id="password"
                           placeholder="${message(code: 'security.password.label', default: 'Password')}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"
                       for="password2">${message(code: 'security.password.confirm.label', default: 'Confirm')}</label>

                <div class="controls">
                    <input type="password" class="span3" name="password2" id="password2"
                           placeholder="${message(code: 'security.password.confirm.label', default: 'Confirm')}">
                </div>
            </div>
            %{--<div class="control-group">--}%
            %{--<%--			<label class="control-label" for="agreement">${message(code: 'security.agreement.label', default: 'I have read and agree with the Terms of Use.')}</label>--%>--}%
            %{--<div class="controls">--}%
            %{--<label class="checkbox" for="agreement">--}%
            %{--<input type="checkbox" value="" name="agreement" id="agreement" >--}%
            %{--${message(code: 'security.agreement.label', default: 'I have read and agree with the Terms of Use.')}--}%
            %{--</label>--}%
            %{--</div>--}%
            %{--</div>--}%
        </div>

        <div class="modal-footer">
            <button type="submit" class="btn btn-primary"><g:message code="security.register.label"/></button>
            <g:submitToRemote class="btn btn-primary"><g:message code="security.register.label"/></g:submitToRemote>
        </div>
    </g:formRemote>
</div>

<r:script>
    $(document).ready(function () {
        $('#register_form').validate({
            rules:{
                username:{
                    required:true,
                    minSize:5
                },
                email:{
                    email:true,
                    required:true
                },
                password:{
                    required:true
                },
                password2:{
                    required:true

                }
            },
            highlight:function (label) {
                $(label).closest('.control-group').addClass('alert alert-error');
            },
            success:function (label) {
                label.addClass('valid').closest('.control-group').addClass('successClass');
            }
        });
    });
</r:script>

