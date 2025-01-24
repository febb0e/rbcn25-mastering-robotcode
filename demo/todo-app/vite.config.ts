import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => {
  return {
    plugins: [vue()],
    base: '',
    server: {
      port: mode === 'development' ? 3000 : 3001
    }
  }
})
