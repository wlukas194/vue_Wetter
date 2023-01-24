# vue_Wetter

## Creator 

```sh
    Laurin Brinkmann 32892 Lukas Wessbecher 33294
```

## Architecture

```sh
  The main.js file starts the src/App.vue, which acts as a "controller" and accesses the ./assets/background and ./assets/icons to load the individual images/icons. 
  It also pulls in the website`s styles from the ./style/style.css.
  Additionally, elements outside of the page, such as the title and title icon, are also controlled in the index.html.
```

## CodeCopy

```sh
  getDate() function is partly copied but adapted to our needs.
```


## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Project Setup

```sh
  npm install
```

### Compile and Hot-Reload for Development

```sh
  npm run dev
```

### Compile and Minify for Production

```sh
  npm run build
```

## How to use vue_wetter

```sh
  Type the cityname in the search box to get your weather.
```

## How to use HttpTrigger

```sh
  url: https://vue-wetter-function.azurewebsites.net/api/HttpTrigger1?code=xAhdIlTIy9JKn45KVg8wRogjXan4tST6BEFQ5OWkqDPPAzFuepDTLQ==
  Use POST
  Format JASON
  Parameter Format: {"string": "asdf"}

  That Trigger-Function takes a String and will cast it in Type Base64.

  testtool: https://reqbin.com/
  There you can test the Trigger. On that Webside you can paste in our url and choose POST. After that you go on the Content Tap and use that Format {"string": "asdf"} in that tap.
  Press send and you will get a result.
```