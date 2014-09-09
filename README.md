# Phabricator cookbook
A chef cookbook for [Phabricator](http://phabricator.org) testing.

**This is not ment for production deployments!**.

It uses php's built-in webserver which isn't suitable for any meaningful task except testing.

# Prerequisites
- You should have [Bundler](http://bundler.io) installed
- Also needed are Ruby (1.9+), [Virtualbox](http://www.virtualbox.org) and [Vagrant](http://www.vagrantup.com).

# Installation
- Clone this repository and `cd` into the created directory
- `$ bundle install`
- Add the hostname defined by `node['phabricator']['domain']` to your `/etc/hosts` file since Phabricator needs a valid domain to work correctly. The default is `phabricator.local`:
```
$ sudo -- sh -c "echo 127.0.0.1 phabricator.local >> /etc/hosts"
```
- `$ bundle exec kitchen converge`

# Usage
Once the installation is complete you can access Phabricator at

http://phabricator.local:7000

or the domain you chose to use by setting `node['phabricator']['domain']`.
