# GraphQL Voyager + SDL input + Static HTML demo

---

## **IMPORTANT: FIX**
The fix was pretty simple actually. The issue was in this part of the `<script>` tag:

```javascript
const data = window.introspectionFromSchema(window.buildSchema(sdl));

GraphQLVoyager.renderVoyager(document.getElementById('voyager'), {
    introspection: data
});
```

`renderVoyager` expects `data` to be nested under a `data` key. In other words, the fix is:

```javascript
const data = { data: window.introspectionFromSchema(window.buildSchema(sdl)) };
```
---

Demo replicating an issue with usage of GraphQL Voyager on a static HTML page, using an existing SDL input string rather than creating an introspection query.

View the demo running at https://turnabout.github.io/graphql-voyager-sdl-static-html-demo/

View issue "[How to use a schema instead of an introspection query in index.html?](https://github.com/graphql-kit/graphql-voyager/issues/355)" on GraphQL Voyager's GitHub repository for more details.

## Running the demo locally
Requires Docker and Make.

```bash
make serve
```

If you make changes to `graphql.js`, you'll need to run:

```bash
make set-up     # (Install Node.js dependencies)
make browserify # (Generate `graphql.bundle.js`)
```

to re-generate `graphql.bundle.js` (which is the file used by `index.html`).

