const schemas = {
  adminUsers: {
    username: { type: String, required: true },
    password: { type: String, required: true },
    apiKey: { type: String, required: true }
  },
  settings: {
    key: { type: String },
    value: { type: Object }
  },
  domains: {
    domain: { type: String, required: true },
    gitSupport: { type: Boolean },
    sslSupport: { type: Boolean }
  },
  cronJobs: {
    command: { type: String, required: true },
    interval: { type: String, required: true }
  }
}

module.exports = schemas
