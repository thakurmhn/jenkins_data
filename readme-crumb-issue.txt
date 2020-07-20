Troubleshooting: Githooks throwing 403 forbidden errors?

Hey, there!

There's a chance your githooks won't trigger correctly with 403 erros. This is due to a jenkins major upgrade, which modified something called CSRF in Jenkins, that protects you against DOS attacks.

Info:

https://jenkins.io/doc/upgrade-guide/2.176/#SECURITY-626

Resolution:

* Install a plugin named Strict Crumb Issue

* Go to Manage Jenkins -> Configure Global Security -> CSRF Protection.

* Select Strict Crumb Issuer.

* Click on Advanced.

* Uncheck the Check the session ID box.

* Save it.

It should look like this:
