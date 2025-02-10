import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig(({ }) => {
  const environment = process.env.VITE_ENVIRONMENT || 'Development'
  const port = environment === 'Test' ? 3000 : 3001

  return {
    plugins: [vue()],
    base: '',
    server: {
      port: port
    }
  }
})
