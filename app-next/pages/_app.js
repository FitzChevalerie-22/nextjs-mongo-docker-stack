import '../styles/globals.css';
import Head from 'next/head';
import { ThemeProvider } from 'next-themes';
import { SessionProvider } from 'next-auth/react';

function MyApp({ Component, pageProps: { session, ...pageProps } }) {
  return (
    <SessionProvider session={session}>
      <ThemeProvider attribute="class">
        <Head>
          <meta name="viewport" content="width=device-width, initial-scale=1" />
          <title>Mon Application Next.js</title>
        </Head>
        <Component {...pageProps} />
      </ThemeProvider>
    </SessionProvider>
  );
}

export default MyApp;