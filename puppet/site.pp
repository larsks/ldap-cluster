node basenode {
  include role::base
}

node webserver inherits basenode {
  include role::webserver
}

node ldapserver inherits basenode {
  include role::ldapserver
}

