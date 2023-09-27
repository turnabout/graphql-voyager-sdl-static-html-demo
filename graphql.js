const { buildSchema, introspectionFromSchema } = require('graphql');

// Expose the buildSchema and introspectionFromSchema functions from the 'graphql' package to the window object.
window.buildSchema = buildSchema;
window.introspectionFromSchema = introspectionFromSchema;
