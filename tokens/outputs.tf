# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

output "token_map" {
  description = "Vault/OpenBao tokens for the created entities in a per-group manner (<EntityID>:<Token>)"
  value = {
    for user_type in keys(var.entity_groups) :
    user_type => {
      for user_id in local.entity_identifiers :
      vault_identity_entity.this[user_id].id =>
      jsondecode(data.http.authenticate[user_id].response_body)["auth"]["client_token"]
      if user_type == split(":", user_id)[0]
    }
  }
}


output "policy_map" {
  description = "The policies attached to each group in a per-group manner (<EntityID>:<PolicyList>)"
  value = {
    for user_type, user_map in var.entity_groups :
    user_type => user_map["policies"]
  }
}
