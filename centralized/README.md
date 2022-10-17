# Summary

Centralized terraform repo is a strategy where every environment is its own module maintained by single huge project.

* Easy to work with
* A LOT of variables
* Hard to refactor throughout environments
* Shared providers versions
* Terraform apply can be looong and the statefile grows very large.