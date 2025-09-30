defmodule NinerJulietAviationWeb.Navigation do
  use Phoenix.Component

  def navbar(assigns) do
    ~H"""
    <nav class="bg-white shadow-md sticky top-0 z-40">
      <div class="container mx-auto px-4 py-3">
        <div class="flex justify-between items-center">
          <div class="flex items-center">
            <a href="/" class="flex items-center">
              <div class="w-12 h-12 bg-blue-600 rounded-full flex items-center justify-center text-white font-bold text-xl mr-3">9JL</div>
              <span class="text-xl font-bold text-gray-800">Niner Juliet Logistics</span>
            </a>
          </div>
          
          <div class="hidden md:flex items-center space-x-8">
            <a href="/" class="nav-link text-gray-700 hover:text-blue-600 transition">Home</a>
            <a href="/about" class="nav-link text-gray-700 hover:text-blue-600 transition">About</a>
            <a href="/services" class="nav-link text-gray-700 hover:text-blue-600 transition">Services</a>
            <a href="/fleet" class="nav-link text-gray-700 hover:text-blue-600 transition">Our Fleet</a>
            <a href="/contact" class="nav-link text-gray-700 hover:text-blue-600 transition">Contact</a>
            <a href="tel:+260965291772" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-full flex items-center">
              <i class="fas fa-phone mr-2"></i> Call Us
            </a>
          </div>
          
          <button id="mobileMenuButton" class="md:hidden text-gray-700 focus:outline-none" onclick="document.getElementById('mobileMenu').classList.toggle('hidden')">
            <i class="fas fa-bars text-2xl"></i>
          </button>
        </div>
      </div>
      
      <div id="mobileMenu" class="mobile-menu hidden md:hidden bg-white w-full absolute left-0 shadow-lg">
        <div class="container mx-auto px-4 py-3">
          <a href="/" class="block py-2 text-gray-700 hover:text-blue-600" onclick="document.getElementById('mobileMenu').classList.add('hidden')">Home</a>
          <a href="/about" class="block py-2 text-gray-700 hover:text-blue-600" onclick="document.getElementById('mobileMenu').classList.add('hidden')">About</a>
          <a href="/services" class="block py-2 text-gray-700 hover:text-blue-600" onclick="document.getElementById('mobileMenu').classList.add('hidden')">Services</a>
          <a href="/fleet" class="block py-2 text-gray-700 hover:text-blue-600" onclick="document.getElementById('mobileMenu').classList.add('hidden')">Our Fleet</a>
          <a href="/contact" class="block py-2 text-gray-700 hover:text-blue-600" onclick="document.getElementById('mobileMenu').classList.add('hidden')">Contact</a>
          <a href="tel:+260965291772" class="block bg-blue-600 text-white py-2 px-4 rounded-full text-center my-2">
            <i class="fas fa-phone mr-2"></i> Call Us
          </a>
        </div>
      </div>
    </nav>
    """
  end
end