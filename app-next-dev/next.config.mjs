// next.config.mjs
export default {
    webpack: (config, { dev }) => {
      if (dev) {
        config.watchOptions = {
          poll: 2000,
          aggregateTimeout: 300,
        };
      }
      return config;
    },
  };