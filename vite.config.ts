import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { imagetools } from "vite-imagetools";

// https://vite.dev/config/
export default defineConfig({
  server: {
    host: "0.0.0.0",
  },
  plugins: [
    imagetools({
      defaultDirectives: new URLSearchParams(
        // https://github.com/JonasKruckenberg/imagetools/blob/main/docs/directives.md
        {
          w: "1536",
          h: "1536",
          fit: "inside",
          withoutEnlargement: "",
          format: "webp",
        }
      ),
    }),
    react(),
  ],
});
