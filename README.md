# Test project

The purpose of this project is to trace down the issue
[angular/angular#5731](https://github.com/angular/angular/issues/5731).

### Usage

install npm and jspm packages

```
npm i && jspm i
```

bundle angular to have a faster test execution

```
npm run bundle
```

run the tests

```
npm test
```

The tests should print out 1 2 3.