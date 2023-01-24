<template>
  <div id="main-page" :class="{ 'warm': typeof weather_Objekt.main !== 'undefined' && weather_Objekt.main.temp > 25,
  'cold': typeof weather_Objekt.main !== 'undefined' && weather_Objekt.main.temp < 13 }">
    <!-- V- :class sets the right background, matching to the right temp. if its between 12 - 26 the default background will be shown-->
    <main>
      <div class="header">
        <h1>Lass dir dir das Wetter einer bliebigen Stadt anzeigen!</h1>
      </div>
      <div class="search-box">
        <input
            type="text"
            class="search-bar"
            placeholder="Bitte geben Sie eine Stadt ein!"
            v-model="modelBind"
            @keypress="getWeather"
        />
      </div>
      <!-- V-model directly binds the data input to modelBind, which is needed for data request of getWeather()-->

      <div class="weather-wrap" v-if="typeof weather_Objekt.main != 'undefined'">
        <div class="loc_box">
          <div class="loc">{{weather_Objekt.name}}, {{weather_Objekt.sys.country}}</div>
          <div class="date">{{getDate()}}</div>
        </div>

        <div class="weather_box">
          <div class="temp">{{Math.round(weather_Objekt.main.temp)}}°c</div>
          <div class="weather_condition">{{weather_Objekt.weather[0].main}}</div>
          <div class="weather_icon" v-bind:class="getIcon()"></div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {/* data that is needed for the API request */
      api_key: 'c64dcb50920070242c5bf284de3d4efd',
      url: 'https://api.openweathermap.org/data/2.5/',
      modelBind: '',
      weather_Objekt: {},
    }
  },
  methods: {
    getWeather(input) {/* openweather API https://openweathermap.org*/
      if (input.key == "Enter") {
        fetch(`${this.url}weather?q=${this.modelBind}&units=metric&APPID=${this.api_key}`)
            .then(res => {
              return res.json();
            }).then(this.setResults);
      }
    },
    setResults(results) {
      this.weather_Objekt = results;
    },
    getDate() { /* Teilweise aus einem Forum, aber auf unsere Bedurfnisse angepasst.*/
      let dateObject = new Date();
      let months = ["Januar", "Februar", "März", "April", "Mai", "Juni", "July", "August", "September", "Oktober", "November", "Dezember"];
      let days = ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"];

      let day = days[dateObject.getDay()];
      let date = dateObject.getDate();
      let month = months[dateObject.getMonth()];
      let year = dateObject.getFullYear();

      return `${day} den, ${date}. ${month}. ${year}`;
    },
    getIcon() {
      switch (this.weather_Objekt.weather[0].main) {
        case 'Clear':
          return 'icon_clear'
        case 'Clouds':
          return 'icon_clouds'
        case 'Rain':
          return 'icon_rain'
        case 'Mist':
          return 'icon_mist'
        default:
          return 'icon_clear'
      }
    }
  }
}
</script>

<style>
@import "style/style.css";
</style>
