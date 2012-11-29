node basenode {
  include role::base
}

node webserver {
  include role::webserver
}

node ldapserver {
  include role::ldapserver
}

