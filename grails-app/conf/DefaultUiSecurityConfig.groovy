/* Copyright 2009-2012 SpringSource.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
security {
	ui {
		register {
			emailBody = '''\
Hi $user.username,<br/>
<br/>
You (or someone pretending to be you) created an account with this email address.<br/>
<br/>
If you made the request, please click&nbsp;<a href="$url">here</a> to finish the registration.
Salut  $user.username,<br/>
<br/>
Tu (sau cineva pretinzand ca esti tu) a creat un cont cu acest email.<br/>
<br/>
Daca nu tu ai facut aceasta solicitare te rugam sa ignori acest mesaj; nu a fost facuta nici p modificare.<br/>
<br>
Daca vrei sa creezi contul, atunci apasa <a href="$url">aici</a>
'''
			emailFrom = 'do.not.reply@localhost'
			emailSubject = 'New Client/Client nou'
			defaultRoleNames = ['ROLE_CLIENT']
			postRegisterUrl = null // use defaultTargetUrl if not set
		}

		forgotPassword {
			emailBody = '''\
Hi $user.username,<br/>
<br/>
You (or someone pretending to be you) requested that your password be reset.<br/>
<br/>
If you didn't make this request then ignore the email; no changes have been made.<br/>
<br/>
If you did make the request, then click <a href="$url">here</a> to reset your password.
<br><hr><br/>
Salut  $user.username,<br/>
<br/>
Tu (sau cineva pretinzand ca esti tu) a solicitat ca parola sa fie resetata.<br/>
<br/>
Daca nu tu ai facut aceasta solicitare te rugam sa ignori acest mesaj; nu a fost facuta nici p modificare.<br/>
<br>
Daca vrei sa resetezi parola, atunci apasa <a href="$url">aici</a>

'''
			emailFrom = 'do.not.reply@localhost'
			emailSubject = 'Password Reset/Resetare parola'
			postResetUrl = null // use defaultTargetUrl if not set
		}
	}
}
