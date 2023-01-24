<template>
  <div id="main-page" :class="{ 'warm': typeof weather.main !== 'undefined' && weather.main.temp > 25,
  'cold': typeof weather.main !== 'undefined' && weather.main.temp < 13 }">

    <main>
      <div class="search-box">
        <input
            type="text"
            class="search-bar"
            placeholder="Bitte geben Sie eine Stadt ein!"
            v-model="modelBind"
            @keypress="getWeather"
        />
      </div>

      <div class="weather-wrap" v-if="typeof weather.main != 'undefined'">
        <div class="location-box">
          <div class="location">{{weather.name}}, {{weather.sys.country}}</div>
          <div class="date">{{getDate()}}</div>
        </div>

        <div class="weather-box">
          <div class="temp">{{Math.round(weather.main.temp)}}°c</div>
          <div class="weather-condition">{{weather.weather[0].main}}</div>
          <div class="wetter-icon" v-bind:class="getIcon()"></div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      api_key: 'c64dcb50920070242c5bf284de3d4efd',
      url_base: 'https://api.openweathermap.org/data/2.5/',
      modelBind: '',
      weather: {},
    }
  },
  methods: {
    getWeather(input) {
      if (input.key == "Enter") {
        fetch(`${this.url_base}weather?q=${this.modelBind}&units=metric&APPID=${this.api_key}`)
            .then(res => {
              return res.json();
            }).then(this.setResults);
      }
    },
    setResults(results) {
      this.weather = results;
    },
    getDate() {
      let dateObject = new Date();
      let months = ["Januar", "Februar", "März", "April", "Mai", "Juni", "July", "August", "September", "Oktober", "November", "Dezember"];
      let days = ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"];

      let day = days[dateObject.getDay()];
      let date = dateObject.getDate();
      let month = months[dateObject.getMonth()];
      let year = dateObject.getFullYear();

      return `${day} den, ${date} ${month} ${year}`;
    },
    getIcon() {
      switch (this.weather.weather[0].main) {
        case 'Clear':
          return 'icon-clear'
        case 'Clouds':
          return 'icon-clouds'
        case 'Rain':
          return 'icon-rain'
        default:
          return 'icon-clear'
      }
    }
  }
}
</script>

<style>
@import "style/style.css";
</style>
