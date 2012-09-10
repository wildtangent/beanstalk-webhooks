## Beanstalk Webhooks Integration for Pivotal Tracker

## To get started:
* Edit the config/initializers/configuration.rb with your Pivotal Tracker API key
* Deploy the app somewhere public
* Enable Beanstalk webhooks for your server, pointing it to http://your-server.com/commits.json

Once setup, you can format commit messages as specified [here](https://www.pivotaltracker.com/help/api?version=v3#scm_post_commit_message_syntax)

Easily extendable to support other API calls or other services! Fork and be happy!