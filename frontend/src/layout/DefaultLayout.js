import React from 'react'
import { AppContent, AppSidebar, AppFooter, AppHeader } from '../components/index'
import OrderForm from '../components/OrderForm'

const DefaultLayout = () => {
  return (
    <div>
      <AppSidebar />
      <div className="wrapper d-flex flex-column min-vh-100">
        <AppHeader />
        <div className="body flex-grow-1 px-3">
          {/* Order Form appears here inside the dashboard */}
          <OrderForm />

          {/* Existing dashboard content */}
          <AppContent />
        </div>
        <AppFooter />
      </div>
    </div>
  )
}

export default DefaultLayout
