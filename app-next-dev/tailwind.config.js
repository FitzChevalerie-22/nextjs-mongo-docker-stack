module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
    "./node_modules/flowbite-react/**/*.js",
    "./public/**/*.html",
  ],
  theme: {
    extend: {
      transitionProperty: {
        'width': 'width'
      },
    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}
