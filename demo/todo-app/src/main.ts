import { createApp } from 'vue'
import App from './App.vue'
import { router } from './router'
import './index.css'

const app = createApp(App)
app.use(router)
app.mount('#app')

// Set the document title based on the environment
const environment = import.meta.env.VITE_ENVIRONMENT || 'Development'
document.title = `${environment}: Todo App`