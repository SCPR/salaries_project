## Salaries Project

Originally hosted at <http://kpcc.org/specials/salaries>.

### Dependencies
* Rails 3.2.8
* SQLite
* Kaminari for pagination

### Deployment

media:

    cap deploy

dev2:

    cap staging deploy

### Running Locally

Generate a secret token (`rake secret`) and place it in `config/app_config.yml` (you will need to create this file):

   secret_token: {your token}

