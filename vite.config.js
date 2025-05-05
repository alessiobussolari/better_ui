import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "vite";

export default defineConfig({
  base: "/",
  plugins: [tailwindcss()],
  build: {
    outDir: "test/dummy/app/assets/builds/",
    lib: {
      entry: "app/javascript/application",
      name: "application",
      formats: ["es"],
      fileName: () => `application.js`,
    },
  },
});
