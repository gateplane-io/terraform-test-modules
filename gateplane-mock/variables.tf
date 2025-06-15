# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

variable "name" {
  description = "Name of the gate, used in the mount path and generated policies"
}

variable "description" {
  description = "Brief explanation of what access is claimed by this gate"
  default     = ""
}

variable "policy_prefix" {
  default = "gateplane"
}

variable "endpoint_prefix" {
  default = "gp"
}

variable "path_prefix" {
  description = "Where under 'auth/' will the endpoint be mounted"
  default     = "gateplane"
}

variable "token_lease_ttl" {
  description = "The duration that the protected token will be active (e.g.: \"1h\")."
  default     = "30m"
}

variable "plugin_options" {
  description = "Options provided by the plugin, available [in plugin documentation](https://github.com/gateplane-io/vault-plugins)."
  default     = {}
}

variable "plugin_name" {
  default = "gateplane-mock"
}
