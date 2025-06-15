# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

variable "entity_groups" {
  description = "The URL of the Vault/OpenBao API."
  default     = {}
  # type = map(object({
  #     quantity = number
  #     policies = list(string)
  #   })
  # )
  # {
  #   "name": {
  #     "quantity": 1,
  #     "policies": ["policy1"]
  #   }
  # }
}

variable "vault_api_url" {
  description = "The URL of the Vault/OpenBao API."
  default     = "http://127.0.0.1:8200/v1"
}
