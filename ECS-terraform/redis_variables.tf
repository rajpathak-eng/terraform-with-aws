variable "redis_node_type" {
  description = "The compute and memory capacity of the nodes in the node group"
  type        = string
  default     = "cache.t2.small"
}

variable "redis_num_cache_clusters" {
  description = "The number of cache clusters (primary and replicas) this replication group will have"
  type        = number
  default     = 2
}

variable "redis_engine_version" {
  description = "The version of the Redis engine to use"
  type        = string
  default     = "7.0"
}

variable "redis_port" {
  description = "The port number on which each of the cache nodes will accept connections"
  type        = number
  default     = 6379
}
