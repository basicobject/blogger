const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    colors: {
      white: "#FFFCF0",
      black: "#100F0F",
      gray: {
        50:  "#F2F0E5",
        100: "#E6E4D9",
        150: "#DAD8CE",
        200: "#CECDC3",
        300: "#B7B5AC",
        500: "#878580",
        600: "#6F6E69",
        700: "#575653",
        800: "#403E3C",
        850: "#343331",
        900: "#282726",
        950: "#1C1B1A"
      },
      red: {
        400: "#D14D41",
        600: "#AF3029"
      },
      orange: {
        400: "#DA702C",
        600: "#BC5215"
      },
      yellow: {
        400: "#D0A215",
        600: "#AD8301"
      },
      green: {
        400: "#879A39",
        600: "#66800B"
      },
      cyan: {
        400: "#3AA99F",
        600: "#24837B"
      },
      blue: {
        400: "#4385BE",
        600: "#205EA6"
      },
      purple: {
        400: "#8B7EC8",
        600: "#5E409D"
      },
      magenta: {
        400: "#CE5D97",
        600: "#A02F6F"
      }
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
